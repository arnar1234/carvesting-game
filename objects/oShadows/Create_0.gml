shadowSurface = -1;

_shadow_map_id = layer_get_id("Shadow");
shadowTile = layer_tilemap_get_id(_shadow_map_id);

layer_set_visible(_shadow_map_id, 0);


cx = 0;
cy = 0;