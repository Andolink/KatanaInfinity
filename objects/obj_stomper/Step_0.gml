if !place_free(x,y)
{instance_destroy()}

switch state
{
	case 0 :
	
	image_yscale -= 1/64*global.game_spd
	if image_yscale < 1
	{image_yscale = 1}
	image_speed_set(0)
	image_index = (3-clamp((wait-12)/3,0,9))
	vspd = 0
	
	break
	case 1 :
	
	image_speed = 0
		image_index = 3
	image_yscale += vspd*global.game_spd
	if !place_free(x,y+1)
	|| place_meeting(x,y+1,par_platform)
	{
		state = 2
		
		if x > obj_camera.x-400 && x < obj_camera.x+400
		&& y > obj_camera.y-300 && y < obj_camera.y+300
		{
			screen_shake_set(4,20,-2)
			if !audio_is_playing(sound_stomper_impact)
			{audio_play_sound(sound_stomper_impact,999,0)}
		}
		while !place_free(x,y)
		|| place_meeting(x,y,par_platform)
		{
			image_yscale -= 1/64
		}
	}
	else
	{
		vspd = lerp(vspd,1,.25*global.game_spd)
	}

	
	break
	case 2 :
	
	image_speed_set(1)
	if image_index > image_number-1
	{state = 0}
	
	break
}

wait-= global.game_spd
if wait < 0
{state = 1 wait = 200}

image_speed_update()