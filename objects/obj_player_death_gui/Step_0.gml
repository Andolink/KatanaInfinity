if (input_get(global.input_deathrestart,PRESSED) || (input_gamepad_any() && !input_get(global.input_pause,PRESSED)))
&& !restart && waiting <= 0
{
	audio_play_sound(choose(sound_menubeep_1,sound_menubeep_2),999,0)
	restart = true
	with instance_create_depth(x,y,0,obj_hud_transition)
	{
		func_transition = function()
		{
			if room = rm_level_editor
			{
				level_editor_load("LevelEditor/"+"_autosave")
				level_editor_play()
			}
			else if global.speedrun_nodeathmode
			{
				global.boss_state = 0
				room_goto(global.speedrun_startlevel)
			}
			else
			{
				room_restart()
			}
		}
	}
}

waiting --