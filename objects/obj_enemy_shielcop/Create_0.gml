image_speed_init()
enemy_ai_init()

spd = 3

enemy_init_variables()

waiting_time = 80
waiting_time_max = 80

attack			= noone
attack_in_done	= false
attack_dir		= 0
arm_dir			= 270
aim_time		= 10
aim_time_max	= 10	
reload_time		= 20
reload_time_max	= 40

door_step= 0

state_waiting = function() {#region
	vspd = grav
	
	sprite_index = spr_shieldcop_idle
	
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
	enemy_ai_walk(spr_shieldcop_turn,spr_shieldcop_walk)
}#endregion

state_follow = function() {#region
	vspd = grav
	aim_time = aim_time_max
	arm_dir	= 270
	enemy_ai_follow()
	
	if abs(hspd)<0.25
	{
		sprite_index = spr_shieldcop_idle
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
		sprite_index = spr_shieldcop_run
		image_speed_set(abs(hspd)/3)
	}
		
	if enemy_ai_saw_player
	&& ((distance_to_object(obj_player)>150&& (distance_to_object(obj_player)<300))
	|| obj_player.state = obj_player.state_hit)
	{state = state_attack}
	else 
	if point_distance(x,y,obj_player.x+obj_player.hspd,obj_player.y)<55
	&& !collision_line(x,y,obj_player.x,obj_player.y,obj_door,0,0)
	{
		state = state_kick_player
	}
	
	if hspd != 0
	{image_xscale = sign(hspd)}
	
	enemy_ai_moving_through_door()
	enemy_ai_open_door()
	
}#endregion

state_kick_player = function() {#region
	
	hspd = lerp(hspd,0,.5)
	vspd = grav
	
	if sprite_index != spr_shieldcop_bash
	{
		image_speed_set(1)
		attack_dir = point_direction(x,y,obj_player.x,obj_player.y)
		attack_in_done = false
		sprite_index	= spr_shieldcop_bash
		image_index		= 0
	}
	
	if image_index > 1 && !attack_in_done
	{
		audio_play_sound(sound_enemy_punch,999,0)
		
		var atk = instance_create_depth(x,y,depth-1,obj_enemy_shielcop_slash)
		atk.image_xscale = image_xscale
		atk.visible = false
		
		attack = atk
		attack_in_done = true
	}
	
}#endregion

state_attack = function() {#region
	
	hspd = lerp(hspd,0,.5)
	vspd = grav
	
	if sprite_index != spr_shieldcop_aim
	{
		image_speed_set(0)
		sprite_index	= spr_shieldcop_aim
	}
	
	if target_x < x	
		image_xscale = -1
	else
		image_xscale = 1
	
	attack_dir = point_direction(x,y-2,target_x,target_y)
	var dif = angle_difference(attack_dir,arm_dir)/12
	
	arm_dir += dif*global.game_spd

	if attack_dir < 0
	{attack_dir += 360}
	else if attack_dir > 360
	{attack_dir -= 360}
	
	if arm_dir < 0
	{arm_dir += 360}
	else if arm_dir > 360
	{arm_dir -= 360}
	
	if arm_dir > 90 && arm_dir < 270
	{image_index = (1-(arm_dir-90)/180)*image_number-0.1}
	else if arm_dir <= 90
	{image_index = (arm_dir+90)/180*image_number-0.1}
	else if arm_dir >= 270
	{image_index = (arm_dir-270)/180*image_number-0.1}
	
	
	if abs(dif)<1.5
	{
		if reload_time > 0
		{
			reload_time -= global.game_spd
		}
		else
		{
			aim_time -= global.game_spd
			if aim_time <= 0
			{
				audio_play_sound(choose(sound_gun_fire_1,sound_gun_fire_2),999,0)
				var x_ = x+lengthdir_x(10,attack_dir)
				var y_ = y-2+lengthdir_y(10,attack_dir)
				create_bullet(x_,y_,depth+1,attack_dir,20)
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
				
				arm_dir += image_xscale*20
				
				reload_time = reload_time_max
				aim_time = aim_time_max
			}
		}
	}
	
	if  !(distance_to_object(obj_player)<400
	&&	!collision_line(x,y-2,obj_player.x,obj_player.y-2,par_collision,0,0)
	&&	!collision_line(x,y-2,obj_player.x,obj_player.y-2,obj_door,0,0))
	||  (distance_to_object(obj_player)<80 && obj_player.state != obj_player.state_hit)
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
		sprite_index = spr_shieldcop_hurtfly
		image_speed_set(0)
	}
	else
	{
		if place_meeting(x,y+1,par_slope)
		{
			sprite_index = spr_shieldcop_stairfall
			image_speed_set(1)
			hspd = -(instance_place(x,y+1,par_slope).image_xscale)*1.5
			vspd = grav
		}
		else
		{
			hspd = lerp(hspd,0,.1*global.game_spd)
			image_speed_set(1)
			if sprite_index != spr_shieldcop_hurtground
			{
				audio_play_sound(choose(sound_enemy_blood_squirt_01,sound_enemy_blood_squirt_02,sound_enemy_blood_squirt_03),999,0)
				audio_play_sound(sound_enemy_hitfloor,999,0)
				image_speed_set(1)
				sprite_index	= spr_shieldcop_hurtground
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
			
			sprite_index = spr_shieldcop_enterstair
			
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
			
			sprite_index = spr_shieldcop_leavestair
			
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

state_knockdown = function() {#region
	hspd = lerp(hspd,0,.08*global.game_spd)
	if abs(hspd)<0.2
	{state = state_follow}
}#endregion

dommage_system = function() {#region
	
	if state != state_hit
	&& state != state_door
	{
		enemy_dommage_slash(true,function(){ #region
			var inst = instance_place(x,y,obj_player_attack)
			
			audio_play_sound(sound_enemy_swordshield,999,0)
			
			sleep(15)
			screen_shake_set(5,20,-3)
			
			sprite_index = spr_shieldcop_knockback
			image_index = 0
			
			hspd = -image_xscale*7
			state = state_knockdown
			
			if inst.object_index = obj_player_attack
			{
				with inst.creator
				{
					state = state_normal
					mov_spd = 0.01
					hspd = -lengthdir_x(10,inst.image_angle)
					vspd = -lengthdir_y(10,inst.image_angle)
				}
			}
			
			instance_destroy(inst)
		}) #endregion
		enemy_dommage_ball(true,function(){ #region
			var inst = instance_place(x,y,obj_player_ball)
			
			audio_play_sound(sound_enemy_swordshield,999,0)
			
			sleep(15)
			screen_shake_set(5,20,-3)
			
			sprite_index = spr_shieldcop_knockback
			image_index = 0
			
			hspd = -image_xscale*9
			state = state_knockdown
			
			instance_destroy(inst)
		}) #endregion
		enemy_dommage_pickable(true,function(){ #region
			var inst = instance_place(x,y,obj_pickable_trow)
			
			audio_play_sound(sound_enemy_swordshield,999,0)
			
			sleep(15)
			screen_shake_set(5,20,-3)
			
			sprite_index = spr_shieldcop_knockback
			image_index = 0
			
			hspd = -image_xscale*9
			state = state_knockdown
			
			instance_destroy(inst)
		}) #endregion
		enemy_dommage_other()
	}
	
	enemy_dommage_lazer()
	
}#endregion

state = state_waiting