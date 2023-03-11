draw_sprite_ext(spr_ceiling_laser_outline,0,x,y,1,lazer_size,0,c_white,1)
	
if on_off
{
	//Draw lazer
	
	if lazer_hit							//Verify which lazer should be draw
		var spr = spr_ceiling_laser_hit		//Lazer when it hit something
	else
		spr = spr_ceiling_laser				//Lazer when it's active

	draw_sprite_ext(spr,lazer_img,x+random_range(-1,1),y+random_range(-1,1)+1,1,lazer_size,0,c_white,1)
	
	lazer_img +=.65							//increase the image index for the lazer
}

draw_self()