//Draw lazer

draw_sprite_ext(spr_ceiling_laser_outline,0,x,y,1,lazer_size,0,c_white,1)

if gun_alp < 1
{gun_alp += 0.05*global.game_spd}
else
{gun_alp = 1}

draw_sprite_ext(spr_ceiling_laser_gun,gun_img,x+random_range(-1,1),y+random_range(-1,1)+1,1,lazer_size,0,c_white,gun_alp)
	
gun_img +=.65							//increase the image index for the lazer

draw_self()