if lazer_hit
{
	if lazer_img > sprite_get_number(spr_ceiling_laser_hit)
	{lazer_hit = false}
}

if on_off
{
	sprite_index = spr_ceiling_laser_on
	hit_box.x = x
	hit_box.y = y
	
	if !audio_is_playing(sound_lasers_on)
	&& on_off_last_state != on_off
	{
		audio_play_sound(sound_lasers_on,999,0)
		audio_stop_sound(sound_lasers_off)
	}
}
else
{
	sprite_index = spr_ceiling_laser_off
	hit_box.x = x
	hit_box.y = y+room_height*2 //make it off screen (avoid to destroy if)
	lazer_hit = false
	lazer_img = 0
	
	if !audio_is_playing(sound_lasers_off)
	&& on_off_last_state != on_off
	{
		audio_play_sound(sound_lasers_off,999,0)
		audio_stop_sound(sound_lasers_on)
	}
}