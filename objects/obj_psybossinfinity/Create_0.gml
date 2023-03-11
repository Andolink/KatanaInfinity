instance_create_depth(0,0,0,obj_glitch_feedback,{play_sound : false})

instance_create_depth(x,y,depth,obj_light_psychboss)
instance_create_depth(768,256,depth+10,obj_psych_barrier)

if !(global.speedrun_mode && global.speedrun_char_mode != 0)
{
	with obj_player
	{
		player_set_characters(skin_zero,gameplay_sword) 
		allow_char_switch = false
	}
}
else
{
	player_set_char_speedrun_option()
}

with obj_music_control
{
	new_music_intro = mus_katanaback_intro 
	new_music_loop = mus_katanaback_loop
}

ang		= 0
img		= 0
time_before_attack = 100
time_before_attack_max = 100
hp		= 5

attack_start = false
attack_ang = 0
attack_time = 0
end_state = 0

x_target = x
y_target = y

image_speed_init()

instance_create_depth(782,80,depth+1,obj_psybossinfinity_tentacle)
instance_create_depth(1361,80,depth+1,obj_psybossinfinity_tentacle)

if global.boss_state = 0
	audio_play_sound(sound_boss_therapist_powerup_01,999,0)

state_go_to_final_phase = function() { #region
	if sprite_index != spr_psychboss_disappear 
	{
		audio_play_sound(sound_boss_therapist_darkcape_01,999,0)
		instance_create_depth(0,0,0,obj_glitch_feedback).time = 30
		sleep(30)
		layer_set_visible(layer_get_id("GlitchedEffect0"),true)
		layer_set_visible(layer_get_id("GlitchedEffect1"),true)
		layer_set_visible(layer_get_id("GlitchedEffect2"),true)
		instance_create_depth(832,80,depth+1,obj_psybossinfinity_tentacle)
		instance_create_depth(1311,80,depth+1,obj_psybossinfinity_tentacle)
		sprite_index = spr_psychboss_disappear
		image_index = 0
	}
}#endregion

state_end = function() { #region
	if end_state = 0
	{
		obj_music_control.new_music_intro = -1  
		obj_music_control.new_music_loop = -1
		instance_create_depth(0,0,0,obj_glitch_feedback).time = 30
		sleep(30)
		layer_set_visible(layer_get_id("GlitchedEffect0"),false)
		layer_set_visible(layer_get_id("GlitchedEffect1"),false)
		layer_set_visible(layer_get_id("GlitchedEffect2"),false)
		instance_destroy(obj_psybossinfinity_tentacle)
		instance_destroy(obj_psych_bullet)
	}
	end_state ++
	if end_state >= 30
	{room_goto_next()}
}#endregion

state_idle = function() { #region
	
	x_target = xstart+lengthdir_x(150,ang)
	y_target = 140+lengthdir_y(32,ang*2)
	
	ang += 2*global.game_spd
	time_before_attack-=global.game_spd
	
	if time_before_attack <= 0
	&& sprite_index != spr_psychboss_disappear 
	{
		sprite_index = spr_psychboss_disappear
		image_index = 0
	}
	
} #endregion

state_attack_middle_shoot = function() { #region
	
	if !attack_start
	{
		attack_ang = 0 
		attack_time = 0
		
		ang = 0
		x_target = xstart
		y_target = 110
		
		attack_start = true
	}
	else
	{
		if attack_ang < -180
		&& sprite_index != spr_psychboss_disappear
		{
			with obj_psych_bullet
			{start = true}
			sprite_index = spr_psychboss_disappear
			image_index = 0
		}
		else if sprite_index != spr_psychboss_disappear
		{
			if attack_time <= 0
			{
				create_psych_bullet(
				x + lengthdir_x(64,attack_ang),y + lengthdir_y(64,attack_ang),
				depth-1,attack_ang,15,false)
				attack_time = 2
			}
			attack_ang -= 4*global.game_spd
			attack_time -= global.game_spd
		}
	}
	
} #endregion

state_attack_corner_shoot = function() { #region
	
	if !attack_start
	{
		attack_ang = 0 
		attack_time = 0
		
		ang = 0
		x_target = 780 //x_target = 1340
		y_target = 110
		
		attack_start = true
	}
	else
	{
		if attack_ang < -90
		&& sprite_index != spr_psychboss_disappear
		{
			with obj_psych_bullet
			{start = true}
			sprite_index = spr_psychboss_disappear
			image_index = 0
		}
		else if sprite_index != spr_psychboss_disappear
		{
			if attack_time <= 0
			{
				create_psych_bullet(
				x + lengthdir_x(64,attack_ang),y + lengthdir_y(64,attack_ang),
				depth-1,attack_ang,15,false)
				attack_time = 2
			}
			attack_ang -= 4*global.game_spd
			attack_time -= global.game_spd
		}
	}
	
} #endregion

state_attack_bot_shoot = function() { #region
	
	if !attack_start
	{
		attack_ang = 0 
		attack_time = 0
		
		ang = 0
		x_target = 780 //x_target = 1340
		y_target = 310
		
		attack_start = true
	}
	else
	{
		if attack_ang > 90
		&& sprite_index != spr_psychboss_disappear
		{
			with obj_psych_bullet
			{start = true}
			sprite_index = spr_psychboss_disappear
			image_index = 0
		}
		else if sprite_index != spr_psychboss_disappear
		{
			if attack_time <= 0
			{
				create_psych_bullet(
				x + lengthdir_x(64,attack_ang),y + lengthdir_y(64,attack_ang),
				depth-1,attack_ang,15,false)
				attack_time = 2
			}
			attack_ang += 4*global.game_spd
			attack_time -= global.game_spd
		}
	}
	
} #endregion

state_attack_corner2_shoot = function() { #region
	
	if !attack_start
	{
		attack_ang = 180
		attack_time = 0
		
		ang = 0
		x_target = 1358 //x_target = 1340
		y_target = 110
		
		attack_start = true
	}
	else
	{
		if attack_ang > 270
		&& sprite_index != spr_psychboss_disappear
		{
			with obj_psych_bullet
			{start = true}
			sprite_index = spr_psychboss_disappear
			image_index = 0
		}
		else if sprite_index != spr_psychboss_disappear
		{
			if attack_time <= 0
			{
				create_psych_bullet(
				x + lengthdir_x(64,attack_ang),y + lengthdir_y(64,attack_ang),
				depth-1,attack_ang,15,false)
				attack_time = 2
			}
			attack_ang += 4*global.game_spd
			attack_time -= global.game_spd
		}
	}
	
} #endregion

state_attack_bot2_shoot = function() { #region
	
	if !attack_start
	{
		attack_ang = 180
		attack_time = 0
		
		ang = 0
		x_target = 1358 //x_target = 1340
		y_target = 310
		
		attack_start = true
	}
	else
	{
		if attack_ang < 90
		&& sprite_index != spr_psychboss_disappear
		{
			with obj_psych_bullet
			{start = true}
			sprite_index = spr_psychboss_disappear
			image_index = 0
		}
		else if sprite_index != spr_psychboss_disappear
		{
			if attack_time <= 0
			{
				create_psych_bullet(
				x + lengthdir_x(64,attack_ang),y + lengthdir_y(64,attack_ang),
				depth-1,attack_ang,15,false)
				attack_time = 2
			}
			attack_ang -= 4*global.game_spd
			attack_time -= global.game_spd
		}
	}
	
} #endregion

state_attack_side_shoot = function() { #region
	
	if !attack_start
	{
		attack_ang = 0
		attack_time = 0
		
		ang = 0
		x_target = 780 //x_target = 1340
		y_target = 110
		
		attack_start = true
	}
	else
	{
		if y > 310
		&& sprite_index != spr_psychboss_disappear
		{
			sprite_index = spr_psychboss_disappear
			image_index = 0
		}
		else if sprite_index != spr_psychboss_disappear
		{
			y += 8*global.game_spd 
			y_target += 8*global.game_spd
			
			if attack_time <= 0
			{
				create_psych_bullet(
				x + lengthdir_x(64,attack_ang),y + lengthdir_y(64,attack_ang),
				depth-1,attack_ang,15,false,5)
				attack_time = 1
			}
			attack_time -= global.game_spd
		}
	}
	
} #endregion

state_attack_side2_shoot = function() { #region
	
	if !attack_start
	{
		attack_ang = 180
		attack_time = 0
		
		ang = 0
		x_target = 1358 //x_target = 1340
		y_target = 110
		
		attack_start = true
	}
	else
	{
		if y > 310
		&& sprite_index != spr_psychboss_disappear
		{
			with obj_psych_bullet
			{start = true}
			sprite_index = spr_psychboss_disappear
			image_index = 0
		}
		else if sprite_index != spr_psychboss_disappear
		{
			y += 8*global.game_spd y_target += 8*global.game_spd
			
			if attack_time <= 0
			{
				create_psych_bullet(
				x + lengthdir_x(64,attack_ang),y + lengthdir_y(64,attack_ang),
				depth-1,attack_ang,15,false,5)
				attack_time = 1
			}
			attack_time -= global.game_spd
		}
	}
	
} #endregion

state_attack_top_shoot = function() { #region
	
	if !attack_start
	{
		attack_ang = 0 
		attack_time = 0
		
		ang = 0
		x_target = xstart
		y_target = 110
		y = 110
		
		attack_start = true
	}
	else
	{
		if attack_ang > 100
		&& sprite_index != spr_psychboss_disappear
		{
			sprite_index = spr_psychboss_disappear
			image_index = 0
		}
		else if sprite_index != spr_psychboss_disappear
		{
			if attack_time <= 0
			{
				if global.speedrun_stableseed
				{
					x = 780+sqr(ang)*state_id
					while(x > 1358)
					{x -= 1358-780}
				}
				else
				{x = random_range(780,1358)}
				x_target = x y_target = y
				create_psych_bullet(
				x + lengthdir_x(64,270),y + lengthdir_y(64,270),
				depth-1,270,15,false,10)
				attack_time = 2
				ang++
			}
			attack_ang += global.game_spd
			attack_time -= global.game_spd
		}
	}
	
} #endregion

state_attack_throw_shoot = function() { #region
	
	if !attack_start
	{
		attack_ang = 0 
		attack_time = 0
		
		ang = 0
		x = random_range(780,1358)
		x_target = x
		y_target = 110
		
		attack_start = true
	}
	else
	{
		if sprite_index != spr_psychboss_disappear
		{
			if attack_time <= 0
			{
				var dir_g = point_direction(x,y,obj_player.x,obj_player.y)
				
				var x_ = x + lengthdir_x(64,dir_g) 
				var y_ = y + lengthdir_y(64,dir_g) 
				var dir_ = point_direction(x_,y_,obj_player.x,obj_player.y)
				create_psych_bullet(
				x + lengthdir_x(64,dir_),y + lengthdir_y(64,dir_),
				depth-1,dir_,15,false,10)
				
				var x_ = x + lengthdir_x(64,dir_g-20) 
				var y_ = y + lengthdir_y(64,dir_g-20) 
				var dir_ = point_direction(x_,y_,obj_player.x,obj_player.y)
				create_psych_bullet(
				x + lengthdir_x(64,dir_),y + lengthdir_y(64,dir_),
				depth-1,dir_,15,false,10)
				
				var x_ = x + lengthdir_x(64,dir_g+20) 
				var y_ = y + lengthdir_y(64,dir_g+20) 
				var dir_ = point_direction(x_,y_,obj_player.x,obj_player.y)
				create_psych_bullet(
				x + lengthdir_x(64,dir_),y + lengthdir_y(64,dir_),
				depth-1,dir_,15,false,10)
				
				attack_time = 0
				ang ++
				sprite_index = spr_psychboss_disappear
				image_index = 0
			}
			attack_time -= global.game_spd
		}
	}
	
} #endregion

state_attack_final_shoot = function() { #region
	
	if !attack_start
	{
		attack_ang = 0 
		attack_time = 0
		attack_len = 64
		
		ang = 0
		x_target = xstart
		y_target = 135
		
		attack_start = true
	}
	else
	{
		if attack_ang > 360
		&& sprite_index != spr_psychboss_disappear
		{
			sprite_index = spr_psychboss_disappear
			image_index = 0
		}
		else if sprite_index != spr_psychboss_disappear
		{
			if attack_time <= 0 && attack_len < 128
			{
				var ang_ = random(10)
				repeat(36)
				{
					create_psych_bullet(
					x + lengthdir_x(attack_len,ang_),y + lengthdir_y(attack_len,ang_),
					depth-1,ang_,15,false,180-attack_ang*.15)
					ang_ += 10
				}
				attack_len += 16
				attack_time = 50
			}
			attack_ang += global.game_spd
			attack_time -= global.game_spd
		}
	}
	
} #endregion
	
state_attack_sidetop_shoot = function() { #region
	
	if !attack_start
	{
		attack_ang = 270
		attack_time = 0
		
		ang = 0
		x_target = 780 //x_target = 1340
		y_target = 110
		
		attack_start = true
	}
	else
	{
		if x > 1358
		&& sprite_index != spr_psychboss_disappear
		{
			with obj_psych_bullet
			{start = true}
			sprite_index = spr_psychboss_disappear
			image_index = 0
		}
		else if sprite_index != spr_psychboss_disappear
		{
			x += 8*global.game_spd x_target += 8*global.game_spd
			
			if attack_time <= 0
			{
				create_psych_bullet(
				x + lengthdir_x(64,attack_ang),y + lengthdir_y(64,attack_ang),
				depth-1,attack_ang,12,false,10)
				attack_time = 1
			}
			attack_time -= global.game_spd
		}
	}
	
} #endregion

state_attack_final_attack = function() { #region
	
	if !attack_start
	{
		x_target = xstart
		y_target = 110
		attack_start = true
		sprite_index = spr_psychboss_energyball_charge
		image_index = 0
	}
	else
	{

	}
	
} #endregion

state_generate_enemies0 = function() { #region
	
	if !attack_start
	{
		time_before_attack = 75
		with instance_create_depth(928,318,depth,obj_psych_enemy_generator)
		{image_xscale =  1 spd = .7 obj = obj_enemy_terry}
		with instance_create_depth(1216,312,depth,obj_psych_enemy_generator)
		{image_xscale = -1 spd = .7 }
		attack_start = true
	}
	
	x_target = xstart+lengthdir_x(150,ang)
	y_target = 140+lengthdir_y(32,ang*2)
	
	ang += 2*global.game_spd
	time_before_attack-=global.game_spd
	
	if time_before_attack <= 0
	&& sprite_index != spr_psychboss_disappear 
	{
		sprite_index = spr_psychboss_disappear
		image_index = 0
	}
	
} #endregion

state_generate_enemies1 = function() { #region
	
	if !attack_start
	{
		time_before_attack = 75
		with instance_create_depth( 800,311,depth,obj_psych_enemy_generator)
		{image_xscale =  1 spd = .7 obj = obj_enemy_shotgun}
		with instance_create_depth(1344,311,depth,obj_psych_enemy_generator)
		{image_xscale = -1 spd = .7 obj = obj_enemy_shotgun}
		with instance_create_depth( 856,318,depth,obj_psych_enemy_generator)
		{image_xscale =  1 spd = .7 obj = obj_enemy_terry}
		with instance_create_depth(1288,318,depth,obj_psych_enemy_generator)
		{image_xscale = -1 spd = .7 obj = obj_enemy_terry}
		attack_start = true
	}
	
	x_target = xstart+lengthdir_x(150,ang)
	y_target = 140+lengthdir_y(32,ang*2)
	
	ang += 2*global.game_spd
	time_before_attack-=global.game_spd
	
	if time_before_attack <= 0
	&& sprite_index != spr_psychboss_disappear 
	{
		sprite_index = spr_psychboss_disappear
		image_index = 0
	}
	
} #endregion

state_generate_enemies_redpomp = function() { #region
	
	if !attack_start
	{
		time_before_attack = 75
		with instance_create_depth( 856,316,depth,obj_psych_enemy_generator)
		{image_xscale =  1 spd = .7 obj = obj_enemy_redpomp}
		with instance_create_depth(1288,316,depth,obj_psych_enemy_generator)
		{image_xscale = -1 spd = .7 obj = obj_enemy_redpomp}
		attack_start = true
	}
	
	x_target = xstart+lengthdir_x(150,ang)
	y_target = 140+lengthdir_y(32,ang*2)
	
	ang += 2*global.game_spd
	time_before_attack-=global.game_spd
	
	if time_before_attack <= 0
	&& sprite_index != spr_psychboss_disappear 
	{
		sprite_index = spr_psychboss_disappear
		image_index = 0
	}
	
} #endregion

state_generate_enemies_drone = function() { #region
	
	if (!attack_start || time_before_attack <= 0)
	&& sprite_index != spr_psychboss_die 
	{
		time_before_attack = 158
		
		if choose(0,1)
		{
			with instance_create_depth( 800+150,200,depth,obj_psych_enemy_generator)
			{image_xscale =  1 spd = .5 obj = obj_drone}
		}
		else
		{
			with instance_create_depth(1344-150,200,depth,obj_psych_enemy_generator)
			{image_xscale = -1spd = .5  obj = obj_drone}
		}
		attack_start = true
	}
	
	if sprite_index != spr_psychboss_die 
	{
		x_target = xstart+lengthdir_x(64,ang)
		y_target = 140+lengthdir_y(32,ang*2)
	}
	
	ang += 2*global.game_spd
	time_before_attack-=global.game_spd
	
	if place_meeting(x,y,obj_explosion)
	&& sprite_index != spr_psychboss_die 
	{
		sleep(12)
		screen_shake_set(5,40,-5)
		audio_play_sound(sound_boss_therapist_blastimpact_01,999,0)
		sprite_index = spr_psychboss_die
		image_index = 0
	}
	
} #endregion

#region State List

state_id = 0

#region NORMAL
if global.difficulty = 1
{
	state_list[0] = state_attack_side_shoot
	state_list[1] = state_attack_side2_shoot
	state_list[2] = state_attack_corner_shoot
	state_list[3] = state_attack_corner2_shoot
	state_list[4] = state_attack_middle_shoot
	state_list[5] = state_attack_final_attack
	
	state_list[6] = state_idle
	
	state_list[7] = state_generate_enemies0
	state_list[8] = state_idle
	state_list[9] = state_attack_side_shoot
	state_list[10]= state_attack_side2_shoot
	state_list[11]= state_attack_middle_shoot
	state_list[12]= state_generate_enemies_redpomp
	state_list[13]= state_idle
	state_list[14]= state_attack_final_attack
	
	state_list[15]= state_idle
	
	state_list[16]= state_attack_middle_shoot
	state_list[17]= state_attack_throw_shoot
	state_list[18]= state_attack_throw_shoot
	state_list[19]= state_attack_throw_shoot
	state_list[20]= state_attack_corner_shoot
	state_list[21]= state_attack_bot_shoot
	state_list[22]= state_attack_corner2_shoot
	state_list[23]= state_attack_bot2_shoot
	state_list[24]= state_attack_final_attack
	
	state_list[25]= state_idle
	
	state_list[26]= state_generate_enemies1
	state_list[27]= state_idle
	state_list[28]= state_attack_throw_shoot
	state_list[29]= state_attack_throw_shoot
	state_list[30]= state_generate_enemies0
	state_list[31]= state_attack_corner_shoot
	state_list[32]= state_attack_corner2_shoot
	state_list[33]= state_generate_enemies_redpomp
	state_list[34]= state_attack_final_attack
	
	state_list[35]= state_go_to_final_phase
	state_list[36]= state_idle
	
	state_list[37]= state_generate_enemies_drone
	state_list[38]= state_idle
	state_list[39]= state_generate_enemies_redpomp
	state_list[40]= state_attack_side_shoot
	state_list[41]= state_attack_sidetop_shoot
	state_list[42]= state_generate_enemies0
	state_list[43]= state_generate_enemies_drone
	state_list[44]= state_attack_middle_shoot
	state_list[45]= state_attack_final_attack
	state_list[46]= state_go_to_final_phase
	state_list[47]= state_attack_middle_shoot
	state_list[48]= state_attack_throw_shoot
	state_list[49]= state_attack_side_shoot
	state_list[50]= state_generate_enemies_redpomp
	state_list[51]= state_attack_throw_shoot
	state_list[52]= state_attack_side2_shoot
	state_list[53]= state_attack_final_attack
	
	state_list[54]= state_end

	//state_list[0] = state_attack_middle_shoot
	//state_list[1] = //state_attack_corner_shoot
	//state_list[2] = state_attack_bot_shoot
	//state_list[3] = state_attack_bot2_shoot
	//state_list[4] = state_attack_corner2_shoot
	//state_list[5] = state_attack_middle_shoot
	//state_list[6] = state_attack_side_shoot
	//state_list[7] = state_attack_side2_shoot
	//state_list[8] = state_attack_side_shoot
	//state_list[9] = state_attack_final_attack
	////
	//state_list[10]= state_idle
	//state_list[11]= state_attack_throw_shoot
	//state_list[12]= state_attack_side_shoot
	//state_list[13]= state_attack_throw_shoot
	//state_list[14]= state_attack_side2_shoot
	//state_list[15]= state_attack_bot_shoot
	//state_list[16]= state_attack_side_shoot
	//state_list[17]= state_attack_side_shoot
	//state_list[18]= state_attack_bot2_shoot
	//state_list[19]= state_attack_side2_shoot
	//state_list[20]= state_attack_side2_shoot
	//state_list[21]= state_attack_top_shoot
	//state_list[22]= state_attack_final_attack
	////
	//state_list[23]= state_idle
	//state_list[24]= state_attack_middle_shoot
	//state_list[25]= state_attack_middle_shoot
	//state_list[26]= state_attack_side_shoot
	//state_list[27]= state_attack_side2_shoot
	//state_list[28]= state_attack_throw_shoot
	//state_list[29]= state_attack_throw_shoot
	//state_list[30]= state_attack_throw_shoot
	//state_list[31]= state_attack_top_shoot
	//state_list[32]= state_attack_side_shoot
	//state_list[33]= state_attack_side2_shoot
	//state_list[34]= state_attack_final_shoot
	//state_list[35]= state_go_to_final_phase
	////
	//state_list[36]= state_idle
	//state_list[37]= state_attack_middle_shoot
	//state_list[38]= state_attack_throw_shoot
	//state_list[39]= state_attack_throw_shoot
	//state_list[40]= state_attack_bot_shoot
	//state_list[41]= state_attack_bot2_shoot
	//state_list[42]= state_attack_throw_shoot
	//state_list[43]= state_attack_throw_shoot
	//state_list[44]= state_attack_side_shoot
	//state_list[45]= state_attack_sidetop_shoot
	//state_list[46]= state_attack_side2_shoot
	//state_list[47]= state_attack_throw_shoot
	//state_list[48]= state_attack_throw_shoot
	//state_list[49]= state_attack_top_shoot
	//state_list[50]= state_attack_middle_shoot
	//state_list[51]= state_attack_throw_shoot
	//state_list[52]= state_attack_throw_shoot
	//state_list[53]= state_attack_throw_shoot
	//state_list[54]= state_attack_throw_shoot
	//state_list[55]= state_attack_final_attack
	//state_list[56]= state_end
}
#endregion
#region HARD
if global.difficulty = 2
{
	state_list[0] = state_attack_side_shoot
	state_list[1] = state_attack_side2_shoot
	state_list[2] = state_attack_corner_shoot
	state_list[3] = state_attack_corner2_shoot
	state_list[4] = state_attack_middle_shoot
	state_list[5] = state_attack_final_attack
	
	state_list[6] = state_idle
	
	state_list[7] = state_generate_enemies0
	state_list[8] = state_idle
	state_list[9] = state_attack_side_shoot
	state_list[10]= state_attack_side2_shoot
	state_list[11]= state_attack_middle_shoot
	state_list[12]= state_generate_enemies_redpomp
	state_list[13]= state_idle
	state_list[14]= state_attack_final_attack
	
	state_list[15]= state_idle
	
	state_list[16]= state_attack_middle_shoot
	state_list[17]= state_attack_throw_shoot
	state_list[18]= state_attack_throw_shoot
	state_list[19]= state_attack_throw_shoot
	state_list[20]= state_attack_corner_shoot
	state_list[21]= state_attack_bot_shoot
	state_list[22]= state_attack_corner2_shoot
	state_list[23]= state_attack_bot2_shoot
	state_list[24]= state_attack_final_attack
	
	state_list[25]= state_idle
	
	state_list[26]= state_generate_enemies1
	state_list[27]= state_idle
	state_list[28]= state_attack_throw_shoot
	state_list[29]= state_attack_throw_shoot
	state_list[30]= state_generate_enemies0
	state_list[31]= state_attack_corner_shoot
	state_list[32]= state_attack_corner2_shoot
	state_list[33]= state_generate_enemies_redpomp
	state_list[34]= state_attack_final_attack
	
	state_list[35]= state_go_to_final_phase
	state_list[36]= state_idle
	
	state_list[37]= state_generate_enemies_drone
	state_list[38]= state_idle
	state_list[39]= state_generate_enemies_redpomp
	state_list[40]= state_attack_side_shoot
	state_list[41]= state_attack_sidetop_shoot
	state_list[42]= state_generate_enemies0
	state_list[43]= state_generate_enemies_drone
	state_list[44]= state_attack_middle_shoot
	state_list[45]= state_attack_final_attack
	state_list[46]= state_go_to_final_phase
	state_list[47]= state_attack_middle_shoot
	state_list[48]= state_attack_throw_shoot
	state_list[49]= state_attack_side_shoot
	state_list[50]= state_generate_enemies_redpomp
	state_list[51]= state_attack_throw_shoot
	state_list[52]= state_attack_side2_shoot
	state_list[53]= state_attack_final_attack
	
	state_list[54]= state_end
	//state_list[0] = state_attack_middle_shoot
	//state_list[1] = state_attack_middle_shoot
	//state_list[2] = state_attack_side_shoot
	//state_list[3] = state_attack_side2_shoot
	//state_list[4] = state_attack_final_attack
	//state_list[5] = state_attack_throw_shoot
	//state_list[6] = state_attack_throw_shoot
	//state_list[7] = state_attack_side2_shoot
	//state_list[8] = state_attack_final_shoot
	//state_list[9] = state_attack_middle_shoot
	////
	//state_list[10]= state_idle
	//state_list[11]= state_attack_top_shoot
	//state_list[12]= state_attack_throw_shoot
	//state_list[13]= state_attack_throw_shoot
	//state_list[14]= state_attack_sidetop_shoot
	//state_list[15]= state_attack_final_shoot
	//state_list[16]= state_attack_side2_shoot
	//state_list[17]= state_attack_final_attack
	//state_list[18]= state_attack_top_shoot
	//state_list[19]= state_attack_throw_shoot
	//state_list[20]= state_attack_throw_shoot
	//state_list[21]= state_attack_middle_shoot
	//state_list[22]= state_attack_side_shoot
	////
	//state_list[23]= state_idle
	//state_list[24]= state_attack_middle_shoot
	//state_list[25]= state_attack_middle_shoot
	//state_list[26]= state_attack_top_shoot
	//state_list[27]= state_attack_top_shoot
	//state_list[28]= state_attack_final_shoot
	//state_list[29]= state_attack_throw_shoot
	//state_list[30]= state_attack_throw_shoot
	//state_list[31]= state_attack_throw_shoot
	//state_list[32]= state_attack_side_shoot
	//state_list[33]= state_attack_side2_shoot
	//state_list[34]= state_attack_final_attack
	//state_list[35]= state_go_to_final_phase
	////
	//state_list[36]= state_idle
	//state_list[37]= state_attack_sidetop_shoot
	//state_list[38]= state_attack_throw_shoot
	//state_list[39]= state_attack_throw_shoot
	//state_list[40]= state_attack_bot_shoot
	//state_list[41]= state_attack_bot2_shoot
	//state_list[42]= state_attack_throw_shoot
	//state_list[43]= state_attack_throw_shoot
	//state_list[44]= state_attack_final_shoot
	//state_list[45]= state_attack_sidetop_shoot
	//state_list[46]= state_attack_final_attack
	//state_list[47]= state_attack_throw_shoot
	//state_list[48]= state_attack_throw_shoot
	//state_list[49]= state_attack_top_shoot
	//state_list[50]= state_attack_middle_shoot
	//state_list[51]= state_attack_top_shoot
	//state_list[52]= state_attack_throw_shoot
	//state_list[53]= state_attack_throw_shoot
	//state_list[54]= state_attack_throw_shoot
	//state_list[55]= state_attack_final_attack
	//state_list[56]= state_attack_final_shoot
	//state_list[57]= state_attack_sidetop_shoot
	//state_list[58]= state_attack_throw_shoot
	//state_list[59]= state_attack_throw_shoot
	//state_list[60]= state_attack_final_attack
	//state_list[61]= state_end
}
#endregion
	
#endregion

state = state_idle