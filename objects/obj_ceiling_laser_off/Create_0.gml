if layer_get_name(layer)="InstancesHardMode"
&& global.difficulty != 2
{instance_destroy() exit}

lazer_img = 0
lazer_size = 0
lazer_hit = false

on_off_last_state = on_off

//Creating the lazer hit box + the lazer size

var i = 1
while	!position_meeting(x,y+i,par_collision)
&&		!position_meeting(x,y+i,par_platform)
&&		y+i < room_height
{
	i ++ //Checking if there is collision, if not increase the lazer size by 1
}

lazer_size = i/24
hit_box = instance_create_depth(x,y,depth,obj_ceilling_laser_hit_box) //Keeping the id of the lazer hit box
hit_box.image_yscale = lazer_size
hit_box.creator = id

if !on_off
	hit_box.y = y+room_height*2

depth = layer_get_depth("TileSet")-5