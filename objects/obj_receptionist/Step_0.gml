if cutsc = 0 || cutsc = 2
{
	if sprite_index = spr_receptionist_lookup
	{sprite_index = spr_receptionist_lookdown image_index = 0 image_speed = 1}
	
	if sprite_index = spr_receptionist_read
	&& image_speed = 0
	&& irandom(120)=69
	{
		sprite_index = choose(spr_receptionist_hair,spr_receptionist_blink,spr_receptionist_read)
		if sprite_index = spr_receptionist_read
			audio_play_sound(sound_receptionist_turnpage,999,0)
		image_index = 0
		image_speed = 1
	}
	
	if cutsc = 0 && obj_receptionist_infinity.x > 265
	{
		event_user(0)
		cutsc = 1
		obj_receptionist_infinity.cutscene = true
		sprite_index = spr_receptionist_lookup
		image_index = 0
		image_speed = 1
	}
	with obj_camera
	{
		camera_size = lerp(camera_size,1,.05)
		x = lerp(x,room_width/2,.05)
		y =	lerp(y,room_height/2,.05)
	}
}
else
{
	with obj_camera
	{
		camera_size = lerp(camera_size,0.75,.05)
		x = lerp(x,300,.05)
		y = lerp(y,270,.05)
	}
}
