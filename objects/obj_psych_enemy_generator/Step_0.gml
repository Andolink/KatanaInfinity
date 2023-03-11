sprite_index = object_get_sprite(obj)
image_index = 0
image_speed = 0
if effect = -1
	effect = sprite_height

effect -= 1*global.game_spd*spd

particule(obj_part_systeme.part_system,x,y-sprite_yoffset+effect,obj_part_systeme.part_ceiling_lazer_kill,1)

if effect < 0
{
	with instance_create_depth(x,y,depth,obj,{walk_dist:0})
	{image_xscale = other.image_xscale}
	instance_destroy()
}