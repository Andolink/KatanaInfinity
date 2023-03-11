if image_index < .5 && image_speed = 1 && !loop
{
	audio_play_sound(sound_doorknocking,999,0)
	screen_shake_set(3,10,-3)
	loop = true
	time++
}