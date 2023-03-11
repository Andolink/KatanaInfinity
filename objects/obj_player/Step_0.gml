if global.speedrun_chronos_mode = 2
	player_game_speed = slow_motion_reset()
else
	player_game_speed = global.game_spd
	
#region SWITCH CHAR

var mwheel_char_ = mouse_wheel_down()-mouse_wheel_up()

if (input_get(global.input_pl_switch,PRESSED,cutscene)
|| (mwheel_char_ != 0 && global.mwheel_char))
&& allow_char_switch
{
	audio_play_sound(choose(sound_boss_therapist_glitchdeath_01,sound_boss_therapist_glitchdeath_02,sound_boss_therapist_glitchdeath_03),999,0)
	
	switch_char_old_sprite		= sprite_index
	switch_char_old_img_index	= image_index
	switch_char_old_w			= sprite_width
	switch_char_old_h			= sprite_height
	switch_char_old_xoff		= sprite_xoffset
	switch_char_old_yoff		= sprite_yoffset
	switch_char_effect			= 1
	
	var char_num = char_switch_num-1

	if mwheel_char_ global.char_switch_id+=mwheel_char_
	else			global.char_switch_id++
	
	if global.char_switch_id > char_num
	{global.char_switch_id = 0}
	else if global.char_switch_id < 0
	{global.char_switch_id = char_num-1}
	
	skin_id				= char_switch[global.char_switch_id,char_switch_skin]
	gameplay_mode		= char_switch[global.char_switch_id,char_switch_gameplay]
	
	player_set_sprite(sprite_id,skin_id)
	
	repeat(10)
	{
		echo_create(x,y,depth+1,
		sprite_index,image_index,image_xscale,image_yscale,
		image_angle,.4,choose(c_aqua,c_fuchsia),random_range(8,15),true,2)
	}
}

if switch_char_effect > 0
{switch_char_effect -= 0.05*player_game_speed}

//global.zero_sword += KEY_PRS(vk_numpad6)-KEY_PRS(vk_numpad4)

switch gameplay_mode
{
	case gameplay_sword		: sword = global.zero_sword	break
	case gameplay_dragon	: sword = sword_dragon		break
	case gameplay_murasama	: sword = sword_mura		break
}

#endregion

#region RESTART

if global.cutscene_id = "" && input_get(global.input_restart,PRESSED)
{
	
	if room = rm_level_editor
	{
		level_editor_load("LevelEditor/"+"_autosave")
		level_editor_play()
	}
	else
	{room_restart()}
}

#endregion

#region SPEEDRUN DEATH COUNT

if hp <= 0 && !instance_exists(obj_player_death_gui)
{
	global.speedrun_deathcount1 ++
	if global.speedrun_deathcount1 = 10
	{global.speedrun_deathcount1 = 0 global.speedrun_deathcount10 ++}
	if global.speedrun_deathcount10 = 10
	{global.speedrun_deathcount10 = 0 global.speedrun_deathcount1000 ++}
	if global.speedrun_deathcount100 = 10
	{global.speedrun_deathcount100 = 0 global.speedrun_deathcount1000 ++}
	
	global.speedrun_deathcount1gl ++
	if global.speedrun_deathcount1gl = 10
	{global.speedrun_deathcount1gl = 0 global.speedrun_deathcount10gl ++}
	if global.speedrun_deathcount10gl = 10
	{global.speedrun_deathcount10gl = 0 global.speedrun_deathcount1000gl ++}
	if global.speedrun_deathcount100gl = 10
	{global.speedrun_deathcount100gl = 0 global.speedrun_deathcount1000gl ++}
	
	instance_create_depth(0,0,0,obj_player_death_gui)
}

#endregion

if stop exit

instance_get_information()

#region GRAVITY FIX

if in_ground
&& place_free(x+hspd,y+8)
&& !place_meeting(x+hspd,y+8,par_platform)
{vspd = 0}
else if in_ground && vspd >= 0
{vspd = 8}

#endregion

#region => ninja run

if state != state_hit && hp > 0
{
	if gameplay_mode = gameplay_murasama
	{
		if ninjarun_buffer > 0
		{ninjarun_buffer -= 1}

		if input_get(global.input_roll,PRESSED,cutscene)
		{
			ninjarun_buffer = 6
		}

		if (ninjarun_buffer)
		&& in_ground
		&& ((mov_x != 0) || (mov_x = 0 && !in_platforme))
		&& state != state_roll
		&& state != state_hit
		&& !rool_wait
		&& ninjarun_state != 1
		{
			ninjarun_buffer = 0
			ninjarun_state = 1
			ninjarun_state_timer = 0
			state = state_ninjarun
			ninjarun_spd = 5
			player_set_sprite(spr_roll,skin_id,true)
		}
	}

	if ninjarun_state = 1
	{
		if state = state_ninjarun
		&& gameplay_mode = gameplay_murasama
		&& ninjarun_spd < 15
		{
			invi_frame = 0
			ninjarun_spd = lerp(ninjarun_spd,18,.08*player_game_speed)
			hspd = 0
			vspd = 0
			grav = 0
			state = state_ninjarun
			echo_create(x,y,depth+1,sprite_index,image_index,image_xscale*(1+ninjarun_spd/80),image_yscale*(1+ninjarun_spd/80),
			image_angle,.5,c_red,12,true,1)
		}
		else
		{
			audio_play_sound(sound_npc_dragon_slice_01,999,0)
			
			mov_x = input_get(global.input_right,CHECK,cutscene)-input_get(global.input_left,CHECK,cutscene)
	
			if mov_x != 0
				var val = mov_x
			else
				val = image_xscale
			
			if place_free(x+128*val,y)
			&& x+128*val < room_width && x+128*val > 0
			{
				x += 128*val
			}
			else
			{
				repeat(128)
				{
					if !collision_x(val)
					{break}
				}
			}
				
			var t = point_distance(x,0,xprevious,0)/4
			var i = 1/t
			repeat(t)
			{
				echo_create(lerp(xprevious,x,i),lerp(yprevious,y,i),depth+1,
				sprite_index,image_index,image_xscale,image_yscale,
				image_angle,.25,merge_color(c_aqua,c_fuchsia,i),12,true,1.5)
				i+=1/t
			}
			
			sleep(4)
			invi_frame = 16
			screen_shake_set(5,20,-4)
			ninjarun_state=2
			state = state_normal
		}
	}
	else if ninjarun_state = 2
	{
		ninjarun_spd = lerp(ninjarun_spd,2.5,.015*player_game_speed)
		if ninjarun_spd <= 5
		{ninjarun_spd = 3 ninjarun_state = 0}
		spd = ninjarun_spd
		echo_create(x,y,depth+1,sprite_index,image_index,image_xscale*(1+ninjarun_spd/80),image_yscale*(1+ninjarun_spd/80),
		image_angle,.5,c_red,12,true,1)
	}

	ninjarun_state_timer += player_game_speed
}

#endregion
#region => roll

if gameplay_mode != gameplay_murasama
{
	if rool_buffer > 0
	{rool_buffer -= 1}

	if input_get(global.input_roll,PRESSED,cutscene)
	{
		rool_buffer = 6
	}

	if (input_get(global.input_roll,PRESSED,cutscene) || rool_buffer)
	&& in_ground
	&& ((mov_x != 0) || (mov_x = 0 && !in_platforme))
	&& state != state_roll
	&& state != state_hit
	&& !rool_wait
	{state = state_roll rool_buffer = 0}
}

#endregion
#region => attack

if attack_master < 1 
{
	attack_master += global.slow_motion*.016
}
else if attack_master > 1 
{
	attack_master = 1
	audio_play_sound(sound_player_mastersword_charged_01,999,0)
}

if attack_master = 1 && sword = sword_master
{
	echo_create(x,y,depth+1,sprite_index,image_index,image_xscale*1.2,image_yscale*1.2,
	image_angle,.5,c_aqua,12,true,1)
}

if in_ground
{
	attack_dash_mult = 1
}

if attack_timer > 0
{
	attack_timer -= 1*player_game_speed
	if global.slow_motion<.5 && global.speedrun_chronos_mode != 2
	{attack_timer -= 1*player_game_speed}
}

if (bullet_reload > 0 || input_get(global.input_walk,CHECK,cutscene))
&& bullet_num != bullet_max
{
	bullet_reload -= 1*player_game_speed
	if global.slow_motion<.5 && global.speedrun_chronos_mode != 2
	{bullet_reload -= 2.5*player_game_speed}
	
	if bullet_reload <=0 
	{bullet_num = bullet_max bullet_reload = bullet_reload_max}
}

if bullet_num != 0 && !input_get(global.input_walk,CHECK,cutscene)
{
	bullet_reload = bullet_reload_max
}

if attack_buffer > 0
{attack_buffer -= 1}

if input_get(global.input_attack,PRESSED,cutscene)
{
	attack_buffer = 6
}

#region SET TIMER MAX

switch sword
{
	case sword_normal	: attack_timer_max = 22 break
	case sword_dragon	: attack_timer_max = 22 break
	case sword_color	: attack_timer_max = 22 break
	case sword_big		: attack_timer_max = 28 break
	case sword_flame	: attack_timer_max = 30 break
	case sword_old		: attack_timer_max = 20 break
	case sword_master	: attack_timer_max = 21 break
	case sword_short	: attack_timer_max = 18 break
}

#endregion

if (input_get(global.input_attack,PRESSED,cutscene) || attack_buffer)
&& attack_timer <= 0
&& ((gameplay_mode = gameplay_sword)
||	(gameplay_mode = gameplay_dragon	&& dragon_slash_timer <= 0)
||  (gameplay_mode = gameplay_murasama	&& murasama_slash_timer <= 0)
||  (gameplay_mode = gameplay_gun		&& bullet_num > 0))
&& state != state_hit
&& state != state_ninjarun
&& hp > 0
{
	attack_buffer = 0
	switch gameplay_mode
	{
		case gameplay_sword : 
		case gameplay_dragon :
		case gameplay_murasama :
		#region
		if instance_exists(attack)
			instance_destroy(attack)
		var dir = point_direction(x,y,global.input_aim_x,global.input_aim_y)
		var len	= 8
		
		if point_distance(x,y,global.input_aim_x,global.input_aim_y)<5
		&& global.gamepad != -1
		{
			dir = 90-90*image_xscale
		}
		
		mov_spd = 0.05
		invi_frame = 1
		
		//vspd = lerp(vspd,0,.4)
		grav = lerp(grav,0,.4)
		
		hspd = lengthdir_x(len,dir)*attack_dash_mult
		vspd = lengthdir_y(len,dir)*attack_dash_mult
		
		if sword = sword_short
			attack_dash_mult *= .6
		else
			attack_dash_mult *= .33
		
		if place_free(x+hspd,y) x += hspd
		if place_free(x,y+vspd)&&abs(vspd)>2.8 y += vspd
		
		var atk = instance_create_depth(x,y,depth-1,obj_player_attack,{image_angle : dir})
		atk.creator		= id
		attack = atk
		player_set_sprite(spr_attack,skin_id,true)
		state = state_normal
		attack_timer = attack_timer_max
	
		echo_effect = 8
		
		break #endregion
		case gameplay_no_sword :
		#region
		audio_play_sound(sound_cant_throw,999,0)
		break #endregion
		case gameplay_gun :
		#region
		
		audio_play_sound(choose(sound_gun_fire_1,sound_gun_fire_2),999,0)
		
		var dir_	= point_direction(x,y,global.input_aim_x,global.input_aim_y)
		var len		= 8
		
		if dir_ < 340 && dir_ > 200 && !in_ground
		{
			vspd = -8
		}
		
		if aim_assist && global.player_aim_assist
		{
			#region
			var id_ = -1
			var base_ang = dir_
			var take_back_old_ang = true
			var _list = ds_list_create();
			
			var _num = collision_line_list(x,y,x+lengthdir_x(500,dir_),y+lengthdir_y(500,dir_), par_enemy, false, true, _list, false);
			_num += collision_line_list(x,y,x+lengthdir_x(500,dir_-5),y+lengthdir_y(500,dir_-5), par_enemy, false, true, _list, false);
			_num += collision_line_list(x,y,x+lengthdir_x(500,dir_+5),y+lengthdir_y(500,dir_+5), par_enemy, false, true, _list, false);
			
			if instance_exists(obj_psychbossinfinity_proj) { #region
				_num += collision_line_list(x,y,x+lengthdir_x(500,dir_),y+lengthdir_y(500,dir_), obj_psychbossinfinity_proj, false, true, _list, false);
				_num += collision_line_list(x,y,x+lengthdir_x(500,dir_),y+lengthdir_y(500,dir_-5), obj_psychbossinfinity_proj, false, true, _list, false);
				_num += collision_line_list(x,y,x+lengthdir_x(500,dir_),y+lengthdir_y(500,dir_+5), obj_psychbossinfinity_proj, false, true, _list, false);
			} #endregion
			
			if _num > 0
			{
				var dist = 999
		
			    for (var i = 0; i < _num; ++i;)
			    {
					var inst_ = _list[| i]
			        var pt_dist = point_distance(x,y,inst_.x,inst_.y)
					if pt_dist < dist 
					&& ((inst_.object_index = obj_psychbossinfinity_proj) || (inst_.object_index != obj_psychbossinfinity_proj && inst_.state != inst_.state_hit))
					{
						dist = pt_dist
						id_ = inst_
					}
			    }
			}
			ds_list_destroy(_list)
		
			if id_
			{
				show_debug_message("target+"+object_get_name(id_.object_index))
				dir_ = point_direction(x,y,id_.x,id_.y)
				var dis_ = point_distance(x,y,id_.x,id_.y)
				var i_ = 0
				repeat(10)
				{
					if !collision_line(x,y,x+lengthdir_x(dis_,dir_+i),y+lengthdir_y(dis_,dir_+i),par_collision,false,false)
					&& collision_line(x,y,x+lengthdir_x(dis_,dir_+i),y+lengthdir_y(dis_,dir_+i),id_,false,false)
					{
						dir_ += i
						take_back_old_ang = false
						break
					}
					else if !collision_line(x,y,x+lengthdir_x(dis_,dir_-i),y+lengthdir_y(dis_,dir_-i),par_collision,false,false)
					&& collision_line(x,y,x+lengthdir_x(dis_,dir_-i),y+lengthdir_y(dis_,dir_-i),id_,false,false)
					{
						dir_ -= i
						take_back_old_ang = false
						break
					}
					i_ += 1
				}
			
				if take_back_old_ang
				{dir_ = base_ang}
			}
			#endregion
		}
		
		var x_ = x+lengthdir_x(10,dir_)
		var y_ = y+lengthdir_y(10,dir_)
		attack = create_bullet(x_,y_,depth+1,dir_,25,spr_enemy_ball,true)
		
		with particule_create(x_,y_,depth-1,choose(spr_gunspark,spr_gunspark2,spr_gunspark3))
		{
			image_angle = dir_
			image_yscale = other.image_xscale
		}
		with particule_create(x_,y_,depth-1,choose(spr_gunsmoke,spr_gunsmoke2,spr_gunsmoke3))
		{
			image_angle = dir_
			image_yscale = other.image_xscale
			image_alpha = .5
		}
		
		player_set_sprite(spr_attack,skin_id,true)
		state = state_normal
		
		bullet_num --
	
		echo_effect = 8
		break #endregion
	}
}

#endregion
#region => murasama slash

if murasama_slash_timer > 0
{murasama_slash_timer -= player_game_speed}

if gameplay_mode = gameplay_murasama
{	
	murasama_slash_state_t += player_game_speed
	
	if (input_get(global.input_object,PRESSED,cutscene) || (murasama_slash_state != 0 && murasama_slash_state_t > 4))
	&& hp > 0 && murasama_slash_timer <= 0 && state != state_hit
	{
		var dir = point_direction(x,y,global.input_aim_x,global.input_aim_y)
		
		hspd = lengthdir_x(4+murasama_slash_state*3,dir)
		vspd = lengthdir_y(4+murasama_slash_state*3,dir)

		var atk = instance_create_depth(x,y,depth-1,obj_player_attack)
			atk.image_angle = dir
			atk.creator		= id
			atk.sword		= sword_flame
			
		attack = atk
		
		var i = 0
		repeat(murasama_slash_state*3)
		{
			var ang_ = dir+random_range(-18,18)
			var len_ = 32
			with instance_create_depth(x+lengthdir_x(len_,ang_),y+lengthdir_y(len_,ang_),depth,obj_slash_fire)
			{ang = ang_ spd = 10+random(.8)}
			i++
		}
		var sfx_ = choose(sound_player_phoenix_slash_01,sound_player_phoenix_slash_02,sound_player_phoenix_slash_03) 
		audio_play_sound(sfx_,999,0)	
		
		if murasama_slash_state = 0
		{player_set_sprite(spr_dragon_slash_dash,skin_id,true)}
		
		murasama_slash_state ++
		murasama_slash_state_t = 0
		if murasama_slash_state = 2
		{murasama_slash_state_t = -5}
		
		if murasama_slash_state >= 3
		{
			murasama_slash_state = 0 
			murasama_slash_timer = murasama_slash_timer_max
		}
	
		state = state_normal
	}
}

#endregion
#region => dragon dash

if dragon_slash_timer > 0
{dragon_slash_timer -= player_game_speed}

if gameplay_mode = gameplay_dragon
{	
	if ((input_get(global.input_object,CHECK,cutscene)		&& dragon_slash_state = 1 && !global.speedrun_noslowmo)
	||  (input_get(global.input_object,PRESSED,cutscene)	&& global.speedrun_noslowmo))
	&& hp > 0 && dragon_slash_timer <= 0 && state != state_hit
	{
		var dir = point_direction(x,y,global.input_aim_x,global.input_aim_y)
		var len_ = clamp(point_distance(x,y,global.input_aim_x,global.input_aim_y),0,226)
	
		dragon_dash_x = x
		dragon_dash_y = y
	
		repeat(len_)
		{
			dragon_dash_x += lengthdir_x(1,dir)
			if !place_free(dragon_dash_x,dragon_dash_y)
			{
				dragon_dash_x -= lengthdir_x(1,dir)
			}
			dragon_dash_y += lengthdir_y(1,dir)
			if !place_free(dragon_dash_x,dragon_dash_y)
			{
				dragon_dash_y -= lengthdir_y(1,dir)
			}
		}
		dragon_dash_range = lerp(dragon_dash_range,1,.25)
	}
	else
	{
		dragon_dash_range = lerp(dragon_dash_range,0,.25)
	}
	
	if ((input_get(global.input_object,RELEASED,cutscene)	&& dragon_slash_state = 1 && !global.speedrun_noslowmo)
	|| ( input_get(global.input_object,PRESSED,cutscene)	&& global.speedrun_noslowmo))
	&& hp > 0 && dragon_slash_timer <= 0 && state != state_hit
	{
		audio_play_sound(sound_npc_dragon_slice_01,999,0)
		
		var dir = point_direction(x,y,dragon_dash_x,dragon_dash_y)
		var len_ = clamp(point_distance(x,y,dragon_dash_x,dragon_dash_y),0,226)
	
		screen_shake_set(5,20,-2)
		
		var atk = instance_create_depth(x,y,depth-1,obj_dragon_slash,{image_angle : dir})
		atk.image_xscale	= len_
		atk.creator			= other
		
		x = dragon_dash_x
		y = dragon_dash_y
		
		
		var t = len_/4
		var i = 1/t
		repeat(t)
		{
			echo_create(lerp(xprevious,x,i),lerp(yprevious,y,i),depth+1,
			sprite_index,image_index,image_xscale,image_yscale,
			image_angle,.25,merge_color(c_aqua,c_fuchsia,i),12,true,1.5)
			i+=1/t
		}
		
		hspd = lengthdir_x(8,dir)
		vspd = lengthdir_y(8,dir)

		var atk = instance_create_depth(x,y,depth-1,obj_player_attack)
			atk.image_angle = dir
			atk.creator		= id
	
		attack = atk
	
		player_set_sprite(spr_dragon_slash_dash,skin_id,true)
		
		dragon_slash_timer = dragon_slash_timer_max
		dragon_slash_state = 0
	
		state = state_normal
	}

}

#endregion
#region => object

if gameplay_mode != gameplay_dragon
&& gameplay_mode != gameplay_murasama
{
	if (input_get(global.input_object,PRESSED,cutscene))
	&& object = noone
	&& gameplay_mode != gameplay_dragon
	&& state != state_hit
	&& distance_to_object(obj_pickable)>24
	{
		audio_play_sound(sound_cant_throw,999,0)
	}

	if object_buffer
	{object_buffer = false}
	else
	if (input_get(global.input_object,PRESSED,cutscene))
	&& object != noone
	&& state != state_hit
	{
		audio_play_sound(sound_player_object_release_01,999,0)
	
		var dir = point_direction(x,y,global.input_aim_x,global.input_aim_y)
		var len	= 22

		var atk = instance_create_depth(x,y,depth-1,obj_pickable_trow)
		with atk
		{
			hspd = lengthdir_x(len,dir)
			vspd = lengthdir_y(len,dir)
			sprite_index	= other.object_sprite
			image_speed		= 0
			creator			= other.id
			type			= other.object
		}
	
		object = noone
	}
}

#endregion
#region => jump

if jump_buffer > 0
{jump_buffer -= 1}

if input_get(global.input_jump,PRESSED,cutscene)
{
	jump_buffer = 6
}

if in_ground || state = state_roll
{
	coyote_jump = 4
}
else
{
	coyote_jump--
}

if (input_get(global.input_jump,PRESSED,cutscene) || jump_buffer) 
&& (in_ground || state = state_roll || coyote_jump)
&& state != state_hit
&& state != state_ninjarun
{
	echo_effect = 5
	jump_buffer = 0
	coyote_jump = 0
	
	mov_x = input_get(global.input_right,CHECK,cutscene)-input_get(global.input_left,CHECK,cutscene)
	
	hspd = mov_x*4
	sleep(2)
	vspd = -9
	
	state = state_normal 
	jump_hold = jump_hold_max
	audio_play_sound(sound_player_jump,999,0)
	particule_create(x,bbox_bottom,depth-1,spr_jumpcloud)
}

if input_get(global.input_jump,CHECK,cutscene) && jump_hold && vspd > -8
&& state = state_normal
{
	if mov_x = 0
		hspd = 0
	jump_buffer = 0
	jump_hold -= 1*player_game_speed
	vspd = lerp(vspd,-8,.1*player_game_speed)
	if vspd > -3
		vspd = lerp(vspd,-8,.1*player_game_speed)
}

if input_get(global.input_jump,RELEASED,cutscene) && jump_hold 
{
	jump_hold = 0
}

#endregion
#region => wall jump

invi_frame -= player_game_speed

if (!place_free(x+2,y) || !place_free(x-2,y))
&& !in_ground
&& state != state_hit
{
	if input_get(global.input_jump,PRESSED,cutscene)
	|| jump_buffer
	{
		audio_play_sound(choose(sound_player_wallkick_1,sound_player_wallkick_2,sound_player_wallkick_3),999,0)
		jump_buffer = 0
		grav = grav_tar
		mov_spd = 0.05
		invi_frame = 10
		if !place_free(x+2,y)
			hspd = -11
		else
			hspd = 11
		vspd = -9
		player_set_sprite(spr_flip,skin_id)
		echo_effect = 10
	}
}

#endregion
#region => kick door

if place_meeting(x+image_xscale*2,y,obj_door)
&& instance_place(x+image_xscale*2,y,obj_door).solid = true
&& in_ground
&& state != state_hit
&& state != state_kick_door
&& (input_get(global.input_left,CHECK,cutscene)  && image_xscale = -1
||  input_get(global.input_right,CHECK,cutscene) && image_xscale =  1)
{
	state = state_kick_door
}

#endregion
state()

//if rool_wait && in_ground
//{hspd = 0}
rool_wait --

if !place_free(x,y-1) && vspd < 0
{vspd = 0}

if global.speedrun_chronos_mode = 2
	collision_system(hspd/global.slow_motion,vspd/global.slow_motion)
else
	collision_system(hspd,vspd)
	
if !cutscene
{
	x = clamp(x,8,room_width-8)
	y = clamp(y,8,room_height+200)
}

#region SLOW MO
 
var slm_tar = .15 
var slm_tar_spd = .25

if global.speedrun_chronos_mode = 1 //super hot
{
	slm_tar = 0 slm_tar_spd = .08 
	var slm_activate =    !input_get(global.input_left	,CHECK)&&!input_get(global.input_right,CHECK)
						&&!input_get(global.input_down ,CHECK) && vspd >= 0
	if hp > 0
	{
		chronos = 11
		chronos_over_used = false
	}
}

if (global.speedrun_chronos_mode != 1 && input_get(global.input_chronos,CHECK,cutscene) 
|| (global.speedrun_chronos_mode = 1 && slm_activate && state != state_hit && !cutscene)
|| (gameplay_mode = gameplay_dragon && input_get(global.input_object,CHECK,cutscene)))
&& chronos > 0 && hp > 0 && !chronos_over_used 
&& !global.speedrun_noslowmo
{
	if !chronos_using
	{
		audio_stop_sound(sound_slomo_disengage)
		audio_play_sound(sound_slomo_engage,999,0)
	}
	
	global.slow_motion = lerp(global.slow_motion,slm_tar,slm_tar_spd)
	
	if global.speedrun_chronos_mode = 2
	{global.level_timer-=10}
	
	dragon_slash_state = 1
	
	echo_create(x,y,depth+1,sprite_index,image_index,image_xscale,image_yscale,image_angle,.2,c_aqua,12,true)
	
	if (sprite_index = player_get_sprite(spr_idle,3) || sprite_index = player_get_sprite(spr_attack,3))
	{
		var dir_ = point_direction(x,y-6,global.input_aim_x,global.input_aim_y)

		echo_create(x,y-6,depth+1,spr_player_pistol_arm,0,1,image_xscale,dir_,.2,c_aqua,12,true)	
		echo_create(x,y-6,depth+1,spr_player_pistol_arm,1,1,image_xscale,dir_,.2,c_aqua,12,true)
	
	}
	
	if !instance_exists(obj_slow_motion_black_mask)
	{instance_create_depth(0,0,0,obj_slow_motion_black_mask)}
	
	chronos -= 0.025
	if chronos <= 0
	{chronos_over_used = true}
	
	chronos_using = true
}
else
{
	if audio_is_playing(sound_slomo_engage)
	{
		audio_stop_sound(sound_slomo_engage)
		audio_play_sound(sound_slomo_disengage,999,0)
	}
	dragon_slash_state = 0
	chronos_using = false
	
	global.slow_motion = lerp(global.slow_motion,1,.25)
	
	if echo_effect
	{
		var t = 3
		var i = 1/t
		repeat(t)
		{
			echo_create(lerp(xprevious,x,i),lerp(yprevious,y,i),depth+1,
			sprite_index,image_index,image_xscale,image_yscale,
			image_angle,.6,merge_color(c_aqua,c_fuchsia,i),12,true,1)
			
			if (sprite_index = player_get_sprite(spr_idle,3) || sprite_index = player_get_sprite(spr_attack,3))
			{
				var dir_ = point_direction(x,y-6,global.input_aim_x,global.input_aim_y)

				echo_create(lerp(xprevious,x,i),lerp(yprevious-6,y-6,i),depth+1,
				spr_player_pistol_arm,0,1,image_xscale,
				dir_,.6,merge_color(c_aqua,c_fuchsia,i),12,true,1)
				
				echo_create(lerp(xprevious,x,i),lerp(yprevious-6,y-6,i),depth+1,
				spr_player_pistol_arm,1,1,image_xscale,
				dir_,.6,merge_color(c_aqua,c_fuchsia,i),12,true,1)
			}
			
			i+=1/t
			
		}
		
		echo_effect -= player_game_speed
	}
	else
	{
		var col_ = c_aqua
		if instance_exists(obj_light)
		{
			var col_ = instance_nearest(x,y,obj_light).image_blend
		}
		echo_create(x,y,depth+1,sprite_index,image_index,image_xscale,image_yscale,image_angle,.1,col_,12,true)
	}
	
	if chronos < chronos_max 
		chronos += 0.015
	
	if !input_get(global.input_chronos,CHECK,cutscene)
	{
		chronos_over_used = false
	}
}

#endregion

y_ground = instance_get_y_ground()

//image_speed_update()
image_speed = animation_speed*player_game_speed

if hp <= 0
{
	blood = true //avoid crash
	entity_blood_spawn()
}