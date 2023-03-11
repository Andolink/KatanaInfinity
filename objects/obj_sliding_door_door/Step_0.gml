if !place_free(x,y)
{instance_destroy()}

switch state
{
	case 0 :
	
		if spr = spr_sliding_door_base_red
		{
			spr = spr_sliding_door_base_green
			image_index = 0
			image_speed_set(1)
			if !audio_is_playing(sound_slidingdoor_open)
				audio_play_sound(sound_slidingdoor_open,999,0)
		}
	
		image_yscale = lerp(image_yscale,.25,0.2)
	
		image_speed_set(0)
		vspd = 0
		shake = false
	
	break
	case 1 : 
	
		if spr = spr_sliding_door_base_green
		{
			if !audio_is_playing(sound_slidingdoor_close)
				audio_play_sound(sound_slidingdoor_close,999,0)
			spr = spr_sliding_door_base_red
			image_index = 0
			image_speed_set(1)
		}
	
		if place_free(x,y+1) 
		{
			image_yscale += vspd*global.game_spd
			vspd = lerp(vspd,.25,.1*global.game_spd)
		}
	
		if !place_free(x,y+1) && !shake
		{
			if x > obj_camera.x-400 && x < obj_camera.x+400
			&& y > obj_camera.y-300 && y < obj_camera.y+300
			{screen_shake_set(4,20,-2)}
			while !place_free(x,y)
			{
				image_yscale -= 1/sprite_height
			}
			shake = true
		}
	
	break
}

image_speed_update()