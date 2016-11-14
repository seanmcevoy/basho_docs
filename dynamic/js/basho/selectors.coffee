###
Project and Version Selector Generation and Interaction
=======================================================
Requires sem-ver.coffee

This file defines a series of calls and callbacks that apply to the generation
of and interaction with the .selectors__list--project and
.selectors__list--versions elements.

The root-level .selectors div will be generated as part of the Hugo compilation,
but the project and version list will not. We don't want every generated HTML
file within a project/version to be modified every time a new version of that
(or any other) project is released, so we've chosen to upload the project lists
and version information as JSON to our server and dynamically generate the lists
at load-time.

Interaction will involve,
  * Setting `display: block` on the project or version list (depending on what
    has been interacted with), then
  * Shrinking the .content-nav__primary__sizing-box and expanding the
    .content-nav__fixed-top to provide enough space to interact with the given
    selector's list.
  OR
  * Shrinking the .content-nav__fixed-top and expanding the
    .content-nav__fixed-top back to their default sizes, then
  * Setting `display: none` on the previously shown list.
###

#TODO: strict mode enables a pretty large number of runtime checks. We probably
#      want to turn it off when we deploy to prod.
#      Perhaps we can figure out some way to enable it when building debug?
'use strict'


## contentOfMeta :: (Str) -> Str or Undefined
# Fetch the content of a <meta> tag of the given name. If no tag of the given
# name exists, `undefined` is returned.
#TODO: Probably good to move this to a general utilities file
contentOfMeta = (name) ->
  return $('meta[name='+name+']').attr('content')


## generateLists :: () -> None
# Build the Project and Version Selector lists dynamically, using fetched JSON
# and metadata exposed by Hugo through <meta> tags.
# There's no need to fetch the JSON or build this DOM element before the site is
# rendered and interactable, so we're going to wrap the manipulation inside the
# `.getJSON` callback _that's inside_ a `.ready()` callback. Double indirection,
# baby.
#TODO: Consider marking the selectors as inactive until the lists are built.
#      This assumes it will take a substantial amount of time (1s or so) for the
#      element to be created. It should probably also only go invalid when JS is
#      enabled, and stay orange if we're never going to fetch the JSON...
generateLists = () ->
  # Pull project/pathing information from the meta tags set up by Hugo
  project               =  contentOfMeta("project")               # ex; riak_kv
  current_version       =  contentOfMeta("version")               # ex; 2.1.4
  project_relative_path =  contentOfMeta("project_relative_path") # ex; installing/

  # The version_history <meta> tags will only exist if the front matter of the
  # given content .md page contains them, so these may be `undefined`.
  meta_version_hisotry_in = contentOfMeta("version_history_in")
  version_range = undefined
  meta_version_history_locations = contentOfMeta("version_history_locations")
  versions_locations = []

  if meta_version_hisotry_in
    version_range = SemVer.parseRange(meta_version_hisotry_in)

  if meta_version_history_locations
    locations_json = JSON.parse(meta_version_history_locations)
    versions_locations = for [range, path] in locations_json
                         [SemVer.parseRange(range), path]

  # Fetch the Project Descriptions from the server, and do all the heavy lifting
  # inside the `success` callback.
  if project then $.getJSON('/data/project_descriptions.json',
    (data) ->
## Dead code, to be revivified soon.
##      version_selector_list_html = "" # Aggregator for the resulting HTML.
##
##      project_data = data[project]
##
##      project_path = project_data.path            # ex; /riak/kv
##      latest_rel   = project_data.latest          # ex; 2.1.4
##      lts_version  = project_data.lts             # ex; 2.0.7
##      archived_url = project_data['archived_url'] # undefined, or a complete URL
##
##      for release_set, set_index in project_data.releases.reverse()
##        # List depth is used for setting color. Our CSS only has colors from 1
##        # to 6, so cap anything deeper.
##        list_depth = Math.min(6, (set_index+1))
##
##        # We're want to act on the last element of the release set in the below
##        # loop. I can't think of a better way to do that this.
##        last_index = release_set.length - 1
##
##        for release_version, index in release_set.reverse()
##          release_sem_ver = SemVer.parse(release_version)
##
##          # Record if this release_version is within the version_range
##          in_version_range = not version_range or
##                             SemVer.isInRange(release_sem_ver, version_range)
##
##          # Start aggregating class modifiers that will be `.join("\n")`d
##          # together once all modifier have been added.
##          class_list = ["selector__list-element"]
##
##          if in_version_range
##            class_list.push("selector__list-element--"+list_depth)
##          else
##            class_list.push("selector__list-element--disabled")
##
##          if index == 0
##            class_list.push("selector__list-element--top")
##
##          if index == last_index
##            class_list.push("selector__list-element--bottom")
##
##          if release_version == lts_version
##            class_list.push("selector__list-element--lts")
##
##          if release_version == current_version
##            class_list.push("selector__list-element--current")
##
##          # The class list is complete.
##          # Build out the list contents and anchor based on metadata available.
##
##          # If the list element is --disabled or --current it should not include
##          # an active link, so skip giving them an href.
##          anchor_tag = ""
##          if (not in_version_range) or (release_version == current_version)
##            anchor_tag = '<a>'
##          else
##            # Give the versions_locations overrides a change to direct this
##            # release_version to a different project/version-relative url.
##            # If none of the ranges match (or if there are no ranges), default
##            # to the current page's project/version-relative url.
##            relative_path = project_relative_path
##            for [range, url] in versions_locations
##              if SemVer.isInRange(release_sem_ver, range)
##                relative_path = url
##                break
##
##            anchor = project_path+"/"+release_version+"/"+relative_path
##            anchor_tag = '<a href="'+anchor+'">'
##
##          # Build the full list element and add it to the
##          # `version_selector_list_html` aggregator.
##          #TODO: Consider importing a sprintf library.
##          #      Because JS doesn't ship w/ that functionality? For... reasons?
##          version_selector_list_html +=
##              '<li class="'+class_list.join("\n")+'">'+
##                anchor_tag+release_version+'</a>'+
##              '</li>\n'
##
##      # If this project has the optional `archived_url`, add a special "set"
##      # with only a link out to the archived content.
##      if archived_url
##        class_list = ["selector__list-element",
##                      "selector__list-element--6",
##                      "selector__list-element--top",
##                      "selector__list-element--bottom"]
##        version_selector_list_html +=
##          '<li class="'+class_list.join("\n")+'"><a href="'+archived_url+'">older</a></li>\n'
##
##      # What we've all been waiting for; make the DOM modification.
##      $(".version-selector__list").html(version_selector_list_html)
    )


# Cache lookups necessary for the showList and hideList functions.
$nav_fixed_top = $('.content-nav__fixed-top')
$nav_primary   = $('.content-nav__primary__sizing-box')

## showList :: (Element) -> None
##    Where    Element instanceof $
##             Element.hasClass('selectors__list--*')
# Manipulate all the things. Yep. Do that.
showList = ($selector_list) ->
  $nav_fixed_top.height($nav_fixed_top.height() + (7).rem())
  $nav_primary.css('top',
                   ($nav_primary.css('top').toInt() + (7).rem()) + "px")
  $nav_primary.css('padding-bottom',
                   ($nav_primary.css('padding-bottom').toInt() + (7).rem()) + "px")


## hideList :: (Element) -> None
##    Where    Element instanceof $
##             Element.hasClass('selectors__list--*')
# Manipulate all the things. Yep. Do that.
hideList = ($selector_list) ->
  console.log("hiding. height from", $nav_fixed_top.height(), "to", $nav_fixed_top.height() - (7).rem())
  $nav_fixed_top.height($nav_fixed_top.height() - (7).rem())
  $nav_primary.css('top',
                   ($nav_primary.css('top').toInt() - (7).rem()) + "px")
  $nav_primary.css('padding-bottom',
                   ($nav_primary.css('padding-bottom').toInt() - (7).rem()) + "px")



## JQuery .ready() Execution
## =========================
$ ->
  # Build the project and version lists
  # generateLists();

  # Wire up interactions
  $project_selector = $('.selector--project')
  $version_selector = $('.selector--version')
  $project_btn      = $('.selector--project > .selector__btn')
  $version_btn      = $('.selector--version > .selector__btn')
  $project_list     = $('.selectors__list--project')
  $version_list     = $('.selectors__list--version')

  if $project_btn.length
    $project_btn.on('click',
      () ->
        if 0 < $project_selector.attr('class').search(".selector--project--open")
          hideList($project_list)
          $project_selector.removeClass(".selector--project--open")
        else
          showList($project_list)
          $project_selector.addClass(".selector--project--open")
        # Consume the event to prevent propagation.
        false
    )

  if $version_btn.length
    $version_btn.on('click',
      () ->
        if 0 < $version_selector.attr('class').search(".selector--version--open")
          hideList($version_list)
          $version_selector.removeClass(".selector--version--open")
        else
          showList($version_list)
          $version_selector.addClass(".selector--version--open")
        # Consume the event to prevent propagation.
        false
    )

    # When child elements of the list are clicked, nothing should occur. Just
    # return `true` to allow the event to bubble up.
    $project_list.on('click', '.selector__list-element', () -> true )
    $version_list.on('click', '.selector__list-element', () -> true )

    # When the current or a disabled list element is clicked nothing should
    # happen, so return `false` to consume the event.
    $project_list.on('click', '.selector__list-element--disabled', () -> false )
    $version_list.on('click', '.selector__list-element--disabled', () -> false )
    $project_list.on('click', '.selector__list-element--current',  () -> false )
    $version_list.on('click', '.selector__list-element--current',  () -> false )

    # When anything else in the document is clicked, we should hide the list.
    $(document).on('click',
      () ->
        if 0 < $project_selector.attr('class').search(".selector--project--open")
          hideList($project_list)
          $project_selector.removeClass(".selector--project--open")
        else if 0 < $version_selector.attr('class').search(".selector--version--open")
          hideList($version_list)
          $version_selector.removeClass(".selector--version--open")
    )
