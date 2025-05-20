show_debug_message("Tile conversion run");

var all = layer_get_all();
// 遍历房间里每一条 layer
for (var i = 0; i < array_length(all); i++)
{
    var lid = all[i];
    var lname = layer_get_name(lid);

    // 只处理 Tile Layer，且名字符合前缀
    if (layer_get_type(lid) != layertype_tile) continue;
    
    var tmap = layer_tilemap_get_id(lid);
    var cw   = tilemap_get_cell_width(tmap);
    var ch   = tilemap_get_cell_height(tmap);
    var w    = tilemap_get_width(tmap);
    var h    = tilemap_get_height(tmap);

    // ---------------- tilesolid* → obj_solid ----------------
    if (string_pos("tilesolid", string_lower(lname)) == 1)
    {
        for (var ty = 0; ty < h; ty++)
        for (var tx = 0; tx < w; tx++)
        {
            if (tilemap_get(tmap, tx, ty) != 0)   // 有砖
            {
                var px = tx * cw;
                var py = ty * ch;
                // Origin=Top-Left ；若中心 Origin=0.5*cell
                instance_create_layer(px, py, "Instances", obj_solid);
            }
        }
    }

    // ---------------- tilebreakable* → obj_breakable --------
    else if (string_pos("tilebreakable", string_lower(lname)) == 1)
    {
        for (var ty = 0; ty < h; ty++)
        for (var tx = 0; tx < w; tx++)
        {
	        if (tilemap_get(tmap, tx, ty) != 0)
	        {
	            var px = tx * cw;
	            var py = ty * ch;
	            instance_create_layer(px, py, "Instances", obj_breakable);

	            tilemap_set(tmap, tx, ty, 0);   // ★ 改成 tilemap_set
	        }
        }
    }
}
