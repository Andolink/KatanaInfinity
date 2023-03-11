if place_meeting(x,y,obj_player_attack)
&& image_speed_get() = 0
{
	audio_play_sound(sound_gobell,999,0) 
	enemy_create_trigger(180)
	image_speed_set(1)
	
	screen_shake_set(6,18,-1)
	sleep(8)
}

image_speed_update()