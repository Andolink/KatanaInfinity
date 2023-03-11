if global.level_play_id = -1
{
	speedrun_option_reset()
	global.speedrun_mode = true
	lvlpack_editor_load(global.level_play_folder,1)
	global.level_play_id = 0
}

var folder = "LevelPack/"+global.level_play_folder+"/"

if global.level_play_id < array_length(global.lvlpack_level)
{
	var name_ = global.lvlpack_level[global.level_play_id,0]
	level_editor_load(folder+name_)

	with obj_music_control
	{
		var mus = global.lvlpack_modify[global.level_play_id,0]
		if mus != "---"
		{
			level_editor_set_music(mus)
			new_music_intro = global.level_editor_music_intro
			new_music_loop = global.level_editor_music_loop
		}
	}

	var val = global.lvlpack_modify[global.level_play_id,1]
	if val != 0 global.speedrun_rule = val-1

	var val = global.lvlpack_modify[global.level_play_id,2]
	if val != 0 global.speedrun_chronos_mode = val-1

	var val = global.lvlpack_modify[global.level_play_id,3]
	if val != 0 global.speedrun_char_mode = val
	
	instance_create_depth(0,0,0,obj_ledit_background)
	level_editor_play()
	
	player_set_char_speedrun_option()
}
else		
{
	game_restart()
}