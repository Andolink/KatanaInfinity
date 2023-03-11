image_speed_init()
enemy_ai_init()

enemy_init_variables()

waiting_time = 80
waiting_time_max = 80

attack			= noone
attack_in_done	= false
attack_dir		= 0

door_step= 0

state_waiting = function() {#region
	vspd = grav
	
	sprite_index = spr_grunt_idle
	
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
	
	enemy_ai_walk(spr_grunt_turn,spr_grunt_walk)
	
}#endregion

state_follow = function() {#region
	vspd = grav
	
	enemy_ai_follow()
	
	if abs(hspd)<0.25
	{
		sprite_index = spr_grunt_idle
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
		sprite_index = spr_grunt_run
		image_speed_set(abs(hspd)/3)
	}
	
	if point_distance(x,y,obj_player.x+obj_player.hspd,obj_player.y)<55
	&& !collision_line(x,y,obj_player.x,obj_player.y,obj_door,0,0)
	{state = state_attack}
	
	if hspd != 0
	{image_xscale = sign(hspd)}
	
	enemy_ai_moving_through_door()
	enemy_ai_open_door()
	
}#endregion

state_attack = function() {#region
	
	hspd = lerp(hspd,0,.5)
	vspd = grav
	
	if sprite_index != spr_grunt_attack
	{
		image_speed_set(1)
		attack_dir = point_direction(x,y,target_x,target_y)
		attack_in_done = false
		sprite_index	= spr_grunt_attack
		image_index		= 0
	}
	
	if image_index > 3 && !attack_in_done
	{
		audio_play_sound(sound_enemy_punch,999,0)
			
		var atk = instance_create_depth(x,y,depth-1,obj_enemy_terry_slash)
		atk.image_angle = attack_dir
		if atk.image_angle > 90 && atk.image_angle < 270
			atk.image_yscale = -1 
		
		attack = atk
		attack_in_done = true
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
		sprite_index = spr_grunt_hurt_fly
		image_speed_set(0)
	}
	else
	{
		if place_meeting(x,y+1,par_slope)
		{
			sprite_index = spr_grunt_stair_fall
			image_speed_set(1)
			hspd = -(instance_place(x,y+1,par_slope).image_xscale)*1.5
			vspd = grav
		}
		else
		{
			hspd = lerp(hspd,0,.1*global.game_spd)
			image_speed_set(1)
			if sprite_index != spr_grunt_hurt_ground
			{
				audio_play_sound(choose(sound_enemy_blood_squirt_01,sound_enemy_blood_squirt_02,sound_enemy_blood_squirt_03),999,0)
				audio_play_sound(sound_enemy_hitfloor,999,0)
				image_speed_set(1)
				sprite_index	= spr_grunt_hurt_ground
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
	
	sprite_index = spr_grunt_run
	
	switch door_step 
	{
		case 0 : 
			image_alpha -= 0.1*global.game_spd
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