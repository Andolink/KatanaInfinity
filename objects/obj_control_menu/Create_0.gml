menu_init("------ CONTROL ------")

menu_add_line("Up",5,global.key_up)
menu_add_line("Down",5,global.key_down)
menu_add_line("Left",5,global.key_left)
menu_add_line("Right",5,global.key_right)

menu_add_line("Jump",5,global.key_jump)
menu_add_line("Interact",5,global.key_interact)
menu_add_line("Roll",5,global.key_roll)
menu_add_line("Attack",5,global.key_attack)
menu_add_line("Object",5,global.key_object)
menu_add_line("Walk",5,global.key_walk)
menu_add_line("Slow Motion",5,global.key_chronos)
menu_add_line("Char Switch",5,global.key_pl_switch)

menu_add_line("Pause",5,global.key_pause)
menu_add_line("Death Restart",5,global.key_deathrestart)
menu_add_line("Restart",5,global.key_restart)
menu_add_line("Select",5,global.key_select)

menu_add_line("CANCEL",1,function(){
	instance_create_depth(0,0,depth-1,obj_option_menu)
	instance_destroy()
})
