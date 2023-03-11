if sprite_index = spr_floor_turret_die
{
	draw_self()
	exit	
}

draw_sprite_ext(spr_floor_turret,1,x,y,image_xscale,1,0,c_white,1)
draw_sprite_ext(spr_floor_turret_top,0,x,y-4,1,image_xscale,dir,c_white,1)
draw_sprite_ext(spr_floor_turret,0,x,y,image_xscale,1,0,c_white,1)

