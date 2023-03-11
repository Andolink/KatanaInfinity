switch sprite_index 
{
	case spr_shieldcop_turn			:	state = state_waiting	break
	case spr_shieldcop_hurtground	:
	case spr_shieldcop_hurtfly		:	image_speed_set(0)	image_index = image_number-1	break
	case spr_shieldcop_bash			:	state = state_follow
}
