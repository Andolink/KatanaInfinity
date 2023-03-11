collision_system(hspd,vspd)

if in_ground && sprite_index = spr_player_nosword_fall
{
	screen_shake_set(2,5)
	sprite_index = spr_player_nosword_idle
	audio_play_sound(sound_player_land,999,0)
	particule_create(x,bbox_bottom,depth-1,spr_landcloud)
	with obj_cuts_infinity_together
	{alarm[0]=40}
}