switch sprite_index 
{
	case spr_pomp_attack		:	state = state_follow	break
	case spr_pomp_turn			:	state = state_waiting	break
	case spr_pomp_hurtground	:
	case spr_pomp_hurtfly		:	image_speed_set(0)	image_index = image_number-1	break
	case spr_pomp_knockdown		:	state = state_follow	break
}
