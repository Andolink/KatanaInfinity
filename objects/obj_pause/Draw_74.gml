if ! PAUSE_HAS_GOT_IMAGE
{
	pause_surface = surface_create(GAME_WIDTH,GAME_HEIGHT)
	surface_set_target(pause_surface)
		draw_surface_ext(application_surface,0,0,1,1,0,c_white,1)
	surface_reset_target()
	
	if buffer_exists(pause_surface_buffer) 
		buffer_delete(pause_surface_buffer)
	
	pause_surface_buffer = buffer_create(GAME_WIDTH*GAME_HEIGHT*4,buffer_fixed,1)
	buffer_get_surface(pause_surface_buffer,pause_surface,0)

	instance_deactivate_all(true)
	instance_activate_object(obj_music_control)
	instance_activate_object(obj_global_control)
	instance_activate_object(obj_pause_menu)
	instance_activate_object(obj_option_menu)
	
	PAUSE_HAS_GOT_IMAGE = true
}
