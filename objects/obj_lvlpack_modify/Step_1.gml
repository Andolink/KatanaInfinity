if instance_exists(obj_ledit_message) || instance_exists(obj_lvlpack_modify_menu) exit

if place_mouse() && MBT_PRS(mb_right)
{
	with instance_create_depth(0,0,0,obj_lvlpack_modify_menu)
	{creator = other.id}
	global.lvlpack_music		= music
	global.lvlpack_rule			= rule
	global.lvlpack_chronos		= chronos
	global.lvlpack_char_mode	= char
}

if place_mouse() && MBT_PRS(mb_left)
{
	global.lvlpack_selected_level = id
	decx = x-mouse_x
	decy = y-mouse_y
}

if global.lvlpack_selected_level = id
{
	x = mouse_x+decx
	y = mouse_y+decy
	if MBT_RLS(mb_left)
	{global.lvlpack_selected_level = -1}
}

image_index = global.lvlpack_selected_level = id || place_mouse()