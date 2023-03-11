if sprite_index = spr_floor_turret_die
{
	exit	
}


if reload > 0
	draw_healthbar(x-8,y-24,x+8,y-22,(reload/reload_max)*100,c_black,c_red,c_red,0,true,true)