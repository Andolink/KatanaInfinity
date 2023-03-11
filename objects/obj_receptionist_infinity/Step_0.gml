mov_x = input_get(global.input_right,CHECK,cutscene)-input_get(global.input_left,CHECK,cutscene)

hspd = lerp(hspd,mov_x*1.2,.5)
vspd = 8

if mov_x = 0
{
	sprite_index = spr_pl_casual_idle_infinity
}
else
{
	image_xscale = mov_x
	sprite_index = spr_pl_casual_walk_infinity
}

x = clamp(x,0,room_width)

if x > room_width-8 && !cutscene
{
	cutscene = true
	with instance_create_depth(x,y,0,obj_hud_transition)
	{func_transition = function(){room_goto_next()}}
}

collision_system(hspd,vspd)