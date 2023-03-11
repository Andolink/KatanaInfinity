if layer_get_name(layer)="InstancesHardMode"
&& global.difficulty != 2
{instance_destroy() exit}

image_speed = 0
image_index = 0

player_dist = 0
tuto = -1
depth = layer_get_depth("TileSet")-5