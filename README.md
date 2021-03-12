# geodummy
## A really minimal WFS server

This guy is supposed to act as geoServer while you don't want to bother with setting up a real one.
It will append POSTed geojson to a file and will respond to any GET with the contents of said file.

**WARNING** This is so very much not intended for production, it may adversely affect neighboring systems when used in such a way.
