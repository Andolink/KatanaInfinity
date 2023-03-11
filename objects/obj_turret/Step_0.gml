if sprite_index = spr_floor_turret_die exit

enemy_ai_saw_player	=	distance_to_object(obj_player)<400
						&&	!collision_line(x,y-4,obj_player.x,obj_player.y-5,par_collision,0,0)
						&&	!collision_line(x,y-4,obj_player.x,obj_player.y-5,obj_door,0,0)
						&&  image_xscale = sign(obj_player.x-x)
						
var inst = instance_place(x,y,obj_player_attack)

if inst
{
	audio_play_sound(sound_turret_death,999,0)
	
	sprite_index = spr_floor_turret_die
	image_index = 0
	dir_ = inst.image_angle
	
	with instance_create_depth(x,y,depth-1,obj_slashfx2)
	{image_angle = dir_}
	screen_shake_set(6,18,-1)
	sleep(10)
	
	obj_player.attack_timer = 5
}

if enemy_ai_saw_player
{
	var dir_ = point_direction(x,y-4,obj_player.x+obj_player.hspd,obj_player.y)
	
	var dif = angle_difference(dir_,dir)/5
	
	dir += dif*global.game_spd

	if dir < 0
	{dir += 360}
	else if dir > 360
	{dir -= 360}
	
	if reload
	{
		reload -= global.game_spd
		if reload <= 0
		{
			audio_play_sound(sound_turret_activate,999,0)
			aim_time	= aim_time_max
			aim_time2	= aim_time_max2
		}
	}
	
	if abs(dif)<1.5 && reload <= 0
	{
		aim_time -= global.game_spd
		
		if (aim_time <= 0 && aim_time2 = aim_time_max2) || aim_time2 <= 0
		{
			audio_play_sound(choose(sound_gun_fire_1,sound_gun_fire_2),999,0)
			var x_ = x+lengthdir_x(28,dir)
			var y_ = y+lengthdir_y(28,dir)-4
			create_bullet(x_,y_,depth+1,dir,25)
			with particule_create(x_,y_,depth-1,choose(spr_gunspark,spr_gunspark2,spr_gunspark3))
			{
				image_angle = other.dir
				image_yscale = other.image_xscale
			}
			with particule_create(x_,y_,depth-1,choose(spr_gunsmoke,spr_gunsmoke2,spr_gunsmoke3))
			{
				image_angle = other.dir
				image_yscale = other.image_xscale
				image_alpha = .5
			}
			if aim_time2 <= 0
			{
				reload = reload_max
				audio_play_sound(sound_turret_overheat,999,0)
			}
		}

		if aim_time <= 0
		{aim_time2 -= global.game_spd}
	}
	
}
else
{
	if image_xscale = -1
	{
		dir += angle_difference(180,dir)/5
	}
	else
	{
		dir += angle_difference(0,dir)/5
	}
}
