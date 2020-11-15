Concepts
--------

- The station consists of *maps*.
- *Maps* are made of any number of *layers*. This is the thing a player moves through.
- *Layers* are made of *tiles*
- *Tiles* are defined in *tilesets*, which are a collection of tiles

Style guide
-----------

Put tilesets in the `/tilesets` dir. Put maps in the root dir. Maybe don't commit
exported .json maps... we still need to work out how we're gonna auto-export or
'build' the thing for RC3.

Layer guide
-----------

This is just how I (s3krit) have been working so far, feel free to change it and
update this guide to reflect your better design.

We have a 'base' layer, on which we put floors and walls.

We have a 'start' layer, on which we put tiles that the player can spawn on.

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
- Its tilesets *must* be embedded. In this repo, we keep the tilesets separate
    since it allows for easier collab. To embed the tilesets on export, go to:
    Edit, Preferences. Towards the middle is a checkbox that reads 'Embed
    tilesets'. Make sure this is checked.
- It *must* have **EITHER** a layer named `start` on which there are 1 or more
    tiles, **OR** a layer with the custom property `startLayer` of type bool,
    set to true.
- It *must* have an object layer called 'floorLayer'. This represents the layer
    on which the player's sprite will move around.

Export the map to json, ideally keeping the same name (i.e. main.tmx -> main.json).
We must have at least a main.json as the start map. See https://howto.rc3.world/maps.html for stuff I missed
