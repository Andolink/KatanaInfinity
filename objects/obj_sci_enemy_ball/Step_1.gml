hspd = lengthdir_x(spd,dir)*global.slow_motion
vspd = lengthdir_y(spd,dir)*global.slow_motion

image_angle = dir

spd = lerp(spd,spd-0.01,0.1)

x += hspd
y += vspd

if !place_free(x+hspd,y) 
|| !place_free(x,y+vspd)
{
	dir = point_direction(0,0,-hspd,-vspd)
	
	spd *= .5
	screen_shake_set(6,12,-2)
	particule_create(x,y,depth-2,spr_bulletreflect)

	reflect_num--
	if reflect_num <= 0
		instance_destroy()
}

var t = 3
var i = 1/t
repeat(t)
{
	echo_create(lerp(xprevious,x,i),lerp(yprevious,y,i),depth+1,sprite_index,image_index,image_xscale*1.2,image_yscale*2,
	image_angle,image_alpha/4,c_white,10,true,1)
	i+=1/t
}