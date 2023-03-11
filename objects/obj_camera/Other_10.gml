view_camera[0]	= camera_create()
view_enabled	= true
view_visible[0]	= true
camera			= view_camera[0]
free_mode		= false

camera_size		= 1
camera_width	= GAME_WIDTH
camera_height	= GAME_HEIGHT

camera_set_view_size(camera,camera_width,camera_height)

if instance_exists(obj_level_editor)
|| instance_exists(obj_lvl_pack_manager)
	surface_resize(application_surface,1920,1080)
else
	surface_resize(application_surface,GAME_WIDTH,GAME_HEIGHT)
	
display_set_gui_size(GAME_WIDTH,GAME_HEIGHT)