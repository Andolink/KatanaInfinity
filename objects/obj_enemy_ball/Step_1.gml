x += lengthdir_x(spd,dir)*global.slow_motion
y += lengthdir_y(spd,dir)*global.slow_motion

image_angle = dir
image_xscale = point_distance(x,y,xprevious,yprevious)/spd

var inst = instance_place(x,y,obj_player_attack)

if inst
{
	screen_shake_set(6,12,-2)
	
	if !global.audio_bullet_refelect_buffer 
	{
		audio_play_sound(sound_slash_bullet,999,0)
		global.audio_bullet_refelect_buffer = 1
	}
	
	sleep(15)
	dir += 180
	
	with inst.creator
	{
		attack_dash_mult = 1
		attack_timer = 5
	}
	
	with instance_create_depth(x,y,depth,obj_player_ball)
	{
		sprite_index = other.sprite_index
		dir = other.dir
		spd = other.spd
	}
	
	
	particule_create(x,y,depth-2,spr_bulletreflect)
	
	instance_destroy()
}