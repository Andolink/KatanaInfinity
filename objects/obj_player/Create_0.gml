hspd	= 0
vspd	= 0
grav	= 8
grav_tar= 8
spd		= 2.5
mov_x	= 0

mov_spd		= .5
mov_spd_tar = .5

fall	= true

jump_hold		= 0
jump_hold_max	= 10
jump_buffer		= 0
coyote_jump		= 5
attack_buffer	= 0

sword				= sword_normal
attack				= noone
attack_jump			= true
attack_timer		= 0
attack_timer_max	= 20
attack_dash_mult	= 1
attack_master		= 1

rool_buffer			= 0
rool_wait			= 0

aim_assist			= true

invi_frame = 0

image_speed_init()
player_set_sprite(spr_idle,0)

object = noone
object_buffer = false
object_sprite = noone

chronos = 11
chronos_using = false
chronos_over_used = false
chronos_max = 11

dragon_slash_state		= 0
dragon_slash_timer		= 0
dragon_slash_timer_max	= 50

dragon_dash_x		= x
dragon_dash_y		= y
dragon_dash_range	= 0

murasama_slash_state	= 0
murasama_slash_state_t	= 0
murasama_slash_timer	= 0
murasama_slash_timer_max= 60

ninjarun_buffer		= 0
ninjarun_spd		= 3
ninjarun_state		= 0
ninjarun_state_timer= 0

hp = 1
stop = false

cutscene = false
cutscene_var = 0

run_sfx	= 0

echo_effect = 0

bullet_num			= 1
bullet_max			= 1
bullet_reload		= 0
bullet_reload_max	= 30

char_switch_num		= 2
allow_char_switch	= true

y_ground			= y

player_game_speed	= 1

player_set_characters(	skin_zero_gun,gameplay_gun,
						skin_infinity,gameplay_sword,
						skin_dragon,gameplay_dragon,
						skin_murasama,gameplay_murasama)

switch_char_effect			= 0
switch_char_old_sprite		= 0
switch_char_old_img_index	= 0
switch_char_old_w			= 0
switch_char_old_h			= 0
switch_char_old_xoff		= 0
switch_char_old_yoff		= 0

state_normal = function(){#region
	
	mov_x = input_get(global.input_right,CHECK,cutscene)-input_get(global.input_left,CHECK,cutscene)
	
	var walk = false
	var spd_t = 0
	
	if mov_x != 0
	{
		if input_get(global.input_walk,CHECK,cutscene)
		{
			spd_t = 2.5
			walk = true
		}
		else
		{
			spd_t = 5
		}
	}
	else
	{
		spd_t = 0
	}
	
	if in_slope
	{
		spd_t *= .6
	}
	
	spd = lerp(spd,spd_t,.2*player_game_speed)
	
	mov_spd = lerp(mov_spd,mov_spd_tar,.05*player_game_speed)
	
	if in_air
	{
		if mov_x != 0 || attack_timer > 0
			hspd = lerp(hspd,mov_x*spd,mov_spd/3*player_game_speed)
		else
			hspd = lerp(hspd,mov_x*spd,mov_spd/10*player_game_speed)
	}
	else
		hspd = lerp(hspd,mov_x*spd,mov_spd*player_game_speed)
		
	vspd = lerp(vspd,grav,.05*player_game_speed)
	grav = lerp(grav,grav_tar,.1*player_game_speed)
	
	if in_platforme && place_free(x,y+1)
	&& input_get(global.input_down,CHECK,cutscene)
	&& vspd > 0
	{y+=1 vspd = 0}
	
	if input_get(global.input_down,CHECK,cutscene) && in_air
	{grav = lerp(grav,28,.4*player_game_speed)}
	
	if hspd != 0 && mov_x != 0
		image_xscale = sign(hspd)

	if sprite_index = player_get_sprite(spr_wall_grab,skin_id)
	{
		if !audio_is_playing(sound_player_wallslide)
			audio_play_sound(sound_player_wallslide,999,0)
		
		if !place_free(x+1,y)
			image_xscale = 1
		else
			image_xscale = -1
	}
	else
	{
		audio_stop_sound(sound_player_wallslide)
	}

	if !place_free(x+image_xscale,y) && in_air && mov_x != 0
	{
		image_speed_set(1)
		if input_get(global.input_right,PRESSED,cutscene) || input_get(global.input_left,PRESSED,cutscene)
		|| (sprite_index != player_get_sprite(spr_wall_grab,skin_id)
		&&	sprite_index != player_get_sprite(spr_attack,skin_id))
		{vspd = 0 grav = 0}
		player_set_sprite(spr_wall_grab,skin_id)
	}
	else if sprite_index = player_get_sprite(spr_flip,skin_id)
	{
		image_speed_set(1)
	}
	else if sprite_index = player_get_sprite(spr_dragon_slash_dash,skin_id)
	{
		image_speed_set(1)
	}
	else if sprite_index = player_get_sprite(spr_attack,skin_id)
	{
		image_speed_set(1)
	}
	else if in_air
	{
		image_speed_set(1)
		
		if vspd < 0
			player_set_sprite(spr_jump,skin_id)
		else
			player_set_sprite(spr_fall,skin_id)
	}
	else if mov_x != 0
	{
		if sprite_index = player_get_sprite(spr_fall,skin_id)
		{
			audio_play_sound(sound_player_land,999,0)
			particule_create(x,bbox_bottom,depth-1,spr_landcloud)
		}
		
		if walk
		{
			if sprite_index = player_get_sprite(spr_idle,skin_id)
			{player_set_sprite(spr_idle_to_walk,skin_id,true)}
			else if sprite_index != player_get_sprite(spr_idle_to_walk,skin_id)
			{player_set_sprite(spr_walk,skin_id) image_speed_set(abs(hspd)/3)}
		}
		else
		{
			if sprite_index = player_get_sprite(spr_idle,skin_id)
			|| sprite_index = player_get_sprite(spr_run_to_idle,skin_id)
			{
				hspd = 0 mov_spd = 0.1
				player_set_sprite(spr_idle_to_run,skin_id,true)
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
			}
			else if sprite_index != player_get_sprite(spr_idle_to_run,skin_id)
			{
				if sprite_index != player_get_sprite(spr_run,skin_id)
				{image_index = 0 run_sfx = 0}
				player_set_sprite(spr_run,skin_id)
				
				image_speed_set(abs(hspd)/3)
				if (image_index > 4 && run_sfx = 1)
				|| (image_index > 0 && run_sfx = 0)
				{
					audio_play_sound(choose(sound_player_running_1,sound_player_running_2,sound_player_running_3,sound_player_running_4),999,0)
					run_sfx ++
				}
			}
		}
	}
	else
	{
		if sprite_index = player_get_sprite(spr_fall,skin_id)
		{
			audio_play_sound(sound_player_land,999,0)
			particule_create(x,bbox_bottom,depth-1,spr_landcloud)
		}
		
		if sprite_index = player_get_sprite(spr_run,skin_id) || sprite_index = player_get_sprite(spr_idle_to_run,skin_id)
		{player_set_sprite(spr_run_to_idle,skin_id) image_index = 0}
		else if sprite_index != player_get_sprite(spr_run_to_idle,skin_id)
		{player_set_sprite(spr_idle,skin_id) image_speed_set(1)}
		
		if skin_id = 3 && (sprite_index = player_get_sprite(spr_idle,skin_id) || sprite_index = player_get_sprite(spr_attack,skin_id))
		{
			var xsc = sign(global.input_aim_x-x)
			if xsc != 0 
				image_xscale = xsc
		}
	}		
	
}#endregion

state_kick_door = function(){#region
	
	hspd = 0
	vspd = 0
	mov_x = input_get(global.input_right,CHECK,cutscene)-input_get(global.input_left,CHECK,cutscene)
	
	if sprite_index != player_get_sprite(spr_door_break_full,skin_id)
	{
		player_set_sprite(spr_door_break_full,skin_id,true)
		image_speed_set(1)
	}
	
	if image_index > 2
	{
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
				event_user(0)
		}
	}
	
	if image_index > 6
	{
		if mov_x != 0
			event_perform(ev_animation_end,0)
	}
	
} #endregion

state_roll = function(){#region
	
	if sprite_index != player_get_sprite(spr_roll,skin_id)
	{
		audio_play_sound(sound_player_roll,999,0)
		audio_play_sound(sound_player_roll_real,999,0)
		
		player_set_sprite(spr_roll,skin_id,true)
		image_speed_set(1)
		
		mov_x = input_get(global.input_right,CHECK,cutscene)-input_get(global.input_left,CHECK,cutscene)
		
		if mov_x != 0
			image_xscale = mov_x
		
		if mov_x = 0
			mov_x = image_xscale
		
		hspd = mov_x*7.5
		spd = abs(spd)
	}
	
	animation_speed = 0.85
	
	echo_effect = true
	hspd -= .1*sign(hspd)*player_game_speed
	
	if in_air 
	{
		vspd = 0
	}
	else
	{
		grav = lerp(grav,grav_tar,.05*player_game_speed)
		vspd = grav
	}
	
	if place_meeting(x,y+8,par_slope)
	&& !place_meeting(x,y+1,par_slope)
	&& in_platforme
	{
		while !place_meeting(x,y+1,par_slope)
		{y++}
		vspd = grav
	}
	
	var num = 1
	if global.slow_motion <= 0.5
	{num = choose(0,0,1)}
	
	repeat(num)
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
	
}#endregion

state_ninjarun = function(){#region

}#endregion

state_hit = function() {#region
	
	grav = 6
	vspd = lerp(vspd,grav,.05*player_game_speed)
	
	if !place_free(x+hspd,y)
	{hspd = -hspd/2}
	
	instance_get_information()
	
	if in_air
	{
		echo_effect = true
		image_speed_set(1)
		
		hspd = lerp(hspd,0,.01*player_game_speed)
		if sprite_index != player_get_sprite(spr_hurt,skin_id)
		{
			player_set_sprite(spr_hurt_loop,skin_id)
			chronos_over_used = true
		}
	}
	else
	{
		hspd = lerp(hspd,0,.1*player_game_speed)
		if sprite_index != player_get_sprite(spr_hurt_ground,skin_id)
		&& sprite_index != player_get_sprite(spr_hurt,skin_id)
		&& sprite_index != player_get_sprite(spr_hurt_ground_to_idle,skin_id)
		{
			player_set_sprite(spr_hurt_ground,skin_id,true)
			image_speed_set(1)
		}
		
		if in_ground && sprite_index != player_get_sprite(spr_hurt_ground_to_idle,skin_id)
		{
			mov_x = input_get(global.input_right,CHECK,cutscene)-input_get(global.input_left,CHECK,cutscene)
			if mov_x != 0 && hp > 0
			{
				player_set_sprite(spr_hurt_ground_to_idle,skin_id,true)
				image_speed_set(1)
			}
		}
	}
	
}#endregion

dommage_system = function() {#region
	
	var inst = instance_place(x,y,obj_enemy_terry_slash)
	
	if inst
	&& instance_exists(inst.creator)
	&& state != state_roll
	&& hp	 != 0
	&& !invi_frame
	{
		#region
		player_set_sprite(spr_hurt,skin_id)
		screen_shake_set(3,8,-2)
		sleep(15)
		
		audio_play_sound(sound_enemy_punch_hit,999,0)
		audio_play_sound(sound_playerdie,999,0)
		
		var dir = inst.image_angle
		hspd = lengthdir_x(12,dir)
		vspd = lengthdir_y(12,dir)
		hp --
		state = state_hit
		#endregion
	}
	else if place_meeting(x,y,obj_enemy_ball) 
	&& state != state_roll
	&& hp	 != 0
	&& !invi_frame
	{
		#region
		player_set_sprite(spr_hurt,skin_id)
		screen_shake_set(3,8,-2)
		sleep(15)
		
		audio_play_sound(sound_enemy_death_bullet,999,0)
		audio_play_sound(sound_playerdie,999,0)
		
		var inst = instance_place(x,y,obj_enemy_ball)
		var dir = inst.image_angle
		hspd = lengthdir_x(12,dir)
		vspd = lengthdir_y(12,dir)
		hp --
		state = state_hit
		instance_destroy(inst)
		#endregion
	}
	else if place_meeting(x,y,obj_door_hitbox_player) 
	&& state != state_hit
	&& state != state_roll
	{
		#region
		player_set_sprite(spr_hurt,skin_id)
		screen_shake_set(3,8,-2)
		sleep(15)
		
		audio_play_sound(sound_enemy_punch_hit,999,0)
		
		var inst = instance_place(x,y,obj_door_hitbox_player)
		var dir = 90-90*inst.image_xscale
		hspd = lengthdir_x(12,dir)
		vspd = lengthdir_y(12,dir)
		//hp = 1
		state = state_hit
		#endregion
	}
	else if place_meeting(x,y,obj_ceilling_laser_hit_box)
	&& state != state_roll
	&& !stop
	&& !invi_frame
	{
		#region
		
		audio_play_sound(choose(sound_actor_disintegrate,sound_actor_disintegrate_2),999,0)
		
		var inst = instance_create_depth(x,y,depth,obj_ceilling_laser_kill_effect)
		inst.sprite_index	= sprite_index 
		inst.image_index	= image_index
		inst.image_alpha	= image_alpha
		inst.image_xscale	= image_xscale
		
		visible = false
		hp = 0
		stop = true
		
		screen_shake_set(10,25,-2)
		sleep(20)
		
		#endregion
	}
	else if bbox_top > room_height
	&& !stop
	{
		#region
		
		audio_play_sound(sound_playerdie,999,0)
		
		visible = false
		hp = 0
		stop = true
		
		screen_shake_set(10,25,-2)
		sleep(20)
		
		#endregion
	}
	else if place_meeting(x,y,obj_psybossinfinity_tentacle) 
	&& state != state_roll
	&& hp	 != 0
	{
		#region
		player_set_sprite(spr_hurt,skin_id)
		screen_shake_set(3,8,-2)
		sleep(15)
		
		audio_play_sound(sound_enemy_punch_hit,999,0)
		audio_play_sound(sound_playerdie,999,0)
		
		hp --
		state = state_hit
		#endregion
	}
	else if (place_meeting(x,y,obj_sliding_door_door) 
	|| place_meeting(x,y,obj_stomper))
	&& hp	 != 0
	{
		#region
		player_set_sprite(spr_hurt,skin_id)
		screen_shake_set(3,8,-2)
		sleep(15)
		audio_play_sound(sound_enemy_punch_hit,999,0)
		audio_play_sound(sound_playerdie,999,0)
		
		hp --
		state = state_hit
		#endregion
	}
	else if place_meeting(x,y,obj_explosion) 
	&& state != state_roll
	&& hp	 != 0
	&& !invi_frame
	{
		#region
		player_set_sprite(spr_hurt,skin_id)
		screen_shake_set(3,8,-2)
		sleep(15)
		
		audio_play_sound(sound_playerdie,999,0)
		
		var inst = instance_place(x,y,obj_explosion)
		var dir = point_direction(inst.x,inst.y,x,y)
		hspd = lengthdir_x(12,dir)
		vspd = lengthdir_y(12,dir)
		hp --
		state = state_hit
		
		#endregion
	}
	 
}#endregion

state = state_normal