switch sprite_index 
{
	case spr_sci_turn			:	state = state_waiting	break
	case spr_sci_hurtground		:
	case spr_sci_hurtfly		:	image_speed_set(0)	image_index = image_number-1	break
}
