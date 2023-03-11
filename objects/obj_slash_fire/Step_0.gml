image_speed_update()

if !place_free(x,y)
	spd = lerp(spd,0,.5)

x += lengthdir_x(spd,ang)*global.game_spd
y += lengthdir_y(spd,ang)*global.game_spd

spd = lerp(spd,0,.05)

image_angle = ang

echo_create(x,y,depth-1,sprite_index,image_index,1,1,image_angle,.1,c_white,12,true,1)