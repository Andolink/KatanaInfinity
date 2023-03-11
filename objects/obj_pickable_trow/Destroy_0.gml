screen_shake_set(3,5,-1)

var snd = sound_projectilebreak_small
//sound_vial_smoke
//sound_vial_explosive
//sound_mine_stick
//
// 

switch sprite_index
{
	case spr_lamp : snd = sound_projectilebreak_med_lamp break
	case spr_potted_plant : snd = sound_projectilebreak_med_plant break
	case spr_bust : snd = sound_projectilebreak_big break
	case spr_knife : case spr_butcher_knife : 
		if !place_free(x,y)
		{
			snd = sound_knife_wall 
			with instance_create_depth(x,y,depth,obj_pickable)
			{sprite_index = other.sprite_index image_angle = other.image_angle}
		}
	break
	case spr_smoke_vial : snd = sound_vial_smoke break
	case spr_remote_mine_and_remote : 
		snd = sound_mine_stick
	break
	case spr_explosive_vial :
		snd = sound_vial_explosive
		instance_create_depth(x+random_range(-3,3),y+random_range(-3,3),depth,obj_explosion)
		var i = 0
		repeat(12)
		{
			var len = 24+random(8)
			instance_create_depth(x+lengthdir_x(len,i),y+lengthdir_y(len,i),depth,obj_explosion)
			i +=360/12
		}
		screen_shake_set(6,18,-1)
		sleep(8)
	break
}

audio_play_sound(snd,999,0)