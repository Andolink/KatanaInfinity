if state = 1
{
	obj_music_control.new_music_intro = -1
	obj_music_control.new_music_loop = mus_tensemoment
	
	if visible = false && global.zero_infinity_relation < 0
	{
		x = xstart+120
	}
	
	visible = true
	with obj_cuts_zero_boss.textbox
	{
		text_x = other.x
		text_y = other.y-28
	}
	x -= 1.2*global.game_spd
	if x < 1072
	|| (global.zero_infinity_relation < 0 && x < 1100)
	{
		sprite_index = spr_cuts_psych_idle
		state+= .5
	}
	else
	{
		with obj_camera
		{
			if global.zero_infinity_relation < 0
			{
				x = lerp(x,1072,.1)
				camera_size = lerp(camera_size,.6,.15)
			}
			else
			{
				x = lerp(x,1026,.1)
				camera_size = lerp(camera_size,.75,.15)
			}
		}
	}
}
else if state = 2
{
	//if sprite_index = spr_cuts_psych_idle
	//{
	//	sprite_index = spr_cuts_psych_prebattle
	//	image_index = 0
	//}
	
	with obj_camera
	{
		x = lerp(x,obj_cuts_infinity_boss.x+22,.05)
		y = lerp(y,obj_cuts_infinity_boss.y,.05)
		camera_size = lerp(camera_size,.5,.05)
	}
}