var lceil = instance_place(x-1,y,obj_ceilling_tile)

if lceil && lceil.hp > hp
	lceil.hp = hp

var rceil = instance_place(x+1,y,obj_ceilling_tile)

if rceil && rceil.hp > hp
	rceil.hp = hp
	

if place_meeting(x,y,obj_enemy_ball)
|| place_meeting(x,y,obj_player_ball)
{hp-- obj_player.bullet_reload = 2}

if place_meeting(x,y,obj_player_attack) || hp <= 0
|| place_meeting(x,y,obj_explosion)
{
	switch sprite_index
	{
		case spr_ceiling_tile0 :
			audio_play_sound(sound_breakwood,999,0)
		break
		case spr_ceiling_tile1 :
			audio_play_sound(sound_breakwood,999,0)
		break
		case spr_ceiling_tile2 :
			audio_play_sound(sound_breakblock,999,0)
		break
	}
	
	obj_player.attack_timer = 2
	
	screen_shake_set(5,12,-2)
	instance_destroy()
}

depth = layer_get_depth("TileSet")-5