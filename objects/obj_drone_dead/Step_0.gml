image_angle_previous = image_angle
image_angle += 10*global.game_spd

repeat(5)
{
	x += lengthdir_x(2,dir)*global.game_spd
	y += lengthdir_y(2,dir)*global.game_spd

	if !place_free(x,y)
	|| place_meeting(x,y,par_enemy)
	|| place_meeting(x,y,obj_enemy_ball)
	|| place_meeting(x,y,obj_psybossinfinity)
	{
		audio_play_sound(choose(sound_explosion1,sound_explosion2,sound_explosion3),999,0)
		instance_create_depth(x+random_range(-3,3),y+random_range(-3,3),depth,obj_explosion)
		var i = 0
		repeat(12)
		{
			var len = 24+random(8)
			instance_create_depth(x+lengthdir_x(len,i),y+lengthdir_y(len,i),depth,obj_explosion)
			i +=360/12
		}
		screen_shake_set(6,18,-1)
		instance_destroy()
	}
}

var t = 3
var i = 1/t
repeat(t)
{
	echo_create(lerp(xprevious,x,i),lerp(yprevious,y,i),depth+1,sprite_index,image_index,image_xscale,image_yscale,
	lerp(image_angle_previous,image_angle,i),image_alpha/4,c_white,4)
	i+=1/t
}