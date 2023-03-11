menu_init("------ AUDIO ------")

menu_add_line("SFX VOLUME",2,"sfx_volume")
menu_add_line("MUSIC VOLUME",2,"music_vol")
menu_add_line("GLOBAL VOLUME",2,"global_vol")
menu_add_line("CANCEL",1,function(){
	instance_create_depth(0,0,depth-1,obj_option_menu)
	instance_destroy()
})
