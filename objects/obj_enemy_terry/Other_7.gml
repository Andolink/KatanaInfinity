switch sprite_index 
{
	case spr_grunt_attack		:	state = state_follow	break
	case spr_grunt_turn			:	state = state_waiting	break
	case spr_grunt_hurt_ground	:
	case spr_grunt_hurt_fly		:	image_speed_set(0)	image_index = image_number-1	break
}
