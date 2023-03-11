if image_index > image_number-3 && !audio_was_played
{
	audio_play_sound(sound_npc_therapistmeds_remove_01,999,0)
	audio_was_played = true
}