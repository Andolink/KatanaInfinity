if ((place_meeting(x,y,obj_player) && !obj_player.stop)
|| place_meeting(x,y,par_enemy))
&& !creator.lazer_hit
{
	audio_play_sound(sound_laser_explosion,999,0)
	
	with creator 
	{
		lazer_img = 0
		lazer_hit = true
	}
}