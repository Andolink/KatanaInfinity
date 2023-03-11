if layer_get_name(layer)="InstancesHardMode"
&& global.difficulty != 2
{instance_destroy() exit}

dir = 0
if image_xscale = -1
	dir = 180
	
sprite_index = spr_floor_turret

reload	= 0
reload_max = 120

aim_time	 = 20
aim_time_max = 20

aim_time2		= 5
aim_time_max2	= 5

image_speed_init()

depth = layer_get_depth("TileSet")-60