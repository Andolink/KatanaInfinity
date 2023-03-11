if state = 0 && place_meeting(x,y,obj_player_ball)
{
	audio_play_sound(sound_ambience_huntress_defeat_01,999,0)
	screen_shake_set(30,20,-.5)
	sleep(30)
	hspd = 9
	vspd = -1.5
	state=3
	sprite_index = spr_pl_hurt_infinity
	instance_destroy(obj_player_ball)
}

if state = 1
{
	wait --
	
	if wait < 0
	{
		if sprite_index = spr_pl_idle_infinity
		{
			sprite_index = spr_pl_idle_to_run_infinity 
			image_index = 0
			alarm[0]=20
		}
		hspd = lerp(hspd,4,0.1)
	
		image_speed = hspd/3.5
	
		if place_meeting(x,y,obj_psych_bullet)
		{
			audio_play_sound(sound_ambience_huntress_defeat_01,999,0)
			state ++
			instance_destroy(obj_psych_bullet)
		}
	}
}
else if state = 2
{ 
	screen_shake_set(30,20,-.5)
	sleep(30)
	hspd = -9
	vspd = -1.5
	state++
	sprite_index = spr_pl_hurt_infinity
}
else if state = 3 #region
{ 
	grav = 6
	vspd = lerp(vspd,grav,.05*global.game_spd)
	
	if !place_free(x+hspd,y)
	{hspd = -hspd/2}
	
	instance_get_information()
	
	if in_air
	{
		echo_effect = true
		image_speed_set(1)
		
		hspd = lerp(hspd,0,.01*global.game_spd)
		if sprite_index != spr_pl_hurt_infinity sprite_index = spr_pl_hurt_loop_infinity
	}
	else
	{
		
		hspd = lerp(hspd,0,.1*global.game_spd)
		if sprite_index != spr_pl_hurt_ground_infinity
		&& sprite_index != spr_pl_hurt_infinity
		{
			sprite_index	= spr_pl_hurt_ground_infinity
			image_index		= 0
			image_speed_set(1)
		}
	}
} #endregion

if instance_exists(obj_cuts_psy) && obj_cuts_psy.state = 0
{
	with obj_cuts_zero_boss.textbox
	{
		text_x = other.x
		text_y = other.y-32
	}
	
	with obj_camera
	{
		x = lerp(x,other.x,.1)
		y = lerp(y,other.y,.1)
	}
}

collision_system(hspd,vspd)

if state = 3
{
	blood = true
	entity_blood_spawn()
}