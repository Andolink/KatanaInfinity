menu_init("------ CONTROL ------")

menu_add_line("Jump",5,global.key_gp_jump)
menu_add_line("Interact",5,global.key_gp_interact)
menu_add_line("Roll",5,global.key_gp_roll)
menu_add_line("Attack",5,global.key_gp_attack)
menu_add_line("Object",5,global.key_gp_object)
menu_add_line("Walk",5,global.key_gp_walk)
menu_add_line("Slow Motion",5,global.key_gp_chronos)
menu_add_line("Char Switch",5,global.key_gp_pl_switch)

menu_add_line("Pause",5,global.key_gp_pause)
//menu_add_line("Death Restart",5,global.key_gp_deathrestart)
menu_add_line("Restart",5,global.key_gp_restart)
menu_add_line("Select",5,global.key_gp_select)

menu_add_line("CANCEL",1,function(){
	instance_create_depth(0,0,depth-1,obj_option_menu)
	instance_destroy()
})
