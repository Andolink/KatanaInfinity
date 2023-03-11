if side = 0
	dir += angle_difference(point_direction(x,y,obj_player.x,obj_player.y),dir)/5
else
	dir += angle_difference(point_direction(x,y,obj_psybossinfinity.x,obj_psybossinfinity.y),dir)/5
	
x += lengthdir_x(spd,dir)*global.game_spd
y += lengthdir_y(spd,dir)*global.game_spd

var bullet_ = instance_place(x,y,obj_player_ball)

if (place_meeting(x,y,obj_player_attack) || bullet_) && side = 0
{
	
	spd *= 1.2
	hp--
	side = !side
	screen_shake_set(6,12,-2)
	audio_play_sound(sound_slash_bullet,999,0)
	sleep(15)
	dir = point_direction(x,y,obj_psybossinfinity.x,obj_psybossinfinity.y)
	obj_player.attack_timer = 5
	
	if bullet_ instance_destroy(bullet_)
	instance_destroy(obj_player_attack)
	
	particule_create(x,y,depth-2,spr_bulletreflect)
}

if side = 0 && place_meeting(x,y,obj_player)
&& obj_player.state != obj_player.state_roll
{
	with instance_create_depth(obj_player.x,obj_player.y,0,obj_psych_bullet)
	{
		image_angle = other.image_angle
		visible = false
	}
}

if side = 1 && place_meeting(x,y,obj_psybossinfinity)
{
	if hp <= 0
	{
		screen_shake_set(6,18,-2)
		sleep(8)
		audio_play_sound(sound_boss_therapist_blastimpact_01,999,0)
		obj_psybossinfinity.sprite_index = spr_psychboss_die
		obj_psybossinfinity.image_index = 0
		instance_destroy()
	}
	else
	{
		side = 0
		audio_play_sound(sound_slash_bullet,999,0)
		sleep(8)
		dir = point_direction(x,y,obj_player.x,obj_player.y)
		obj_psybossinfinity.sprite_index = spr_psychboss_energyball_redirect
		obj_psybossinfinity.image_index = 0
	}
}

echo_create(x,y,depth+1,sprite_index,image_index,image_xscale,image_yscale,
image_angle,0.6,c_white,8,true,1.5)

image_speed_update()