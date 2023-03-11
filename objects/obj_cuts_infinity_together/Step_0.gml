x += hspd

if sprite_index = spr_pl_run_infinity image_speed = hspd/3.5
else image_speed = 1

if x > 325 && state != 1
{
	hspd = lerp(hspd,0,0.5)
	if sprite_index = spr_pl_run_infinity
	{
		sprite_index = spr_pl_run_to_idle_infinity
	}
}

if camera_state = 0
{
	with obj_camera
	{
		camera_size = .75
		x = lerp(x,other.x+40,.25)
		y = other.y-32
	}
}
else if camera_state = 1
{
	y_cam_spd = lerp(y_cam_spd,0.15,0.02)
	with obj_camera
	{
		y -= other.y_cam_spd
		if y < 180 && other.state = 0
		{
			with instance_create_depth(x,y,0,obj_hud_transition)
			{
				func_transition = function()
				{
					room_goto_next()
				}
			}
			other.state = 1
		}
	}
}