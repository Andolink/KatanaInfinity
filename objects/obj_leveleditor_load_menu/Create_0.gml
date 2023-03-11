delete_temp_level_files()

menu_init("------ MODIFY A LEVEL ------")

var files = [];
var file_name = file_find_first("LevelEditor/*.txt", fa_directory);

while (file_name != "")
{
	show_debug_message("work")
	if string_char_at(file_name,1)!="_"
	{
	    array_push(files, file_name)
	}
	file_name = file_find_next()
}

file_find_close(); 

var i = 0
repeat(array_length(files))
{
	var nam = string_copy(files[i],1,string_length(files[i])-4)
	play_file[i]=nam
	menu_add_line(nam,1,function(){
		global.level_load_name = play_file[menu_pos]
		room_goto(rm_level_editor)
	})
	i++
}

menu_add_line("CANCEL",1,function(){event_user(0)})