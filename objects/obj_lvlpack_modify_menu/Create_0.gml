speedrun_option_load()

menu_init("------ OPTION ------")

menu_add_line("MUSIC",6,"lvlpack_music",function()
{
	var _text = "Choose an OST : [scale,.5]\n\n"
	var i = 0
	repeat(array_length(global.ost_list))
	{
		if i != 0
		{
			_text += " | "
		}
		_text += global.ost_list[i]
		i++
	}
	
	with level_editor_create_message(_text,ledit_message_type_write,
	function(){
		global.lvlpack_music = obj_ledit_message.typed_text
		level_editor_set_music(global.lvlpack_music)
		with obj_music_control
		{
			new_music_intro = global.level_editor_music_intro
			new_music_loop = global.level_editor_music_loop
		}
	})
	{
		keyboard_string = global.lvlpack_music
		depth = other.depth-1
	}
})
menu_add_line("GAME RULE",3,"lvlpack_rule",["---","Normal","Break The Lights","Pascifist"])
menu_add_line("SLOWMO MODE",3,"lvlpack_chronos",["---","Normal","Super Hot","Edgerunner"])
menu_add_line("CHARACTER",3,"lvlpack_char_mode",["---","Zero","Gun Zero","Infinty","Fifteen","Murasama","Gun Zero + Infinty","Gun Zero + Fifteen","Gun Zero + Murasama"])
menu_add_line("CANCEL",1,function()
{
	event_user(0)
})