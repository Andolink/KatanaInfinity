speedrun_option_load()

menu_init("------ PLAY ------")

var files = [];
var file_name = file_find_first("LevelPack/*", fa_directory);

while (file_name != "")
{
    array_push(files, file_name);

    file_name = file_find_next();
}

file_find_close(); 

var i = 0
repeat(array_length(files))
{
	var nam = files[i]
	play_file[i]=files[i]
	menu_add_line(nam,1,function(){
		global.level_play_id = -1
		global.level_play_folder = play_file[menu_pos]
		room_goto(rm_level_editor_play)
	})
	i++
}

menu_add_line("CANCEL",1,function(){event_user(0)})