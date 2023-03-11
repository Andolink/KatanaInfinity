image_speed_init()
enemy_ai_init()

spd = 3.25

enemy_init_variables()

waiting_time = 80
waiting_time_max = 80

attack			= noone
attack_in_done	= false
attack_dir		= 0
arm_dir			= 270
aim_time		= 12
aim_time_max	= 12

shotgun_frame	= 0

reload_time		= 15
reload_time_max	= 30

door_step= 0

state_waiting = function() {#region
	vspd = grav
	
	sprite_index = spr_shotgun_idle
	
	waiting_time-=global.game_spd
	if waiting_time<=0 && walk_dist != 0
	{
		waiting_time = waiting_time_max 
		state = state_walk
	}
	
	if enemy_ai_saw_player || enemy_ai_hear
	{state = state_follow}
}#endregion

state_walk = function() {#region
	
	enemy_ai_walk(spr_shotgun_turn,spr_shotgun_walk)
	
}#endregion

state_follow = function() {#region
	vspd = grav
	aim_time		= aim_time_max
	shotgun_frame	= 0
	arm_dir	= 270
	
	enemy_ai_follow()
	
	if abs(hspd)<0.25
	{
		sprite_index = spr_shotgun_idle
		image_speed_set(1)
		if point_distance(x,bbox_bottom,target_x,target_y_ground) < 6
		&& abs(hspd)<0.05
		&& enemy_ai_vision_timer > 30
		{
			state = state_waiting
		}
	}
	else
	{
		sprite_index = spr_shotgun_run
		image_speed_set(abs(hspd)/3)
	}
	
	if enemy_ai_saw_player
	{state = state_attack}
	
	if hspd != 0
	{image_xscale = sign(hspd)}
	
	enemy_ai_moving_through_door()
	enemy_ai_open_door()
	
}#endregion

state_attack = function() {#region
	
	hspd = lerp(hspd,0,.5)
	vspd = grav
	
	if sprite_index != spr_shotgun_aim
	{
		image_speed_set(1)
		sprite_index	= spr_shotgun_aim
		image_index		= 0
	}
	
	if target_x < x	
		image_xscale = -1
	else
		image_xscale = 1
	
	attack_dir = point_direction(x,y-2,target_x,target_y-2)
	
	var dif = angle_difference(attack_dir,arm_dir)/5
	
	arm_dir += dif*global.game_spd
	
	if abs(dif)<10
	{
		if reload_time > 0
		{
			reload_time -= global.game_spd
		}
		else
		{
			if shotgun_frame > sprite_get_number(spr_shotgun_arm)
			{
				aim_time -= global.game_spd
			}
			else
			{
				if shotgun_frame = 0
					audio_play_sound(choose(sound_enemy_shotgun_reload_01,sound_enemy_shotgun_reload_02,sound_enemy_shotgun_reload_03),999,0)
				shotgun_frame += 0.25*global.game_spd	
			}

			if aim_time <= 0 
			{
				audio_play_sound(sound_shotgun_fire,999,0)
				var x_ = x+lengthdir_x(10,attack_dir)
				var y_ = y-2+lengthdir_y(10,attack_dir)
				repeat(3)
				{
					create_bullet(x_,y_,depth+1,attack_dir+random_range(-20,20),22)
				}
				create_bullet(x_,y_,depth+1,attack_dir+random_range(-25,25),19)
				create_bullet(x_,y_,depth+1,attack_dir+random_range(-45,45),19)
				create_bullet(x_,y_,depth+1,attack_dir,18)
				
				with particule_create(x_,y_,depth-1,choose(spr_gunspark,spr_gunspark2,spr_gunspark3))
				{
					image_angle = other.attack_dir
					image_yscale = other.image_xscale
				}
				with particule_create(x_,y_,depth-1,choose(spr_gunsmoke,spr_gunsmoke2,spr_gunsmoke3))
				{
					image_angle = other.attack_dir
					image_yscale = other.image_xscale
					image_alpha = .5
				}
				reload_time = reload_time_max
				aim_time = aim_time_max
				shotgun_frame = 0
			}
		}
	}
	
	if  !(distance_to_object(obj_player)<450
	&&	!collision_line(x,y-2,obj_player.x,obj_player.y-2,par_collision,0,0)
	&&	!collision_line(x,y-2,obj_player.x,obj_player.y-2,obj_door,0,0))
	{
		state = state_follow
	}
	else
	{
		target_x = obj_player.x
		target_y = obj_player.y
	}
	
}#endregion

state_hit = function() {#region
	
	if !place_free(x,y-1) && vspd < 0
		vspd = 0
	
	grav = 6
	vspd = lerp(vspd,grav,0.05*global.game_spd)
	
	if !place_free(x+hspd,y)
	{hspd = -hspd/2}
	
	instance_get_information()
	
	if in_air
	{
		hspd = lerp(hspd,0,.01*global.game_spd)
		sprite_index = spr_shotgun_hurtfly
		image_speed_set(0)
	}
	else
	{
		if place_meeting(x,y+1,par_slope)
		{
			sprite_index = spr_shotgun_stairfall
			image_speed_set(1)
			hspd = -(instance_place(x,y+1,par_slope).image_xscale)*1.5
			vspd = grav
		}
		else
		{
			hspd = lerp(hspd,0,.1*global.game_spd)
			image_speed_set(1)
			if sprite_index != spr_shotgun_hurtground
			{
				audio_play_sound(choose(sound_enemy_blood_squirt_01,sound_enemy_blood_squirt_02,sound_enemy_blood_squirt_03),999,0)
				audio_play_sound(sound_enemy_hitfloor,999,0)
				image_speed_set(1)
				sprite_index	= spr_shotgun_hurtground
				image_index		= 0
			}
		}
	}
}#endregion

state_door = function() {#region
	
	var inst	= instance_place(x,y,obj_enemy_door)
	
	if !inst
	{
		state = state_waiting
		exit
	}
	
	var inst_	= inst.door_target
	x = lerp(x,inst.x,.25*global.game_spd)
	hspd = 0
	image_speed_set(1)
	
	switch door_step 
	{
		case 0 : 
			image_alpha -= 0.1*global.game_spd
			
			sprite_index = spr_shotgun_enterstair
			
			if image_alpha <= 0
			{
				x += (inst_.x-inst.x)
				y += (inst_.y-inst.y)
				door_step = 1
				image_alpha = 0
			}
		break
		case 1 : 
			image_alpha += 0.1*global.game_spd
			
			sprite_index = spr_shotgun_leavestair
			
			if image_alpha >= 1
			{
				door_step = 0
				state = state_follow
				collision_free()
				image_alpha = 1
			}
		break
	}
}#endregion

dommage_system = function() {#region
	
	if state != state_hit
	&& state != state_door
	{
		enemy_dommage_slash()
		enemy_dommage_ball()
		enemy_dommage_pickable()
		enemy_dommage_other()
	}
	
	enemy_dommage_lazer()
	
}#endregion

state = state_waiting