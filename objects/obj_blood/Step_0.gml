if choose(1,0,0)
{
	with instance_create_depth(x,y,0,obj_bloodsplatter)
	{
		image_index = irandom(8)
		image_angle = other.image_angle+180+random_range(-20,20)
		image_blend = other.splatter_col
	}
}

if global.slow_motion<1
{
	echo_create(x,y,depth+1,sprite_index,image_index,image_xscale,image_yscale,image_angle,.25,image_blend,6,true)
}

x += lengthdir_x(spd,direction)*global.game_spd
y += lengthdir_y(spd,direction)*global.game_spd

image_speed_update()