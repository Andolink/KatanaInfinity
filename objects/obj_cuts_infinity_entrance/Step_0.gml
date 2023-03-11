x += hspd

if sprite_index = spr_pl_run_infinity image_speed = hspd/3.5
else image_speed = 1

if x > 156 && state != 1
{
	hspd = lerp(hspd,0,0.5)
	if sprite_index = spr_pl_run_infinity
	{
		sprite_index = spr_pl_run_to_idle_infinity
	}
}

if state = 1
{
	if sprite_index = spr_pl_idle_infinity
	{
		hspd = 0
		sprite_index = spr_pl_idle_to_run_infinity
		image_index = 0
		#region
		
		audio_play_sound(sound_player_prerun,999,0)
		repeat(choose(4,5))
		{
			with particule_create(x+random_range(-5,5),bbox_bottom-random(15),depth-1,spr_dustcloud,0,.5+random(.4))
			{
				image_alpha = random_range(.5,1)
				hspd = -other.image_xscale*random_range(0.5,1.2)
				vspd = -random_range(0.5,1)
				image_angle = random(5)
				image_xscale = -other.image_xscale
			}
		}
		
		#endregion
	}
	hspd = lerp(hspd,4,0.25)
}