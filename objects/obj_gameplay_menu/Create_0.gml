menu_init("------ GAMEPLAY ------")

menu_add_line("FULLSCREEN",0,"fullscreen")
menu_add_line("SCREENSHAKE",2,"scrshake_lvl")
menu_add_line("HITPAUSE",2,"hitpause_lvl")
menu_add_line("AIM ASSIST",0,"player_aim_assist")
menu_add_line("MOUSE WHEEL CHAR.SWITCH",0,"mwheel_char")
menu_add_line("CANCEL",1,function(){
	instance_create_depth(0,0,depth-1,obj_option_menu)
	instance_destroy()
})
