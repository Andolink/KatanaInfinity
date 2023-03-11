repeat(spd)
{
	x += lengthdir_x(1,ang)*global.game_spd
	y += lengthdir_y(1,ang)*global.game_spd
}

image_angle = ang
if !place_free(x,y)
{instance_destroy()}
image_speed_update()

echo_create(x,y,depth-1,sprite_index,image_index,1,1,image_angle,.1,c_white,12,true,1)