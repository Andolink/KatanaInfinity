switch sprite_index
{
	case spr_psychboss_energyball_redirect :
		sprite_index = spr_psychboss_float
	break
	case spr_psychboss_die :
		sprite_index = spr_psychboss_float
		
		state = state_list[state_id]
		state_id++
			
		attack_start = false
		time_before_attack = time_before_attack_max
			
		state()
		
		x = x_target y = y_target
	break
	case spr_psychboss_energyball_charge :
		sprite_index = spr_psychboss_energyball_firedown
	break
	case spr_psychboss_energyball_firedown :
		sprite_index = spr_psychboss_float
		instance_create_depth(x,y,depth-1,obj_psychbossinfinity_proj)
	break
	case spr_psychboss_appear :
		sprite_index = spr_psychboss_float
	break
	case spr_psychboss_disappear :
		sprite_index = spr_psychboss_appear
		if obj_player.hp > 0
		{
			state = state_list[state_id]
			state_id++
			
			attack_start = false
			time_before_attack = time_before_attack_max
			
			state()
			
			x = x_target y = y_target
		}
	break
}