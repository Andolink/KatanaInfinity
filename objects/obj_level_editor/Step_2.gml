if instance_exists(obj_ledit_message) exit

cursor_image = 0

if placing_ele = 0
{
	grid_x_size	= current_object[ledit_obj_info_gridx]
	grid_y_size	= current_object[ledit_obj_info_gridy]
}
else
{
	grid_x_size	= 16
	grid_y_size	= 16
}

#region EXCEPTION

if selected_object = "Ground" || selected_object = "Platform"
{object_xscale = 1}

if selected_object = "Slope"
{
	if object_xscale = -1
		current_object[ledit_obj_info_offx] = -16
	else
		current_object[ledit_obj_info_offx] = 0
}

#endregion

cursor_x = floor(clamp(mouse_x,0,room_width-1)/grid_x_size)*grid_x_size
cursor_y = floor(clamp(mouse_y,0,room_height-1)/grid_y_size)*grid_y_size

var mouse_gui_x = device_mouse_x_to_gui(0)
var mouse_gui_y = device_mouse_y_to_gui(0)

if(mouse_gui_x > object_menu_x
|| mouse_gui_x < tilset_menu_x)
&& !placing_col
{
	mouse_on_gui = true
}
else
{
	mouse_on_gui = false
}

if KEY_PRS(vk_alt)
{
	placing_ele	= -1
	placing_col = -1
	grab = -1
	placing_platform = -1
	selection_state = 0
}

if placing_ele	= -1
{
	#region SELECTION SYSTEM
	if grab = -1 && MBT_PRS(mb_left)
	&& selection_state = 0
	{
		selection_state = 1
		
		mouse_xs = cursor_x
		mouse_ys = cursor_y
	
		mouse_x0 = cursor_x
		mouse_y0 = cursor_y
		mouse_x1 = cursor_x
		mouse_y1 = cursor_y
	}
	
	if selection_state = 1
	{
		if mouse_x <= mouse_xs
		{
			mouse_x0 = cursor_x
			mouse_x1 = mouse_xs
		}
		else
		{
			mouse_x0 = mouse_xs
			mouse_x1 = cursor_x
		}
			
		if mouse_y <= mouse_ys
		{
			mouse_y0 = cursor_y
			mouse_y1 = mouse_ys
		}
		else
		{
			mouse_y0 = mouse_ys
			mouse_y1 = cursor_y
		}
		
		if MBT_RLS(mb_left)
		{
			selection_state = 2
		}
	}
	else if selection_state = 2
	{
		if point_in_rectangle(mouse_x,mouse_y,mouse_x0,mouse_y0,mouse_x1,mouse_y1)
			cursor_image = 2
			
		if MBT_PRS(mb_left)
		{
			if point_in_rectangle(mouse_x,mouse_y,mouse_x0,mouse_y0,mouse_x1,mouse_y1)
			{
				level_editor_quick_save()
				var o = other
				with obj_zero_spawn		if collision_rectangle(o.mouse_x0,o.mouse_y0,o.mouse_x1,o.mouse_y1,id,0,0) && visible {globalgrab = true x_dec =x-floor(mouse_x/16)*16 y_dec = y-floor(mouse_y/16)*16}
				with obj_ledit_exit		if collision_rectangle(o.mouse_x0,o.mouse_y0,o.mouse_x1,o.mouse_y1,id,0,0) && visible {globalgrab = true x_dec =x-floor(mouse_x/16)*16 y_dec = y-floor(mouse_y/16)*16}
				with obj_ledit_col		if collision_rectangle(o.mouse_x0,o.mouse_y0,o.mouse_x1,o.mouse_y1,id,0,0) && visible {globalgrab = true x_dec =x-floor(mouse_x/16)*16 y_dec = y-floor(mouse_y/16)*16}
				with obj_ledit_slope	if collision_rectangle(o.mouse_x0,o.mouse_y0,o.mouse_x1,o.mouse_y1,id,0,0) && visible {globalgrab = true x_dec =x-floor(mouse_x/16)*16 y_dec = y-floor(mouse_y/16)*16}
				with obj_ledit_platform	if collision_rectangle(o.mouse_x0,o.mouse_y0,o.mouse_x1,o.mouse_y1,id,0,0) && visible {globalgrab = true x_dec =x-floor(mouse_x/16)*16 y_dec = y-floor(mouse_y/16)*16}
				with obj_ledit_element	if collision_rectangle(o.mouse_x0,o.mouse_y0,o.mouse_x1,o.mouse_y1,id,0,0) && visible {globalgrab = true x_dec =x-floor(mouse_x/16)*16 y_dec = y-floor(mouse_y/16)*16}
				selection_state = 3
			}
			else
			{
				selection_state = 0
			}
		}
	}
	else if selection_state = 3
	{
		cursor_image = 3
		if !MBT(mb_left)
		{
			with obj_zero_spawn		globalgrab = false
			with obj_ledit_exit		globalgrab = false
			with obj_ledit_col		globalgrab = false
			with obj_ledit_slope	globalgrab = false
			with obj_ledit_platform	globalgrab = false
			with obj_ledit_element	globalgrab = false
			selection_state = 0
		}
	}
	#endregion
}
else
{selection_state = 0}

if !MBT(mb_left) && MBT(mb_right) && placing_ele = 0 && !grab
{
	if MBT_PRS(mb_right)
	{level_editor_quick_save()}
	cursor_image = 1
	with obj_ledit_col		if position_meeting(mouse_x,mouse_y,id) && visible {instance_destroy()}
	with obj_ledit_slope	if position_meeting(mouse_x,mouse_y,id) && visible {instance_destroy()}
	with obj_ledit_platform	if position_meeting(mouse_x,mouse_y,id) && visible {instance_destroy()}
	with obj_ledit_element	if position_meeting(mouse_x,mouse_y,id) && visible {instance_destroy()}
}

if KEY_PRS(ord("X")) && !grab
	object_xscale *= -1

if selected_object != "Ground" && selected_object != "Platform" && selected_object != ""
&& MBT(mb_left) 
&& !mouse_on_gui
&& placing_ele = 0
&& !grab
{
	if MBT_PRS(mb_left) level_editor_quick_save()
	
	with instance_create_depth(	cursor_x+current_object[ledit_obj_info_offx]*object_xscale,cursor_y+current_object[ledit_obj_info_offy],
								0,current_object[ledit_obj_info_ledit_index])
	{
		sprite_index	= other.current_object[ledit_obj_info_sprite]
		image_speed		= other.current_object[ledit_obj_info_animated]
		object			= other.current_object[ledit_obj_info_object_index]
		image_xscale	= other.object_xscale
		
		if place_meeting(x,y,obj_ledit_col)
		|| place_meeting(x,y,obj_ledit_element)
		|| place_meeting(x,y,obj_ledit_slope)
		{instance_destroy()}
	}
}

#region TILESET

if !mouse_on_gui
&& placing_ele = 1
 && !grab
{
	var lay_id = layer_get_id(tilset_edit);
	var map_id = layer_tilemap_get_id(lay_id);
	var data = tilemap_get(map_id, 0, 0);
	
	//if KEY_PRS(ord("X")) tilset_mirror	= !tilset_mirror
	//if KEY_PRS(ord("Y")) tilset_flip	= !tilset_flip
	
	if MBT_PRS(mb_left) 
	{
		level_editor_quick_save()
	}
	
	if MBT(mb_left) 
	{
		var x__ = 0
		var y__ = 0
		repeat(tilset_yselect)
		{
			repeat(tilset_xselect)
			{
				data = tile_set_index	(data,tilset_index+x__+(tilset_width*y__))
				data = tile_set_mirror	(data,tilset_mirror)
				data = tile_set_flip	(data,tilset_flip);
				data = tile_set_rotate	(data,tilset_rotate)
			
				tilemap_set(map_id, data, cursor_x/16+x__, cursor_y/16+y__)
				x__++
			}
			x__ = 0
			y__++
		}
	}
	else if MBT(mb_right)
	{
		if MBT_PRS(mb_right)
		{level_editor_quick_save()}
		
		var x__ = 0
		var y__ = 0
		repeat(tilset_yselect)
		{
			repeat(tilset_xselect)
			{
				data = tile_set_empty(data)
		
				tilemap_set(map_id, data, cursor_x/16+x__, cursor_y/16+y__)
				x__++
			}
			x__ = 0
			y__++
		}
	}
}

#endregion

#region PLACE COLLISION

if selected_object = "Ground" && MBT_PRS(mb_left) 
&& !position_meeting(cursor_x,cursor_y,obj_ledit_col) && !mouse_on_gui
&& placing_ele = 0 && !grab
{
	placing_col = true
	
	mouse_xs = cursor_x
	mouse_ys = cursor_y
	
	mouse_x0 = cursor_x
	mouse_y0 = cursor_y
	mouse_x1 = cursor_x+grid_x_size
	mouse_y1 = cursor_y+grid_y_size
}

if MBT(mb_left) && placing_col
{
	if mouse_x <= mouse_xs
	{
		mouse_x0 = cursor_x
		mouse_x1 = mouse_xs + grid_x_size
	}
	else
	{
		mouse_x0 = mouse_xs
		mouse_x1 = cursor_x+16
	}
			
	if mouse_y <= mouse_ys
	{
		mouse_y0 = cursor_y
		mouse_y1 = mouse_ys + grid_y_size
	}
	else
	{
		mouse_y0 = mouse_ys
		mouse_y1 = cursor_y+16
	}	
}

if MBT_RLS(mb_left) && placing_col
{
	level_editor_quick_save()
	with instance_create_depth(mouse_x0,mouse_y0,0,obj_ledit_col)
	{
		object		 = obj_ledit_col
		image_xscale = (other.mouse_x1-x)/16
		image_yscale = (other.mouse_y1-y)/16
		if place_meeting(x,y,obj_ledit_col)
		{instance_destroy()}
	}
	placing_col = false
}

#endregion

#region PLACE PLATFORM

if selected_object = "Platform" && MBT_PRS(mb_left) 
&& !position_meeting(cursor_x,cursor_y,obj_ledit_col) && !mouse_on_gui
&& placing_ele = 0 && !grab
{
	placing_platform = true
	
	mouse_xs = cursor_x
	mouse_ys = cursor_y
	
	mouse_x0 = cursor_x
	mouse_y0 = cursor_y
	mouse_x1 = cursor_x+4
	mouse_y1 = cursor_y+4
}

if MBT(mb_left) && placing_platform
{
	if mouse_x <= mouse_xs
	{
		mouse_x0 = clamp(cursor_x,0,room_width-grid_x_size)
		mouse_x1 = mouse_xs + grid_x_size
	}
	else
	{
		mouse_x0 = mouse_xs
		mouse_x1 = clamp((cursor_x+16),mouse_x0+grid_x_size,room_width)
	}
}

if MBT_RLS(mb_left) && placing_platform
{
	level_editor_quick_save()
	with instance_create_depth(mouse_x0,mouse_y0,0,obj_ledit_platform)
	{
		object		 = obj_ledit_platform
		image_xscale = (other.mouse_x1-x)/16
		image_yscale = 1
		if place_meeting(x,y,obj_ledit_col)
		{instance_destroy()}
	}
	placing_platform = false
}

#endregion