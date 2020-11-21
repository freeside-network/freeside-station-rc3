![Build & deploy](https://github.com/freeside-network/freeside-station-rc3/workflows/Build%20&%20deploy/badge.svg)

Concepts
--------

- The station consists of *maps*.
- *Maps* are made of any number of *layers*. This is the thing a player moves through.
- *Layers* are made of *tiles*
- *Tiles* are defined in *tilesets*, which are a collection of tiles

Style guide
-----------

- Put tilesets in the `/tilesets` dir.
- Put maps in the root dir.
- For any custom sprites or whatever, make a top-level directory.

Layer guide
-----------

This is just how I (s3krit) have been working so far, feel free to change it and
update this guide to reflect your better design.

We have a 'base' layer, on which we put floors and walls.

We have a 'start' layer, on which we put tiles that the player can spawn on.

We have a background layer, which I just fill with space. You can randomly fill
with space by selecting multiple tiles in the tileset, selecting the Bucket Fill
(F) tool, and turning on Random Mode (D).

There are tile layers named like 'objectsAboveX' and 'objectsBelowX'. The 'above'
and 'below' refer to their position above or below the floorLayer, which is the
layer on which the player's sprite moves. Idea being we make as many of these
as we need for a certain floor. So if you want to make a pub, which has tables
with drinks on it, you would need a layer for the tables (objectsBelow0), and
then another layer above it (objectsBelow0), on which you could put the drinks.

Jumping between rooms requires specially named layers - look in main.tmx and
read the guide for examples on how.

Exporting
---------

Requirements for exporting a map for use with RC3:

- It *must not* be infinite (you can uncheck 'infinite' in map properties to make this so)
- It *must* have **EITHER** a layer named `start` on which there are 1 or more
    tiles, **OR** a layer with the custom property `startLayer` of type bool,
    set to true.
- It *must* have an object layer called 'floorLayer'. This represents the layer
    on which the player's sprite will move around.

Exporting and uploading the map to station.freeside.network is handled as part
of our CI job for an commits to `master`. If you want to test on your own
instance... you're on your own (until s3krit can be arsed to make a staging env)
We must have at least a main.json as the start map. See https://howto.rc3.world/maps.html for stuff I missed

Hosting
-------

Our CI will automatically handle building and exporting the JSONs, and uploading
them to station.freeside.network. To access our station, simply point your web
browser at the following internet website address:

https://play.wa-test.rc3.cccv.de/_/global/station.freeside.network/

To host, you need to upload the exported .json files and the ss13-icons directory
to a publicly-accessible HTTPS endpoint with a content-origin policy that lets
https://play.wa-test.rc3.cccv.de access it. Once uploaded, you can access your
room by going to https://play.wa-test.rc3.cccv.de/_/global/your.website.com/main.json
