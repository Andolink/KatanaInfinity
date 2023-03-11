surf = -1
blood_surf = -1
blood_glitch_fix = true

layer_script_begin(layer_get_id("TileSetBack"),function()
{
	#region
	if event_type == ev_draw
	{
		if event_number == 0
		{	
			if !surface_exists(surf)
			{surf = surface_create(room_width,room_height)}
			
			surface_set_target(surf)
			draw_clear_alpha(0,0)
		}
	}
	#endregion
})
	
layer_script_end(layer_get_id("TileSetBack"),function()
{
	#region
	if event_type == ev_draw
	{
		if event_number == 0
		{
			gpu_set_colorwriteenable(1,1,1,0)
			if surface_exists(blood_surf) draw_surface_ext(blood_surf,0,0,1,1,0,c_white,1)
			gpu_set_blendmode(bm_add)
			with obj_light
			{if visible draw_self()}
			gpu_set_blendmode(bm_normal)
			gpu_set_colorwriteenable(1,1,1,1)	
			surface_reset_target()
			if surface_exists(surf) draw_surface(surf,0,0)
		}
	}
	#endregion
})
	
layer_script_begin(layer_get_id("TileSet"),function()
{
	#region
	if event_type == ev_draw
	{
		if event_number == 0
		{
			if !surface_exists(surf)
			{surf = surface_create(room_width,room_height)}
			
			surface_set_target(surf)
			draw_clear_alpha(0,0)
		}
	}
	#endregion
})


layer_script_end(layer_get_id("TileSet"),function()
{
	#region
	if event_type == ev_draw
	{
		if event_number == 0
		{
			gpu_set_colorwriteenable(1,1,1,0)
			gpu_set_blendmode(bm_add)
			with obj_light
			{if visible draw_self()}
			gpu_set_blendmode(bm_normal)
			if surface_exists(blood_surf) draw_surface_ext(blood_surf,0,0,1,1,0,c_white,1)
			gpu_set_colorwriteenable(1,1,1,1)
	       
			surface_reset_target()
			if surface_exists(surf) draw_surface(surf,0,0)
		}
	}
	#endregion
})