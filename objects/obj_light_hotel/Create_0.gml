light = instance_create_layer(x,y+15,"Light",obj_light_hotel1)
depth = layer_get_depth(layer_get_id("TileSet"))-10

image_index = 0

hide = 0
destroyed = false