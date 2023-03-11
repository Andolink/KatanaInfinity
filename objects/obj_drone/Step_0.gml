var pickable_ = false
var bullet_ = false
var slash_ = false

var inst = instance_place(x,y,obj_player_attack) 
if inst slash_ = true
	
if !inst
{var inst = instance_place(x,y,obj_player_ball) if inst bullet_ = true}
if !inst
{var inst = instance_place(x,y,obj_pickable_trow) if inst pickable_ = true}

if inst
{
	audio_play_sound(sound_enemy_drone_death_01,999,0)
	
	echo_create(x,y,depth-1,spr_drone_dead,0,1,1,0,1,c_white,10,true,2)
	
	var inst_= instance_create_depth(x,y,depth,obj_drone_dead)
	
	with inst_
	{
		if pickable_
		{dir = point_direction(0,0,inst.hspd,inst.vspd)}
		else
		{dir = inst.image_angle}
	}
	
	with instance_create_depth(x,y,depth-1,obj_slashfx2)
	{image_angle = inst_.dir}
	screen_shake_set(6,18,-1)
	sleep(10)
	
	if bullet_ obj_player.bullet_reload = 2
	else if slash_ obj_player.attack_timer = 5
	
	instance_destroy()
	if pickable_ || bullet_
	{instance_destroy(inst)}
}

if attack
{
	#region 
	sprite_index = spr_drone
	
	var dir_ = point_direction(x,y,obj_player.x+obj_player.hspd,obj_player.y)
	
	var dif = angle_difference(dir_,attack_dir)/5
	
	attack_dir += dif*global.game_spd

	if attack_dir < 0
	{attack_dir += 360}
	else if attack_dir > 360
	{attack_dir -= 360}
	

	if attack_dir > 270
		image_index = ((attack_dir-270)/90)*9.5
	else if attack_dir > 180
		image_index = ((90-(attack_dir-180))/90)*9.5
	else
		image_index = 9.5
	
	if abs(dif)<1.5 && attack_dir > 180
	{
		aim_time -= global.game_spd
		if aim_time <= 0
		{
			audio_play_sound(choose(sound_gun_fire_1,sound_gun_fire_2),999,0)
			var x_ = x+lengthdir_x(10,attack_dir)
			var y_ = y+lengthdir_y(10,attack_dir)
			create_bullet(x_,y_,depth+1,attack_dir,25)
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
			aim_time = aim_time_max
		}
	}
	else
	{
		aim_time = aim_time_max
	}
	
	if obj_player.x > x
	{
		image_xscale = 1
	}
	else
	{
		image_xscale = -1
	}
	
	if point_distance(x,0,obj_player.x,0)>100
	{	
		if obj_player.x > x
		{
			hspd = lerp(hspd,+spd,0.02*global.game_spd)
		}
		else
		{
			hspd = lerp(hspd,-spd,0.02*global.game_spd)
		}
	}
	else
	{
		hspd = lerp(hspd,0,0.02*global.game_spd)
	}
	
	if point_distance(y,0,obj_player.y,0)>100
	{	
		if obj_player.y > y
		{
			vspd = lerp(vspd,+spd,0.02*global.game_spd)
		}
		else
		{
			vspd = lerp(vspd,-spd,0.02*global.game_spd)
		}
	}
	else
	{
		vspd = lerp(vspd,0,0.02*global.game_spd)
	}
	
	if !enemy_ai_saw_player
	{
		wait_return_idle -= global.game_spd
		if wait_return_idle <= 0
		{
			attack = false
			sprite_index = spr_drone_turn
			image_index = 0
			image_speed_set(0)
		}
	}
	
	#endregion
}
else if !turning
{
	#region
	if (image_xscale = -1 && (x < xstart-hfly_dist || !place_free(x+image_xscale*16,y)))
	|| (image_xscale = 1 && (x > xstart+hfly_dist || !place_free(x+image_xscale*16,y)))
	{
		turning = true
		image_index = spr_drone_turn
		image_index = 0
		image_speed_set(1)
	}
	
	hspd = lerp(hspd,image_xscale*spd,0.05)

	if point_distance(y,0,ystart,0)>16
	{	
		if obj_player.y > y
		{
			vspd = lerp(vspd,+spd,0.02*global.game_spd)
		}
		else
		{
			vspd = lerp(vspd,-spd,0.02*global.game_spd)
		}
	}
	else
	{
		vspd = lerp(vspd,0,0.02*global.game_spd)
	}
	
	if image_xscale = 1
	{attack_dir = 0}
	else
	{attack_dir = 180}
	#endregion
}
else
{
	#region
	hspd = lerp(hspd,0,0.02)
	if point_distance(y,0,ystart,0)>16
	{	
		if obj_player.y > y
		{
			vspd = lerp(vspd,+spd,0.02*global.game_spd)
		}
		else
		{
			vspd = lerp(vspd,-spd,0.02*global.game_spd)
		}
	}
	else
	{
		vspd = lerp(vspd,0,0.02*global.game_spd)
	}
	#endregion
}

enemy_ai_saw_player	=	distance_to_object(obj_player)<300
						&&	!collision_line(x,y-10,obj_player.x,obj_player.y-12,par_collision,0,0)
						&&	!collision_line(x,y-10,obj_player.x,obj_player.y-12,obj_door,0,0)
						
if enemy_ai_saw_player
{attack = true wait_return_idle = 20 turning = false}

collision_system(hspd,vspd)
image_speed_update()