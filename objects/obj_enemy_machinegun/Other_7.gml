switch sprite_index 
{
	case spr_machinegun_turn		:	state = state_waiting	break
	case spr_machinegun_hurtground	:
	case spr_machinegun_hurtfly		:	image_speed_set(0)	image_index = image_number-1	break
	case spr_machinegun_punch		:	state = state_follow
	case spr_machinegun_reload		:	reload_time = 0
}
