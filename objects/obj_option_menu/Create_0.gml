menu_init("------ OPTION ------")

menu_add_line("CONTROLS",1,function()
{
	if global.gamepad = -1
		instance_create_depth(0,0,depth-1,obj_control_menu) 
	else
		instance_create_depth(0,0,depth-1,obj_control_gamepad_menu)
	instance_destroy()
})
menu_add_line("GAME",1,function(){instance_create_depth(0,0,depth-1,obj_gameplay_menu) instance_destroy()})
menu_add_line("AUDIO",1,function(){instance_create_depth(0,0,depth-1,obj_audio_menu) instance_destroy()})
menu_add_line("OTHER",1,function(){instance_create_depth(0,0,depth-1,obj_other_menu) instance_destroy()})

menu_add_line("CANCEL",1,function(){
	with obj_title_screen {start=false start_timer = 0} 
	with obj_pause {instance_create_depth(0,0,depth-1,obj_pause_menu)}
	instance_destroy()
})
