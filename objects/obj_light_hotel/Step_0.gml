if !destroyed
{
	if hide>0
	{
		hide -=global.slow_motion
		if hide <= 0
		{
			light.visible = true
		}
	}

	if irandom(300/global.slow_motion)=50
	{
		light.visible = false 
	
		hide = 1+irandom(10)
	}
	
	if place_meeting(x,y,obj_player_attack)
	|| place_meeting(x,y,obj_player_ball)
	|| place_meeting(x,y,obj_enemy_ball)
	{
		enemy_create_trigger(150)
		
		global.light_count --
		audio_play_sound(choose(sound_object_light_shatter_01,sound_object_light_shatter_02),999,0)
		repeat(10)
		{
			with instance_create_depth(x,y,depth,obj_particule_physic)
			{
				sprite_index = spr_glassshard_white
				image_index = irandom(5)
				hspd = random_range(-8,8)
				vspd = -8+random(5)
			}	
		}
		instance_destroy(light)
		screen_shake_set(3,8,-2)
		sleep(5)
		destroyed = true
		hide = 2
		image_index = 3
	}
}
else
{


}