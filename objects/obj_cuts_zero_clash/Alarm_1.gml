instance_create_depth(0,0,0,obj_glitch_feedback).time = 30

screen_shake_set(30,1,0)

with obj_camera
{
	x = 368
	y = 266
	camera_size = 0.4
}

camera_state = 2

alarm[2]=30

with obj_door_knock sprite_index = spr_apartment_dooropen