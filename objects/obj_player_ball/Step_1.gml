if place_meeting(x,y,obj_enemy_ball)
{
	audio_play_sound(sound_bulletdie,999,0)
	screen_shake_set(6,12,-2)
	sleep(5)
	particule_create(x,y,depth-2,spr_bulletreflect)
	
	instance_destroy(instance_place(x,y,obj_enemy_ball))
	instance_destroy()
}

var door_ = instance_place(x,y,obj_door)

if place_meeting(x,y,par_collision)
|| (door_ && !door_.open)
&& !first_step
{
	audio_play_sound(sound_bulletdie,999,0)
	instance_destroy()
}
first_step = false

repeat(10)
{
	if instance_exists(obj_player)
	{var spd_ = obj_player.player_game_speed}
	else
	{var spd_ = global.game_spd}
	
	x += lengthdir_x(spd/5,dir)*spd_
	y += lengthdir_y(spd/5,dir)*spd_
	
	var inst = instance_place(x,y,par_enemy)
	var door_ = instance_place(x,y,obj_door)

	if place_meeting(x,y,par_collision)
	|| (door_ && !door_.open)
	|| place_meeting(x,y,obj_enemy_ball)
	|| (inst && inst.state != inst.state_hit)
		break
}

image_angle = dir
image_xscale = point_distance(x,y,xprevious,yprevious)/spd