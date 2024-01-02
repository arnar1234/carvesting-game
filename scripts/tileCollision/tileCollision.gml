function tileCollision()
{
	var _wall_map_id = oRandomGeneration._wall_map_id;
	var bbox_side;
	
	hsp_final = hsp + hsp_f;
	hsp_f = hsp_final - floor(abs(hsp_final))*sign(hsp_final);
	hsp_final -= hsp_f;
 
	vsp_final = vsp + vsp_f;
	vsp_f = vsp_final - floor(abs(vsp_final))*sign(vsp_final);
	vsp_final -= vsp_f;

	//Horizontal Tiles
	if(hsp_final > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	if(tilemap_get_at_pixel(_wall_map_id, bbox_side+hsp_final, bbox_top) != 0) or (tilemap_get_at_pixel(_wall_map_id, bbox_side+hsp_final, bbox_bottom) != 0)
	{
		if(hsp_final > 0) x = x - (x mod 16) + 15 - (bbox_right - x);
		else x = x - (x mod 16) - (bbox_left - x);
		hsp_final = 0;
	}
	x += hsp_final;
	
	//Vertical Tiles
	if(vsp_final > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	if(tilemap_get_at_pixel(_wall_map_id, bbox_left, bbox_side+vsp_final) != 0) or (tilemap_get_at_pixel(_wall_map_id, bbox_right, bbox_side+vsp_final) != 0)
	{
		if(vsp_final > 0) y = y - (y mod 16) + 15 - (bbox_bottom - y);
		else y = y - (y mod 16) - (bbox_top - y);
		vsp_final = 0;
	}
	y += vsp_final;
}