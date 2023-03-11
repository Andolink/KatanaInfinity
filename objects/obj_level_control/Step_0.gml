global.level_timer -= global.game_spd

if global.level_timer <= 0
{
	with obj_player
	{
		state = state_hit
		hp = 0
	}
}

if global.editor_mode = 0
{
	if !global.speedrun_mode || global.speedrun_rule = speedrun_rule_any
	{
		if global.enemy_count <= 0
		&& !instance_exists(obj_go_arrow)
		&& !instance_exists(obj_cutscene_manager)
		&& instance_exists(obj_player)
		{
			audio_play_sound(sound_ui_prompt_go_01,999,0)
			instance_create_depth(0,0,0,obj_go_arrow)
		}
	}
	else
	{
		switch global.speedrun_rule
		{
			case speedrun_rule_breakthelight :
			#region
				if global.enemy_count <= 0
				&& global.light_count <= 0
				&& !instance_exists(obj_go_arrow)
				&& !instance_exists(obj_cutscene_manager)
				&& instance_exists(obj_player)
				{
					audio_play_sound(sound_ui_prompt_go_01,999,0)
					instance_create_depth(0,0,0,obj_go_arrow)
				}
			#endregion
			break
			case speedrun_rule_truepascifist :
			#region
				if global.enemy_count = global.enemy_count_start
				&& !instance_exists(obj_go_arrow)
				&& !instance_exists(obj_cutscene_manager)
				&& instance_exists(obj_player)
				{
					audio_play_sound(sound_ui_prompt_go_01,999,0)
					instance_create_depth(0,0,0,obj_go_arrow)
				}
				else if instance_exists(obj_go_arrow)
				&& global.enemy_count != global.enemy_count_start
				{
					instance_destroy(obj_go_arrow)
				}
			#endregion
			break
		}
	}
}