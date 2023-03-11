var lceil = instance_place(x-1,y,obj_ceilling_tile)

if lceil
	instance_destroy(lceil)

var rceil = instance_place(x+1,y,obj_ceilling_tile)

if rceil
	instance_destroy(rceil)
	
var i = 0
repeat(floor(image_xscale))
{
	var inst = instance_create_depth(bbox_left+8+16*i,y,depth,obj_ceilling_tile_part)
	inst.sprite_index = sprite_index
	inst.image_angle = random_range(-10,10)
	inst.hspd = random_range(-1,1)
	i++
}