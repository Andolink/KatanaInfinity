draw_set_color(c_white)
draw_rectangle(-1,-1,room_width,room_height,true)

cursor_x_visual = lerp(cursor_x_visual,cursor_x,0.4)
cursor_y_visual = lerp(cursor_y_visual,cursor_y,0.4)
cursor_xsc		= lerp(cursor_xsc,object_xscale,0.4)


if grab
{}
else if placing_ele = -1
{
	if selection_state > 0 && selection_state < 3
	{
		draw_set_color(c_yellow)
		draw_rectangle(mouse_x0,mouse_y0,
		mouse_x1,mouse_y1,1)
	}
}
else if placing_ele = 0 //Object
{
	if placing_col
	{
		draw_set_color(c_red)
		draw_rectangle(mouse_x0,mouse_y0,
		mouse_x1,mouse_y1,1)
	}
	else if placing_platform
	{
		draw_set_color(c_red)
		draw_rectangle(mouse_x0,mouse_y0,
		mouse_x1,mouse_y1,1)
	}
	else
	{
		draw_sprite_ext(current_object[ledit_obj_info_sprite],0,
		cursor_x_visual+current_object[ledit_obj_info_offx]*cursor_xsc,cursor_y_visual+current_object[ledit_obj_info_offy],
		object_xscale,1,0,c_white,.5)
	}
}
else if placing_ele = 1 //Tileset
{
	var x__ = 0
	var y__ = 0
	repeat(tilset_yselect)
	{
		repeat(tilset_xselect)
		{
			var lay_id = layer_get_id(tilset_edit);
			var map_id = layer_tilemap_get_id(lay_id);
			var tls_id = tilemap_get_tileset(map_id)
			var data = tilemap_get(map_id, 0, 0);
			data = tile_set_index	(data,tilset_index+x__+(tilset_width*y__))
			data = tile_set_mirror	(data,tilset_mirror)
			data = tile_set_flip	(data,tilset_flip);
			data = tile_set_rotate	(data,tilset_rotate)
		
			draw_tile(tls_id, data, 0, cursor_x_visual+x__*16, cursor_y_visual+y__*16)
			x__++
		}
		x__ = 0
		y__++
	}
	
	
}