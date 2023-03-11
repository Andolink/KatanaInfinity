menu_init("------ SWORD ------")

menu_add_line("TYPE",3,"zero_sword",["Normal","Dragon","Color","Big","Flame","Old","Master","Short","Murasama"])
//menu_add_line("SLASH COLOR",3,"slash_color",["Normal","Rainbow","Character","P*nis"])
menu_add_line("BLOOD COLOR",3,"slash_type",["Normal","Rainbow","Character","P*nis"])

//menu_add_line("SPEED",5,global.key_up)

menu_add_line("CANCEL",1,function(){
	instance_create_depth(0,0,depth-1,obj_other_menu)
	instance_destroy()
})
