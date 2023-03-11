menu_init("------ OTHER ------")

menu_add_line("SWORD",1,function(){instance_create_depth(0,0,depth-1,obj_sword_option) instance_destroy()})
menu_add_line("CANCEL",1,function(){
	instance_create_depth(0,0,depth-1,obj_option_menu)
	instance_destroy()
})
