if !find_door
{
	if layer_get_name(layer)="InstancesHardMode"
	&& global.difficulty != 2
	{instance_destroy() exit}

	depth = layer_get_depth("TileSet")-5

	var i = 0
	var door

	repeat(instance_number(obj_enemy_door))
	{
		door[i] = instance_find(obj_enemy_door,i)
		i++
	}

	var i = 0
	var dist = 9999
	var id_  = id
	repeat(instance_number(obj_enemy_door))
	{
		door[i] = instance_find(obj_enemy_door,i)
	
		var dist_ = point_distance(x,y,door[i].x,door[i].y)
	
		if dist_<dist
		&& door[i] != id
		{
			dist = dist_
			id_ = door[i]
		}
	
		i++
	}
	
	door_target = id_
	find_door = true
}

