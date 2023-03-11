if instance_exists(obj_ledit_message) || instance_exists(obj_lvlpack_modify_menu) exit

if place_mouse() && MBT_PRS(mb_right)
{
	with level_editor_create_message("Type the level you want to assign :",ledit_message_type_write,
	function(){
		name = obj_ledit_message.typed_text
	})
	{
		keyboard_string = other.name
	}
}

if name = ""
{image_index = 0}
else if file_exists("LevelEditor/"+name+".txt")
{image_index = 1}
else
{image_index = 2}

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

var i = 1
while place_meeting(x,y,obj_lvlpack_level)
{
	if !place_meeting(x+i,y,obj_lvlpack_level)
	{x += i}
	else
	if !place_meeting(x,y+i,obj_lvlpack_level)
	{y += i}
	else
	if !place_meeting(x-i,y,obj_lvlpack_level)
	{x -= i}
	else
	if !place_meeting(x,y-i,obj_lvlpack_level)
	{y -= i}
	i++
}