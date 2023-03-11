if instance_exists(creator)
{
	x = creator.x
	y = creator.y
	
	if image_index < 2
	{
		if place_meeting(x,y,obj_player)
		&& obj_player.state != obj_player.state_hit
		&& obj_player.state != obj_player.state_roll
		&& !obj_player.stop
		{
			image_xscale = -obj_player.image_xscale
			with obj_player
			{
				state = state_hit
				hspd = -image_xscale*10
				vspd = -8
				sleep(10)
				screen_shake_set(5,20,-2)
			}
		}
	}
}
else
{
	instance_destroy()
}

image_speed = global.game_spd