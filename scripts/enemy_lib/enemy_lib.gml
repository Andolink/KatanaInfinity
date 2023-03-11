global.enemy_count = 0

function enemy_init_variables(){ #region
	
	//Collision
	
	hspd = 0
	vspd = 0
	spd	 = 3.5
	grav	= 8
	grav_tar= 8
	
	//Blood
	
	blood = false
	object_state = noone
	
	blood_color				= c_red
	blood_splatter_color	= #660002
	blood_rainbow_set		= false
	
	enemy_counted			= false
	
	if !global.speedrun_stableseed
	{
		if walk_dist != 0
		{
			image_xscale = choose(-1,1)
		
			x = x+random_range(-walk_dist,walk_dist)
		
			if !place_free(x,y)
			{x = xstart}
		
			while place_free(x,y+1)
			&& !place_meeting(x,y+1,par_platform)
			{y++}
		}
	}
	
}#endregion

function enemy_update() { #region
	x = clamp(x,8,room_width-8)
	
	if state = state_hit && instance_exists(object_state)
	{
		instance_destroy(object_state)
	}
} #endregion

function entity_blood_spawn(){ #region
	var dist_ = point_distance(x,y,xprevious,yprevious)
	var enemy = object_get_parent(object_index)=par_enemy
	
	if enemy
	{
		if obj_player.sword = sword_color
		{
			#region SWORD COLOR
			
			if !blood_rainbow_set
			{
				blood_color				= choose(c_yellow,c_orange,c_red,c_fuchsia,c_aqua,c_blue,c_green,c_lime)
				blood_splatter_color	= blood_color
				blood_rainbow_set		= true
			}
			
			#endregion
		}
		else
		{
			#region OPTION SWORD
			switch(global.slash_type)
			{
				default :
					blood_color				= c_red
					blood_splatter_color	= #660002
					blood_rainbow_set		= false
				break
				case 1 :
					if !blood_rainbow_set
					{
						blood_color				= choose(c_yellow,c_orange,c_red,c_fuchsia,c_aqua,c_blue,c_green,c_lime)
						blood_splatter_color	= blood_color
						blood_rainbow_set		= true
					}
				break
				case 2 :
					switch obj_player.skin_id
					{
						case skin_zero : case skin_zero_gun : case skin_zero_no_sword :
							blood_color				= c_fuchsia break
						case skin_infinity :
							blood_color				= c_lime break
						case skin_dragon :
							blood_color				= c_yellow break
					}
					blood_splatter_color	= blood_color
					blood_rainbow_set		= false
				break
				case 3 :
					blood_color				= c_white
					blood_splatter_color	= c_white
					blood_rainbow_set		= false
				break
			}
			#endregion
		}
	}

	if blood && choose(dist_>.1,dist_>1,dist_>2,dist_>4,0)=1
	{	
		var dir = point_direction(x,y,xprevious,yprevious)+random_range(-30,30)
		if round(x) = round(xprevious) && round(y) = round(yprevious)
		{dir = 90}
		
		with instance_create_depth(x+random_range(-4,4),y+random_range(-4,4),depth-1,obj_blood)
		{
			image_angle = dir
			direction	= dir
			spd			= random_range(.5,1.5)
			
			if enemy {
				image_blend = other.blood_color
				splatter_col = other.blood_splatter_color
			}
		}
	}
}
#endregion

function enemy_ai_init(){ #region
	enemy_ai_saw_player = false
	enemy_ai_hear		= false
	enemy_ai_same_floor_target = false
	enemy_ai_vision_timer = 0
	target_x			= -1
	target_y			= -1
	target_y_ground		= -1	
} #endregion

function enemy_ai_update(){ #region
	
	if !instance_exists(object_state)
	{
		object_state = instance_create_depth(x,y,depth,obj_enemy_state)
		object_state.creator = id
	}
	
	enemy_ai_vision_timer++
	
	#region DETECT PLAYER
	
	enemy_ai_saw_player	=	distance_to_object(obj_player)<400
						&&	!collision_line(x,y-2,obj_player.x,obj_player.y-2,par_collision,0,0)
						&&	!collision_line(x,y-2,obj_player.x,obj_player.y-2,par_platform,0,0)
						&&	!collision_line(x,y-2,obj_player.x,obj_player.y-2,obj_door,0,0)
						&&  image_xscale = sign(obj_player.x-x)

	enemy_ai_hear		=	(distance_to_object(obj_player)<200
						&&	abs(obj_player.hspd) > 2
						&&	!collision_line(x,y-2,obj_player.x,obj_player.y-2,par_collision,0,0)
						&&	!collision_line(x,y-2,obj_player.x,obj_player.y-2,obj_door,0,0))
						//||	(distance_to_object(obj_player_attack)<120)
						||  (!collision_line(x,y-2,obj_player.x,obj_player.y-2,par_collision,0,0)
						&&	!collision_line(x,y-2,obj_player.x,obj_player.y-2,obj_door,0,0)
						&&  distance_to_object(obj_player)<300
						&&	abs(obj_player.hspd) > 2.5
						&&	obj_player.in_ground)
	
	if enemy_ai_saw_player || enemy_ai_hear
	{
		if enemy_ai_saw_player
		{
			var spr_ = spr_enemy_follow
			with object_state
			{if sprite_index != spr_ {sprite_index = spr_ anim_state = 0}}
		}
		else if enemy_ai_hear
		{
			var spr_ = spr_enemy_exclaim
			with object_state
			{if sprite_index != spr_ {sprite_index = spr_ anim_state = 0}}
		}
		
		target_x = obj_player.x
		target_y = obj_player.y
		target_y_ground = obj_player.y_ground
		enemy_ai_vision_timer = 0
	}
	
	#endregion
	
	#region DETECT POTENCIAL PLAYER
	
	if !enemy_ai_saw_player && !enemy_ai_hear
	{
		var inst = instance_nearest(x,y,obj_explosion) 
		#region
	
		if inst 
		&& (distance_to_object(inst)<100
		|| !collision_line(x,y,inst.x,inst.y,par_collision,0,0))
		{
			enemy_ai_hear = true
			target_x = inst.x
			target_y = inst.y
			with inst {var i_ = instance_get_y_ground()}
			target_y_ground = i_
			enemy_ai_vision_timer = 0
		}#endregion
	
		var inst = instance_nearest(x,y,obj_pickable_trow)
		#region
		
		if inst 
		&& (distance_to_object(inst)<300
		|| !collision_line(x,y,inst.x,inst.y,par_collision,0,0))
		&& image_xscale = sign(inst.x-x)
		{
			enemy_ai_hear = true
			target_x = inst.x
			target_y = inst.y
			with inst {var i_ = instance_get_y_ground()}
			target_y_ground = i_
			enemy_ai_vision_timer = 0
		}#endregion
		
		var inst = instance_nearest(x,y,obj_player_ball)
		#region
		
		if inst 
		&& !collision_line(x,y,inst.x,inst.y,par_collision,0,0)
		&& image_xscale = sign(inst.x-x)
		{
			enemy_ai_hear = true
			target_x = obj_player.x
			target_y = obj_player.y
			with obj_player {var i_ = instance_get_y_ground()}
			target_y_ground = i_
			enemy_ai_vision_timer = 0
		}#endregion
		
		var inst = instance_nearest(x,y,obj_enemy_trigger) 
		#region
	
		if inst 
		&& (distance_to_object(inst)<inst.dist
		|| (!collision_line(x,y,inst.x,inst.y,par_collision,0,0) && image_xscale = sign(inst.x-x)))
		{
			enemy_ai_hear = true
			target_x = inst.x
			target_y = inst.y
			with inst {var i_ = instance_get_y_ground()}
			target_y_ground = i_
			enemy_ai_vision_timer = 0
		}#endregion
		
		if enemy_ai_hear
		{
			var spr_ = spr_enemy_question
			with object_state
			{if sprite_index != spr_ {sprite_index = spr_ anim_state = 0}}
		}
	}
	
	#endregion
	
	enemy_ai_same_floor_target = bbox_bottom+50>target_y_ground && bbox_bottom-50 < target_y_ground
	
} #endregion

function enemy_ai_walk(turn_spr,walk_spr){ #region
	vspd = grav
	
	if (x > xstart+walk_dist || !place_free(x+sign(hspd),y)) && hspd > 0
	{image_xscale *= -1 sprite_index = turn_spr hspd = 0}
	else if (x < xstart-walk_dist || !place_free(x+sign(hspd),y)) && hspd < 0
	{image_xscale *= -1 sprite_index = turn_spr hspd = 0}
	else if sprite_index = turn_spr
	{
		//
	}
	else 
	{sprite_index = walk_spr hspd = lerp(hspd,1*image_xscale,.5)}

	if enemy_ai_saw_player || enemy_ai_hear
	{state = state_follow}
}#endregion

function enemy_ai_follow(){ #region
	var tar_x_	= target_x
	var tar_y_	= target_y
	
	#region STAIR DOWN
	
	var saw_tar =		!collision_line(x,y-2,tar_x_,tar_y_-2,par_collision,0,0)
					&&	!collision_line(x,y-2,tar_x_,tar_y_-2,par_platform,0,0)
					&&	!collision_line(x,y-2,tar_x_,tar_y_-2,obj_door,0,0)
	
	var stair_down = false
	var tar_stair_same_floor = bbox_bottom+50>tar_y_ && bbox_bottom-50 < tar_y_
	
	var slope_ = instance_place(x,y+5,par_slope)
	
	if slope_ && slope_.image_xscale != sign(tar_x_-x)
	&& place_meeting(x,y+1,par_platform) && bbox_bottom+1 < target_y_ground
	&& !saw_tar
	{
		image_xscale = slope_.image_xscale
		while place_free(x,y+1)
		{y++}
		collision_free()
	}
	
	if y+1 < target_y_ground
	&& instance_exists(par_slope)
	&& distance_to_object(par_slope)<250
	&& !enemy_ai_saw_player
	&& !place_meeting(x,y+1,par_slope)
	{
		var slp = instance_nearest(x,y,par_slope)
		if slp.image_xscale != sign(tar_x_-slp.x)
		&& slp.bbox_top+1 > bbox_bottom
		&& !saw_tar
		{
			tar_x_ = slp.x+slp.image_xscale*5
			tar_y_ = slp.y
			stair_down = true
		}
	}
	
	#endregion
	
	#region STAIR UP
	
	if !stair_down && !saw_tar
	{
		var slope_ = instance_place(x,y+5,par_slope)
	
		if bbox_bottom > target_y_ground+16
		&& instance_exists(par_slope)
		&& distance_to_object(par_slope)<250
		&& !enemy_ai_saw_player
		//&& !place_meeting(x,y+1,par_slope)
		{
			var slp = instance_nearest(x,y,par_slope)
			if slp.image_xscale != sign(tar_x_-slp.x)
			&& point_distance(slp.x,slp.y,tar_x_,tar_y_)
			< point_distance(x,y,tar_x_,tar_y_)+32
			{
				tar_x_ = slp.x+slp.image_xscale*16
				tar_y_ = slp.y
			}
		}
	}
	#endregion
	
	var door_ = instance_nearest(x,y,obj_enemy_door)
	
	if !enemy_ai_same_floor_target
	&& instance_exists(obj_enemy_door)
	&& (distance_to_object(obj_enemy_door)<200
	|| !collision_line(x,y,door_.x,door_.y,par_collision,0,0))
	&& point_distance(door_.door_target.y,0,obj_player.y,0)<
	   point_distance(door_.y,0,obj_player.y,0)
	&& !enemy_ai_saw_player
	{
		tar_x_ = instance_nearest(x,y,obj_enemy_door).x
		tar_y_ = instance_nearest(x,y,obj_enemy_door).y
	}
	
	var dir_ = point_direction(x,y,tar_x_,tar_y_)
	
	if distance_to_object(obj_panic_switch)<64
	&& instance_exists(obj_panic_switch)
	&& collision_line(x,y,x+lengthdir_x(64,dir_),y+lengthdir_y(64,dir_),obj_ceilling_laser_hit_box,0,0)
	{
		tar_x_ = instance_nearest(x,y,obj_panic_switch).x
		tar_y_ = instance_nearest(x,y,obj_panic_switch).y
		
		if place_meeting(x,y,obj_panic_switch)
		&& abs(hspd)<0.25
		{
			with obj_panic_switch
			{
				event_user(0)
			}
		}
	}

	var look_at = sign(tar_x_-x)
	
	if place_meeting(x+look_at*16,y,obj_ceilling_laser_hit_box)
	|| (!position_meeting(x+look_at,bbox_bottom+16,par_collision) 
	&&  !position_meeting(x+look_at*10,bbox_bottom,par_collision) 
	&&  !position_meeting(x+look_at*10,bbox_bottom,par_platform))
	|| position_meeting(x+look_at*16,bbox_top,par_collision)
	{hspd = lerp(hspd,   0, .5*global.game_spd)}
	else if point_distance(x,0,tar_x_,0) < 6
	{hspd = lerp(hspd,   0, .5*global.game_spd)}
	else if tar_x_ > x
	{hspd = lerp(hspd, spd,.25*global.game_spd)}
	else
	{hspd = lerp(hspd,-spd,.25*global.game_spd)}
}#endregion

function enemy_ai_open_door(){ #region
	var inst = instance_place(x+image_xscale*2,y,obj_door)
	if inst && inst.solid
	{
		if x < inst.x
		{
			inst.image_xscale = 1
		}
		else
		{
			inst.image_xscale = -1
		}
		
		with inst
		{
			hit_box_damage_enemy = false
			event_user(0)
		}
	}
}#endregion

function enemy_ai_moving_through_door(){ #region
	var inst = instance_place(x,y,obj_enemy_door)
	
	if inst
	&& !enemy_ai_same_floor_target
	&& point_distance(inst.door_target.y,0,obj_player.y,0)<
	   point_distance(inst.y,0,obj_player.y,0)
	{
		state = state_door
	}
}#endregion	

function enemy_dommage_lazer(){ #region
	if place_meeting(x,y,obj_ceilling_laser_hit_box)
	{
		#region
			
		audio_play_sound(choose(sound_actor_disintegrate,sound_actor_disintegrate_2),999,0)
		
		var inst = instance_create_depth(x,y,depth,obj_ceilling_laser_kill_effect)
		inst.sprite_index	= sprite_index 
		inst.image_index	= image_index
		inst.image_alpha	= image_alpha
		inst.image_xscale	= image_xscale
		
		screen_shake_set(10,22,-2)
		sleep(15)
		
		if state != state_hit 
		{
			if !enemy_counted 
			{global.enemy_count -- enemy_counted = true}
		}
			
		instance_destroy()
			
		#endregion
	} 
}#endregion

function enemy_dommage_pickable(attack_behind=false,atk_behind_func=function(){}){ #region
	
	var inst = instance_place(x,y,obj_pickable_trow)
	
	if inst 
	{
		var dir = point_direction(0,0,inst.hspd,inst.vspd)
		
		if (!attack_behind)
		|| (image_xscale =  1 && (dir<90 || dir>270))
		|| (image_xscale = -1 && (dir>90 && dir<270))
		{
		#region
			
		audio_play_sound(choose(sound_enemy_death_generic,sound_enemy_death_generic_02,sound_enemy_death_generic_03),999,0)
		hspd = lengthdir_x(14,dir)
		vspd = lengthdir_y(14,dir)
		
		blood = true
		state = state_hit
		instance_create_depth(x,y,depth,obj_enemy_trigger)
		
		if instance_exists(attack)
			instance_destroy(attack)
			
		instance_destroy(inst)
			
		repeat(6)
		{
			if place_free(x+hspd/2,y+vspd/2)
			{x += hspd/2 y += vspd/2}
		}
			
		particule_create(x,y,depth,spr_slashfx,0,1,true)
		with instance_create_depth(x,y,depth-1,obj_slashfx2)
		{image_angle = dir}
		screen_shake_set(6,16,-2)
		sleep(10)
			
		var t = 8
		var i = 1/t
		repeat(t)
		{
			echo_create(lerp(xprevious,x,i),lerp(yprevious,y,i),depth-1,sprite_index,image_index,image_xscale,image_yscale,
			image_angle,image_alpha,c_aqua,10,true)
			i+=1/t
		}
			
		if !enemy_counted 
			{global.enemy_count -- enemy_counted = true}
		
		repeat(13)
		{
			var inst = instance_create_depth(x,y,depth-1,obj_blood)
			with inst
			{
				direction = dir+random_range(-45,45)
				image_angle = direction
				spd = 1.5+random(2)
				image_speed_set(random_range(.5,.8))
				image_blend = other.blood_color
				splatter_col = other.blood_splatter_color
			}
		}	
			
		#endregion
		}
		else
		{
			atk_behind_func()
		}
	} 
}#endregion

function enemy_dommage_other(){ #region
	if place_meeting(x,y,obj_door_hitbox)
	{
		#region
			
		audio_play_sound(choose(sound_enemy_death_blunt),999,0)
			
		var inst = instance_place(x,y,obj_door_hitbox)
		var dir = 90-90*inst.image_xscale
		hspd = lengthdir_x(12,dir)
		vspd = lengthdir_y(12,dir)
		
		blood = true
		state = state_hit
		
		instance_create_depth(x,y,depth,obj_enemy_trigger)
		
		if instance_exists(attack)
			instance_destroy(attack)
			
		instance_destroy(inst)
			
		repeat(6)
		{
			if place_free(x+hspd/2,y+vspd/2)
			{x += hspd/2 y += vspd/2}
		}
			
		particule_create(x,y,depth,spr_slashfx,0,1,true)
		with instance_create_depth(x,y,depth-1,obj_slashfx2)
		{image_angle = dir}
		screen_shake_set(6,16,-2)
		sleep(10)
			
		var t = 8
		var i = 1/t
		repeat(t)
		{
			echo_create(lerp(xprevious,x,i),lerp(yprevious,y,i),depth-1,sprite_index,image_index,image_xscale,image_yscale,
			image_angle,image_alpha,c_aqua,10,true)
			i+=1/t
		}
			
		if !enemy_counted 
		{global.enemy_count -- enemy_counted = true}
			
		repeat(6)
		{
			var inst = instance_create_depth(x,y,depth-1,obj_blood)
			with inst
			{
				direction = dir+random_range(-45,45)
				image_angle = direction
				spd = 1.5+random(2)
				image_speed_set(random_range(.5,.8))
				image_blend = other.blood_color
				splatter_col = other.blood_splatter_color
			}
		}		
		
		#endregion
	}	
	else if place_meeting(x,y,obj_explosion)
	{
		#region
		
		audio_play_sound(choose(sound_enemy_death_generic,sound_enemy_death_generic_03,sound_enemy_death_generic_02),999,0)
		
		var inst = instance_place(x,y,obj_explosion)
		var dir = point_direction(inst.x,inst.y,x,y)
		hspd = lengthdir_x(18,dir)
		vspd = lengthdir_y(12,dir)
		
		blood = true
		state = state_hit
		
		instance_create_depth(x,y,depth,obj_enemy_trigger)
		
		if instance_exists(attack)
			instance_destroy(attack)

		repeat(6)
		{
			if place_free(x+hspd/2,y+vspd/2)
			{x += hspd/2 y += vspd/2}
		}
		
		screen_shake_set(6,16,-2)

		var t = 8
		var i = 1/t
		repeat(t)
		{
			echo_create(lerp(xprevious,x,i),lerp(yprevious,y,i),depth-1,sprite_index,image_index,image_xscale,image_yscale,
			image_angle,image_alpha,c_aqua,10,true)
			i+=1/t
		}
			
		if !enemy_counted 
		{global.enemy_count -- enemy_counted = true}
			
		repeat(20)
		{
			var inst = instance_create_depth(x,y,depth-1,obj_blood)
			with inst
			{
				direction = dir+random_range(-45,45)
				image_angle = direction
				spd = 1.5+random(2)
				image_speed_set(random_range(.5,.8))
				image_blend = other.blood_color
				splatter_col = other.blood_splatter_color
			}
		}		
		
		#endregion
	}
	else if bbox_top > room_height
	{
		#region
		
		audio_play_sound(choose(sound_enemy_death_generic,sound_enemy_death_generic_03,sound_enemy_death_generic_02),999,0)
		
		instance_destroy()
		
		if instance_exists(attack)
			instance_destroy(attack)

		if !enemy_counted 
		{global.enemy_count -- enemy_counted = true}
		
		#endregion
	}
	else if (place_meeting(x,y,obj_sliding_door_door) 
	|| place_meeting(x,y,obj_stomper))
	{
		#region
		
		audio_play_sound(choose(sound_enemy_death_generic,sound_enemy_death_generic_03,sound_enemy_death_generic_02),999,0)
		
		hspd = 0
		vspd = 8
		
		blood = true
		state = state_hit
		
		instance_create_depth(x,y,depth,obj_enemy_trigger)
		
		if instance_exists(attack)
			instance_destroy(attack)
	
		if !enemy_counted 
		{global.enemy_count -- enemy_counted = true}
			
		repeat(15)
		{
			var inst = instance_create_depth(x,y,depth-1,obj_blood)
			with inst
			{
				direction = -90+random_range(-45,45)
				image_angle = direction
				spd = 1.5+random(2)
				image_speed_set(random_range(.5,.8))
				image_blend = other.blood_color
				splatter_col = other.blood_splatter_color
			}
		}		
		
		#endregion
	}
	
	if place_meeting(x,y,obj_slash_fire)
	{
		#region
		
		audio_play_sound(choose(sound_enemy_death_generic,sound_enemy_death_generic_03,sound_enemy_death_generic_02),999,0)
		
		var inst = instance_place(x,y,obj_slash_fire)
		var dir = inst.image_angle
		hspd = lengthdir_x(18,dir)
		vspd = lengthdir_y(12,dir)
		
		blood = true
		state = state_hit
		
		instance_create_depth(x,y,depth,obj_enemy_trigger)
		
		if instance_exists(attack)
			instance_destroy(attack)

		repeat(6)
		{
			if place_free(x+hspd/2,y+vspd/2)
			{x += hspd/2 y += vspd/2}
		}
		
		screen_shake_set(6,16,-2)

		var t = 8
		var i = 1/t
		repeat(t)
		{
			echo_create(lerp(xprevious,x,i),lerp(yprevious,y,i),depth-1,sprite_index,image_index,image_xscale,image_yscale,
			image_angle,image_alpha,c_aqua,10,true)
			i+=1/t
		}
			
		if !enemy_counted 
		{global.enemy_count -- enemy_counted = true}	
		
		repeat(20)
		{
			var inst = instance_create_depth(x,y,depth-1,obj_blood)
			with inst
			{
				direction = dir+random_range(-45,45)
				image_angle = direction
				spd = 1.5+random(2)
				image_speed_set(random_range(.5,.8))
				image_blend = other.blood_color
				splatter_col = other.blood_splatter_color
			}
		}		
		
		#endregion
	}
	
} #endregion

function enemy_dommage_slash(attack_behind=false,atk_behind_func=function(){}){ #region
	var inst = instance_place(x,y,obj_player_attack)
	
	if inst
	{
		
		var col_ = (!collision_line(x,y,inst.x,inst.y,par_collision,0,0)
				|| !collision_line(x,y-8,inst.x-8,inst.y,par_collision,0,0)
				|| !collision_line(x,y+8,inst.x+8,inst.y,par_collision,0,0)
				|| !collision_line(x,y-8,inst.x,inst.y-8,par_collision,0,0)
				|| !collision_line(x,y+8,inst.x,inst.y+8,par_collision,0,0))
	
		if ((!attack_behind 
		|| round(lengthdir_x(1,inst.image_angle)) = image_xscale)
		|| inst.object_index = obj_dragon_slash
		|| inst.sword = sword_big
		|| (inst.y > bbox_bottom && inst.image_angle > 90-45 && inst.image_angle < 90+45))
		&& col_
		{
			#region
			
			audio_play_sound(choose(sound_enemy_death_sword_01,sound_enemy_death_sword_02),999,0)
			instance_create_depth(x,y,depth,obj_enemy_trigger)
		
			var dir = inst.image_angle
			hspd = lengthdir_x(12,dir)
			vspd = lengthdir_y(12,dir)
		
			blood = true
			state = state_hit
			
			obj_player.attack_timer = 5
			
			if instance_exists(attack)
				instance_destroy(attack)

			repeat(6)
			{
				if place_free(x+hspd/2,y+vspd/2)
				{x += hspd/2 y += vspd/2}
			}
			
			particule_create(x,y,depth,spr_slashfx,0,1,true)
			with instance_create_depth(x,y,depth-1,obj_slashfx2)
			{image_angle = dir}
			screen_shake_set(6,18,-1)
			sleep(10)
			
			var t = 8
			var i = 1/t
			repeat(t)
			{
				echo_create(lerp(xprevious,x,i),lerp(yprevious,y,i),depth-1,sprite_index,image_index,image_xscale,image_yscale,
				image_angle,image_alpha,c_aqua,10,true)
				i+=1/t
			}
			
			if !enemy_counted 
			{global.enemy_count -- enemy_counted = true}
			
			with inst.creator
			{
				attack_dash_mult = 1
			}
			
			repeat(13)
			{
				var inst = instance_create_depth(x,y,depth-1,obj_blood)
				with inst
				{
					direction = dir+random_range(-45,45)
					image_angle = direction
					spd = 1.5+random(2)
					image_speed_set(random_range(.5,.8))
					image_blend = other.blood_color
					splatter_col = other.blood_splatter_color
				}
			}	
		
			#endregion
		}
		else if attack_behind 
		&& ((sign(inst.creator.x-x)=image_xscale) || round(lengthdir_x(1,inst.image_angle)) != image_xscale)
		&& col_
		{
			atk_behind_func()
		}
	
	}
}#endregion

function enemy_dommage_ball(attack_behind=false,atk_behind_func=function(){}){ #region
	var inst = instance_place(x,y,obj_player_ball)
	
	if inst
	{
		if (!attack_behind)
		|| (image_xscale =  1 && (inst.image_angle<90 || inst.image_angle>270))
		|| (image_xscale = -1 && (inst.image_angle>90 && inst.image_angle<270))
		{
		#region
			
		audio_play_sound(sound_enemy_death_bullet,999,0)
		instance_create_depth(x,y,depth,obj_enemy_trigger)
		
		var dir = inst.image_angle
		hspd = lengthdir_x(12,dir)
		vspd = lengthdir_y(12,dir)
		
		obj_player.bullet_reload = 2
		
		blood = true
		state = state_hit

		if instance_exists(attack)
			instance_destroy(attack)

		repeat(6)
		{
			if place_free(x+hspd/2,y+vspd/2)
			{x += hspd/2 y += vspd/2}
		}
			
		particule_create(x,y,depth,spr_slashfx,0,1,true)
		with instance_create_depth(x,y,depth-1,obj_slashfx2)
		{image_angle = dir}
		screen_shake_set(6,18,-1)
		sleep(10)
			
		var t = 8
		var i = 1/t
		repeat(t)
		{
			echo_create(lerp(xprevious,x,i),lerp(yprevious,y,i),depth-1,sprite_index,image_index,image_xscale,image_yscale,
			image_angle,image_alpha,c_aqua,10,true)
			i+=1/t
		}
			
		if !enemy_counted 
		{global.enemy_count -- enemy_counted = true}
			
		instance_destroy(inst)
		
		repeat(13)
		{
			var inst = instance_create_depth(x,y,depth-1,obj_blood)
			with inst
			{
				direction = dir+random_range(-45,45)
				image_angle = direction
				spd = 1.5+random(2)
				image_speed_set(random_range(.5,.8))
				image_blend = other.blood_color
				splatter_col = other.blood_splatter_color
			}
		}	
		
		#endregion
		}
		else if attack_behind 
		{
			atk_behind_func()
		}
	} 	
}#endregion

function enemy_create_trigger(dist_=160) { #region
	var inst = instance_create_depth(x,y,0,obj_enemy_trigger)
	inst.dist = dist_
	
	return inst
} #endregion