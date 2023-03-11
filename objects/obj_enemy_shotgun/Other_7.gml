switch sprite_index 
{
	case spr_shotgun_turn			:	state = state_waiting	break
	case spr_shotgun_hurtground		:
	case spr_shotgun_hurtfly		:	image_speed_set(0)	image_index = image_number-1	break
}
