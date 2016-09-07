---
title_supertext: "Lorem Ipsum"
title: "Nimbi Amorque"
description: ""
project: "sandbox"
project_version: "2.1.4"
menu:
  sandbox-2.1.4:
    name: "Reference"
    identifier: "ref"
    weight: 300
    pre: cloud
version_history:
  in: "2.0.4+"
  locations:
    - ["2.1.0-", "sorry/not/a/vaid/page"]
toc: true
canonical_link: "https://docs.basho.com/riak/kv/latest/developing"
---

Lorem Markdownum

Lorem markdownum, spem citharam pignora ligavit dantem, folio, **videt**
pericula aera, perfectaque fluens nescitve quoque. Auro sua? Volucrum lacrimis,
si vota altaque: inplerit subit quos _manifesta_, dat emisit fixo tribuam
adnuerat, canum.

Auras seraque, impete! [Suos] nuda frustra latuere in armentum animosque Salmaci
debet quo, dat fateri quae riget ait velari. Casses ut `ut meos conpendia`
ducemque in spernit atque, quid iram **montis**, riget mei! Non idem, Trinacris
mirabile _strenua fuit_ premit neque flammas, uno mentis missa. Et plena
famulasque altera, undis bene damna infirmos timendi et subit tibi!

Notus magnosque Iuppiter est domus concipias tellure matrique dextraeque ad
umbra, dicimus gemitum nomina color: `holus`. Illa moveri sim membris prensantem
fert Cupidinis pubis discenda mortis clamor quarum. Tetigere dixit insula suas
ossibus deos _displicet potest_ aequalique novas silvaque. Quae atque, hoc
nubila comes erit viderat **laborum**?

[Diris sibi] ligno, in illa, indetonsusque meum gradus. Quod **cum et per**
illis cognitus ad captat instructo pererrat misere, in. Vulnere adventu tineae
inmensi `moveoque` pugnacem `legumque alas Capitolia obruit`; tanta adversa. Tua
**Iunonis** arsit mora matre adhuc, pendentia; ego pater fuisset omnes, nec
prole prece prohibent arcus in. Toto Hesperium unam turba illic Echo; adit tua
Parin est seduxit utque subiectum haec adolentur levabas, caede, tui.

[Suos]: http://gestasset.com/rupit.aspx
[Diris sibi]: http://locum.com/


## Pangrams

The quick brown fox jumps over the lazy dog

_The quick brown fox jumps over the lazy dog_

**The quick brown fox jumps over the lazy dog**

**_The quick brown fox jumps over the lazy dog_**

  

Pack my box with five dozen liquor jugs.

_Pack my box with five dozen liquor jugs._

**Pack my box with five dozen liquor jugs.**

**_Pack my box with five dozen liquor jugs._**



## An exhibit of Markdown

Sections selectively taken from <http://www.markitdown.net/markdown>

## Lists

### Ordered list

1. Item 1
2. A second item
3. Number 3
    1. Sub-list
    1. They look like this
    1. Going a bit farther
        1. Two levels deep
        1. Second sub-sub-list
        1. Third
        1. And fourth.
            1. four levels deep
                1. five levels deep
    1. One last element
4. Ⅳ

*Note: the fourth item uses the Unicode character for [Roman numeral four][2].*

[2]: http://www.fileformat.info/info/unicode/char/2163/index.htm

### Unordered list

* An item
* Another item
    * Sub-list
    * With a few items
    * And another item
        * Sub-sub-list
        * Only two items
            * four levels deep
                * five levels deep
* Yet another item
* And there's more...

## Quote

> Here is a quote. What this is should be self explanatory. Quotes are automatically indented when they are used.

Lorem markdownum, spem citharam pignora ligavit dantem, folio, **videt**
pericula aera, per fect aque fluens nescitve quoque. Auro sua? Volucrum lacrimis.

## Note Shortcode

{{% note %}}This is a simple Note, generated with the \{\{% note %\}\} shortcode.{{% /note %}}

Lorem markdownum, spem citharam pignora ligavit dantem, folio, **videt**
pericula aera, per fect aque fluens nescitve quoque. Auro sua? Volucrum lacrimis.


{{% note title="Title Text"%}}This is a note with a title, in addition to wrapped text.{{% /note %}}

Lorem markdownum, spem citharam pignora ligavit dantem, folio, **videt**
pericula aera, per fect aque fluens nescitve quoque. Auro sua? Volucrum lacrimis.


## Headings

There are six levels of headings. They correspond with the six levels of HTML headings. You've probably noticed them already in the page. Each level down uses one more hash character.

### Headings *can* also contain **formatting**

Our anchor generation logic is okay with it, too.

### They can even contain `inline code`

Of course, demonstrating what headings look like messes up the structure of the page.

I don't recommend using more than three or four levels of headings here, because, when you're smallest heading isn't too small, and you're largest heading isn't too big, and you want each size up to look noticeably larger and more important, there there are only so many sizes that you can use.

## H2 -- _Italics_, **Emphasis**, and _**Both**_

**Bold text for scale**. Regular text for scale.

### H3 -- _Italics_, **Emphasis**, and _**Both**_

**Bold text for scale**. Regular text for scale.

#### H4 -- _Italics_, **Emphasis**, and _**Both**_

**Bold text for scale**. Regular text for scale.

##### H5 -- _Italics_, **Emphasis**, and _**Both**_

**Bold text for scale**. Regular text for scale.

###### H6 -- _Italics_, **Emphasis**, and _**Both**_

**Bold text for scale**. Regular text for scale.

## URLs

URLs can be made in a handful of ways:

* A named link to [MarkItDown][3].
* Another named link to [MarkItDown](http://www.markitdown.net/)
* Sometimes you just want a URL like <http://www.markitdown.net/>.

[3]: http://www.markitdown.net/

## Horizontal rule

---

A horizontal rule is a line that goes across the middle of the page.

It's sometimes handy for breaking things up.

## Tables

Parameter | Default | Description
:---------|:--------|:-----------
`r` | `quorum` | How many replicas need to agree when retrieving an existing object before the write
`pr` | `0` | How many [vnodes][glossary vnode] must respond for a read to be deemed successful
`notfound_ok` | `true` | If set to `true`, if the first vnode to respond doesn't have a copy of the object, Riak will deem the failure authoritative and immediately return a `notfound` error to the client

[glossary vnode]: /riak/kv/2.1.4/learn/glossary/#vnode

## Code Blocks

A basic, four-spaces indented codeblock;

    GET /types/<type>/buckets/<bucket>/keys/<key>

Same code, using tripple-backtick fences;

```
GET /types/<type>/buckets/<bucket>/keys/<key>
```

Same code, using tripple-backtick fences with an explict language defined;

```curl
GET /types/<type>/buckets/<bucket>/keys/<key>
```

Same code, using tripple-backtick fences with a malformed language defined;

```riak's_curl_thing
GET /types/<type>/buckets/<bucket>/keys/<key>
```

### Tabbed code blocks

Generated using named-fences, one after the other;

```java
// In the Java client, it is best to specify a bucket type/bucket/key
// Location object that can be used as a reference for further
// operations, as in the example below:
Location myKey = new Location(new Namespace("animals", "dogs"), "rufus");
```

```ruby
  Dir.glob("#{$css_source}/*.scss").each do |scss_file_path|
    scss_file_name   = File.basename(scss_file_path)
    output_file_name = scss_file_name.gsub(/\.scss$/, ".css")
    output_file_path = "#{$css_dest}/#{output_file_name}"
    public_file_path = "#{$hugo_dest}/css/#{output_file_name}"

    # If we're running as debug, build the sourcemaps
    if debug
      (css_str, sass_map) = Sass::Engine.for_file(scss_file_path, sass_options)
                            .render_with_sourcemap("#{output_file_name}.map")
      prefixed_results = AutoprefixerRails.process(css_str, {
        :map => {
          :prev => sass_map.to_json({
            :css_path       => public_file_path,
            :sourcemap_path => "#{public_file_path}.map",
          }),
          :inline => false,
        },
        :from => scss_file_path,
        :to   => public_file_path,
        :browsers => autoprefixer_browsers,
      })
```

```php
$response = (new \Basho\Riak\Command\Builder\FetchObject($riak))
  ->buildLocation('rufus', 'users', 'animals')
  ->build()
  ->execute();
```

```python
bucket = client.bucket_type('animals').bucket('dogs')
obj = bucket.get('rufus')
```

```csharp
// Using the Riak .NET Client it is best to specify a bucket type/bucket/key
// RiakObjectId object that can be used as a reference for further
// operations
var id = new RiakObjectId("animals", "dogs", "rufus");
```

```javascript
// Pass in an and array of class names, e.g.:
//  ['no-webp', 'borderradius', ...]
function setClasses(classes) {
  var className = docElement.className;
  var classPrefix = Modernizr._config.classPrefix || '';

  if (isSVG) {
    className = className.baseVal;
  }

  // Change `no-js` to `js` (independently of the `enableClasses` option)
  // Handle classPrefix on this too
  if (Modernizr._config.enableJSClass) {
    var reJS = new RegExp('(^|\\s)' + classPrefix + 'no-js(\\s|$)');
    className = className.replace(reJS, '$1' + classPrefix + 'js$2');
  }

  if (Modernizr._config.enableClasses) {
    // Add the new classes
    className += ' ' + classPrefix + classes.join(' ' + classPrefix);
    isSVG ? docElement.className.baseVal = className : docElement.className = className;
  }

}
```

```erlang
local_get(Index, BKey) ->
    Ref = make_ref(),
    ReqId = erlang:phash2(erlang:now()),
    Sender = {raw, Ref, self()},
    get({Index,node()}, BKey, ReqId, Sender),
    receive
        {Ref, {r, Result, Index, ReqId}} ->
            Result;
        {Ref, Reply} ->
            {error, Reply}
    end.

refresh_index_data(Partition, BKey, IdxData, TimeOut) ->
    riak_core_vnode_master:sync_command({Partition, node()},
                                        {refresh_index_data, BKey, IdxData},
                                        riak_kv_vnode_master,
                                        TimeOut).

%% Issue a put for the object to the preflist, expecting a reply
%% to an FSM.
coord_put(IndexNode, BKey, Obj, ReqId, StartTime, Options) when is_integer(StartTime) ->
    coord_put(IndexNode, BKey, Obj, ReqId, StartTime, Options, {fsm, undefined, self()}).
```

```golang
cmd, err = riak.NewFetchValueCommandBuilder().
  WithBucketType("animals").
  WithBucket("dogs").
  WithKey("rufus").
  Build()
if err != nil {
    // error occurred
}
```

```bash
/usr/bin/env bash

typeset -i WAIT BUCKETS i n rollups
let WAIT=1
let BUCKETS=2
let rollups=0

trap atexit INT
function atexit() {
        echo "!"
        echo "Stopped after $(((80*rollups + n))) uploads."
        exit
}

rm -rf *load_log

echo "Creating $BUCKETS buckets if missing..." | tee mb_load_log
let i=1
while ((i<=BUCKETS)); do
        s3cmd mb s3://hot${i} >> mb_load_log
        let i++
done
```

```coffeescript
# ```parse :: (Str) -> {Num, Num, Num}```
# Convert a semantic version string (ex. `"2.1.4"`) to a version object with
# explicit `major`, `minor`, and `patch` data members.
SemVer.parse = (str) ->
  v = /^[<>]?[=]?(\d+)\.?(\d+)?\.?(\d+)?/.exec(str)
  return {
    major: parseInt(v[1]) || 0
    minor: parseInt(v[2]) || 0
    patch: parseInt(v[3]) || 0
  }
  hi = `function() {
    return [document.title, "Hello JavaScript"].join(": ");
  }`
```

