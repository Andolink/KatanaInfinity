switch sprite_index 
{
	case spr_bluepomp_attack		:	state = state_follow	break
	case spr_bluepomp_turn			:	state = state_waiting	break
	case spr_bluepomp_hurtground		:
	case spr_bluepomp_hurtfly		:	image_speed_set(0)	image_index = image_number-1	break
	case spr_bluepomp_knockdown		:	state = state_follow	break
	case spr_bluepomp_kick			:	state = state_follow	break
}
