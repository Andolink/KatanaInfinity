image_speed = global.game_spd/2

x = obj_player.x
y = obj_player.y-24-sprite_yoffset

switch(id_tuto)
{
	case 0 : 
		if global.gamepad < 0 
			key = global.key_attack[1]
		else
			key = global.key_gp_attack[1]
		
		if input_get(global.input_attack, PRESSED)
		{instance_destroy()}
	break
	case 1 : 
		if global.gamepad < 0 
			key = global.key_interact[1]
		else
			key = global.key_gp_interact[1]
	break
	case 2 : 
		if global.gamepad < 0 
			key = global.key_pl_switch[1]
		else
			key = global.key_gp_pl_switch[1]
			
		if input_get(global.input_pl_switch, PRESSED)
		{instance_destroy()}
	break
}

sprite_index = input_get_sprite(key)