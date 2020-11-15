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

Export the map to json, ideally keeping the same name (i.e. main.tmx -> main.json).
We must have at least a main.json as the start map. See https://howto.rc3.world/maps.html for stuff I missed
