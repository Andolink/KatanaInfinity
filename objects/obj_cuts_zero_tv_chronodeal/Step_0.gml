if !init_camera
{
	with obj_camera
	{
		x = 150
		y = other.y-32
		camera_size = .6
	}
	init_camera = true
}
else
{
	
}

obj_camera.x = lerp(obj_camera.x,370,0.0025)

if state = 1
{
	sprite_index = spr_player_nosword_casualwalk
	
	hspd = lerp(hspd,.5,.25)
	
	if x > 300
	{
		sprite_index = spr_player_nosword_idle
		screen_shake_set(3,10)
		audio_play_sound(sound_scientistgroan,999,0)
		audio_play_sound(sound_enemy_death_bullet,999,0)	
		state = 2
	}
}
else if state < 3 && state != 0
{
	hspd = lerp(hspd,0,.5)
	sprite_index = spr_player_nosword_idle
	state += 0.02
}
else if state < 4 && state != 0
{	
	if x < 350
	{
		if sprite_index = spr_player_nosword_idle
		{
			sprite_index = spr_player_nosword_prerun
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
		
		hspd = lerp(hspd,3,.25)
	}
	else
	{
		hspd = lerp(hspd,0,.5)
		sprite_index = spr_player_nosword_casual_idle
		with obj_door_knock
		{sprite_index = spr_apartment_dooropen}
		state += 0.02
	}
}
else if state = 4
{
	hspd = lerp(hspd,0,.5)
	instance_create_depth(0,0,0,obj_glitch_feedback).time = 15
	alarm[4]=15
	state++
}

x += hspd