

speedrun_option_load()

menu_init("------ LEVEL EDITOR ------")

menu_add_line("CREATE A LEVEL",1,function(){global.level_load_name = "" global.editor_mode = 0 room_goto(rm_level_editor)})
//menu_add_line("CREATE A CUTSCENE",1,function(){global.level_load_name = "" global.editor_mode = 1 room_goto(rm_level_editor)})
menu_add_line("MODIFY A LEVEL",1,function(){instance_create_depth(0,0,0,obj_leveleditor_load_menu) instance_destroy()})
menu_add_line("CREATE A LEVEL PACK",1,function(){global.lvlpack_load_name = "" room_goto(rm_lvlpack_editor)})
menu_add_line("MODIFY A LEVEL PACK",1,function(){instance_create_depth(0,0,0,obj_leveleditor_loadlvlpack_menu) instance_destroy()})
menu_add_line("PLAY A LEVEL PACK",1,function(){instance_create_depth(0,0,0,obj_leveleditor_play_menu) instance_destroy()})
menu_add_line("CANCEL",1,function(){with obj_title_screen {start=false start_timer = 0} instance_destroy()})