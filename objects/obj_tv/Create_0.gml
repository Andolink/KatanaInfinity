if room = rm_cutscene_appart_tv
|| room = rm_cutscene_appart_chronosdealdeath
{
	audio_play_sound(sound_tv_ninja,999,1)

	obj_music_control.new_music_intro= -1
	obj_music_control.new_music_loop = -1
}