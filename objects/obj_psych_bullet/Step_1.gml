if !start && start_count > 0
{
	start_count -= global.game_spd
	exit
}

if intro_anim
{
	intro_spd = lerp(intro_spd,-.82,0.09*global.game_spd)
	if intro_spd < -.8
	{intro_anim = false}
	x += lengthdir_x(intro_spd,dir)*global.game_spd
	y += lengthdir_y(intro_spd,dir)*global.game_spd
}
else
{
	x += lengthdir_x(spd,dir)*global.game_spd
	y += lengthdir_y(spd,dir)*global.game_spd
}

image_angle = dir
echo_create(x,y,depth+1,sprite_index,image_index,image_xscale,image_yscale,
image_angle,0.25,c_red,6,true,1.5)