switch sprite_index 
{
	case spr_redpomp_attack			:	state = state_follow	break
	case spr_redpomp_turn			:	state = state_waiting	break
	case spr_redpomp_hurtground		:
	case spr_redpomp_hurtfly		:	image_speed_set(0)	image_index = image_number-1	break
	case spr_redpomp_knockdown		:	state = state_follow	break
	case spr_redpomp_kick			:	state = state_follow	break
}
