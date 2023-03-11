if place_meeting(x,y,obj_player_attack) && !open
{
	obj_player.attack_timer = 5
	
	if obj_player_attack.x < x
	{
		image_xscale = 1
	}
	else
	{
		image_xscale = -1
	}
	
	event_user(0)
}

var inst = instance_place(x,y,obj_player_ball)

if inst && !open
{
	obj_player.bullet_reload = 2
	
	if inst.image_angle < 90 || inst.image_angle > 270
	{
		image_xscale = 1
	}
	else
	{
		image_xscale = -1
	}
	
	instance_destroy(inst)
	
	event_user(0)
}


if !has_shake_on_wall && image_index > 2
{
	sleep(2)
	has_shake_on_wall = true
}

image_speed_update()