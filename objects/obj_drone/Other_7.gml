switch sprite_index
{
	case spr_drone_turn :
		if turning 
		{
			sprite_index = spr_drone
			image_speed_set(1)
			image_index = 0
			image_xscale = -image_xscale
		}
	break
	case spr_drone :
		if turning 
		{
			turning = false
			sprite_index = spr_drone_turn
			image_speed_set(0)
			image_index = 0
		}
	break
}