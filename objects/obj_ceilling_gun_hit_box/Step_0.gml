if (place_meeting(x,y,obj_player) && !obj_player.stop)
&& creator.gun_alp >= 1
{
	screen_shake_set(5,2,0)
	audio_play_sound(choose(sound_gun_fire_1,sound_gun_fire_2),999,0)
	
	with creator 
	{
		repeat(5) create_bullet(x,y+1,depth,270+random_range(-10,10),30)
		gun_alp = -2
		
		with particule_create(x,y,depth-1,choose(spr_gunspark,spr_gunspark2,spr_gunspark3))
		{
			image_angle = 270
		}
		with particule_create(x,y,depth-1,choose(spr_gunsmoke,spr_gunsmoke2,spr_gunsmoke3))
		{
			image_angle = 270
			image_alpha = .5
		}
		
	}
}