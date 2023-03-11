global.lvlpack_selected_level = -1
pack_name = ""
instance_create_depth(x,y,0,obj_camera)

if global.lvlpack_load_name != ""
{
	lvlpack_editor_load(global.lvlpack_load_name,0)
	pack_name = global.lvlpack_load_name
}