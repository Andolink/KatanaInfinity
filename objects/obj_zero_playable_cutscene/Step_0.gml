if global.editor_cutscene_move
	mov_x = input_get(global.input_right,CHECK,global.editor_cutscene_move)-input_get(global.input_left,CHECK,global.editor_cutscene_move)
else
	mov_x = 0

hspd = lerp(hspd,mov_x*1.2,.5)
vspd = 8

if mov_x = 0
{
	sprite_index = idle_sprite
}
else
{
	image_xscale = mov_x
	sprite_index = walk_sprite
}

x = clamp(x,0,room_width)

collision_system(hspd,vspd)