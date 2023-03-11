if has_explode
{
	audio_play_sound(choose(sound_explosion1,sound_explosion2,sound_explosion3),999,0)
	instance_create_depth(x+random_range(-3,3),y+random_range(-3,3),depth,obj_explosion)
	var i = 0
	repeat(12)
	{
		var len = 28+random(8)
		instance_create_depth(x+lengthdir_x(len,i),y+lengthdir_y(len,i),depth,obj_explosion)
		i +=360/12
	}
	screen_shake_set(6,18,-1)
	sleep(8)
	instance_destroy()
}