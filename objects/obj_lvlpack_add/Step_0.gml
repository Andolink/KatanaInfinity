if instance_exists(obj_ledit_message) || instance_exists(obj_lvlpack_modify_menu) exit

if place_mouse() && MBT_PRS(mb_right)
{
	var i_ = instance_create_depth(x,y,depth,obj_lvlpack_modify)
	with i_ {id_ = other.id_+1}
	var i__ = instance_create_depth(x+80,y,depth,obj_lvlpack_level)
	with i__ {id_ = other.id_+1}
	var i___ = instance_create_depth(x+160,y,depth,obj_lvlpack_add)
	with i___ {id_ = other.id_+1}
	
	with instance_create_depth(x,y,depth,obj_link)
	{inst0 = i_ inst1 = i__}
	with instance_create_depth(x,y,depth,obj_link)
	{inst0 = i__ inst1 = i___}
	
	with obj_link
	{
		if inst0 = other.id
		{inst0 = i_}
		if inst1 = other.id
		{inst1 = i_}
	}
	
	instance_destroy()
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