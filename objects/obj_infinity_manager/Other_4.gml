switch room
{
	case rm_cutscene_intro : 
		global.speedrun_timergl_msec	= 0
		global.speedrun_timergl_sec		= 0
		global.speedrun_timergl_min		= 0
		global.speedrun_deathcount1000gl= 0
		global.speedrun_deathcount100gl	= 0
		global.speedrun_deathcount10gl	= 0
		global.speedrun_deathcount1gl	= 0
		
		global.speedrun_timer_msec		= 0
		global.speedrun_timer_sec		= 0
		global.speedrun_timer_min		= 0
		global.speedrun_deathcount1000	= 0
		global.speedrun_deathcount100	= 0
		global.speedrun_deathcount10	= 0
		global.speedrun_deathcount1		= 0
		
		global.char_switch_id			= 0
	break
}

var speedrun_char_mode_ = global.speedrun_mode && global.speedrun_char_mode != 0

switch room
{
	case rm_rooftop_0 : case rm_rooftop_1 : case rm_rooftop_2 : case rm_rooftop_3 : case rm_rooftop_4 :
	case rm_rooftop_5 : case rm_rooftop_6 : case rm_rooftop_7 : case rm_rooftop_8 : case rm_rooftop_9 :
	case rm_rooftop_10 :
		light_set_ambiant(true,#9635FF)
		with obj_music_control
		{new_music_intro = mus_dispersal_mission_intro new_music_loop = mus_dispersal_mission_theme}
		with obj_player
		{
			if !speedrun_char_mode_ player_set_characters(skin_zero_gun,gameplay_gun)
			allow_char_switch = false
			event_user(0)
		}
	break
	case rm_psychentrance_1 : case rm_psychentrance_2 : case rm_psychentrance_3 : 
	case rm_psychentrance_4 : case rm_psychentrance_5 : case rm_psychentrance_6 : 
		audio_play_sound(sound_ambience_hotellobby_loop_01,999,1)
		light_set_ambiant(false)
		with obj_music_control
		{new_music_intro = mus_underground_mission_intro new_music_loop = mus_underground_mission_theme}
		with obj_player
		{
			if !speedrun_char_mode_ player_set_characters(skin_infinity,gameplay_sword)
			allow_char_switch = false
			event_user(0)
		}
	break
	case rm_secretpassage_0 : case rm_secretpassage_1 : case rm_secretpassage_2 : case rm_secretpassage_3 : 
	case rm_secretpassage_4 : case rm_secretpassage_5 : case rm_secretpassage_6 :
		light_set_ambiant(false)
		with obj_music_control
		{new_music_intro = noone new_music_loop = mus_together}
		with obj_player
		{
			if !speedrun_char_mode_ player_set_characters(skin_zero_gun,gameplay_gun,skin_infinity,gameplay_sword)
			allow_char_switch = true
		}
	break
}

if global.speedrun_mode && global.speedrun_char_mode != 0
{
	player_set_char_speedrun_option()
}