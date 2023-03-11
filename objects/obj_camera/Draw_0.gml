//Evoid showing outside the room when shake

if !instance_exists(obj_level_editor)
&& !instance_exists(obj_lvl_pack_manager)
{
	draw_set_color(c_black)
	draw_rectangle(-30,-30,-1,room_height+30,0)
	draw_rectangle(room_width,-30,room_width+30,room_height+30,0)
	draw_rectangle(-30,-30,room_width+30,-1,0)
	draw_rectangle(-30,room_height,room_width+30,room_height+30,0)
}