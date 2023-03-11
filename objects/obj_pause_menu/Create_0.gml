menu_init("------ KATANA ZERO IS PAUSED ------")

if room = rm_level_editor
&& !instance_exists(obj_level_editor)	
{

menu_add_line("RETURN TO EDITING",1,function(){
		instance_activate_all()
		instance_destroy()
		instance_destroy(obj_pause)
		instance_destroy(obj_camera) instance_create_depth(0,0,0,obj_camera)
		level_editor_load("LevelEditor/"+"_autosave")
	})
}

menu_add_line("RESUME",1,function(){
	instance_destroy() 
	instance_destroy(obj_pause)
	if instance_exists(obj_player) instance_deactivate_object(obj_level_editor)
})

if room != rm_level_editor	menu_add_line("RESTART",1,function(){instance_activate_all() instance_destroy(obj_pause) room_restart()})
else if !instance_exists(obj_level_editor) 
	menu_add_line("RESTART",1,function(){
		instance_activate_all() 
		instance_destroy()
		instance_destroy(obj_pause)
		instance_deactivate_object(obj_level_editor)
		level_editor_load("LevelEditor/"+"_autosave")
		level_editor_play()
})
menu_add_line("OPTION",1,function(){instance_destroy() instance_create_depth(0,0,depth-1,obj_option_menu)})
menu_add_line("MAIN MENU",1,function(){game_restart()})
