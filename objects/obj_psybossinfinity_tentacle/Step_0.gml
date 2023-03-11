if state = -1
{
	x = xstart+random_range(-2,2)
	image_blend = merge_color(c_black,c_white,color)
	
	color = lerp(color,1,.15)
	
	echo_create(x,y,depth+1,sprite_index,image_index,image_xscale,image_yscale,
	image_angle,0.25,c_red,1,true,3)
	
	image_yscale = lerp(image_yscale,-0.1457144,.05*global.game_spd)
	
	if image_yscale < -0.144
	{
		state = 0
		screen_shake_set(2,18,-2)
	}
}
else if state = 0
{
	if point_distance(x,0,obj_player.x,0)<50
	&& image_yscale > -0.148
	{
		state = 1 ysc_spd = .000025 
		audio_play_sound(choose(sound_boss_akirasyringe_thrust_01,sound_boss_akirasyringe_thrust_02,sound_boss_akirasyringe_thrust_03),999,0)
	}
	image_yscale = lerp(image_yscale,-0.1457144,.25*global.game_spd)
	
	if image_yscale < -0.148 
	{
		echo_create(x,y,depth+1,sprite_index,image_index,image_xscale,image_yscale,
		image_angle,0.25,c_red,6,true,1.5)
	}
}
else if state = 1
{
	x = xstart+random_range(-1,1)
	ysc_spd += ysc_spd*global.game_spd
	image_yscale -= ysc_spd*global.game_spd
	if image_yscale < -0.7342858
	{	
		image_yscale = -0.7342858
		state = 2
		screen_shake_set(4,6,-1)
		wait = 10
		audio_play_sound(sound_boss_akirasword_impact_01,999,0)
	}
	
	echo_create(x,y,depth+1,sprite_index,image_index,image_xscale,image_yscale,
	image_angle,0.25,c_red,6,true,1.5)
}
else if state = 2
{
	x = xstart+random_range(-2,2)
	wait -= global.game_spd
	image_yscale = lerp(image_yscale,-0.7085716,.1*global.game_spd)
	if wait <= 0 
	{
		state = 0
	}
	
	echo_create(x,y,depth+1,sprite_index,image_index,image_xscale,image_yscale,
	image_angle,0.25,c_red,6,true,1.5)
}