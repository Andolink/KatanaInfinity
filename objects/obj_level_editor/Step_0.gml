if instance_exists(obj_ledit_message) exit

with obj_music_control
{
	new_music_intro = global.level_editor_music_intro
	new_music_loop = global.level_editor_music_loop
}

light_set_ambiant(global.level_editor_light_color!=c_black,global.level_editor_light_color,16,-32)

if layer_exists("TileSetAlpha")
{layer_destroy(layer_get_id("TileSetAlpha"))}

if layer_exists("TileSetBackAlpha")
{layer_destroy(layer_get_id("TileSetBackAlpha"))}

if KEY_PRS(vk_space)
{
	event_user(0)
}

if KEY(vk_control)
{
	if KEY_PRS(ord("S"))
	{
		event_user(1)
	}

	if KEY_RLS(ord("L"))
	{
		event_user(2)
	}
	
	if KEY_PRS(ord("Z"))
	{
		if KEY(vk_shift)
			event_user(5)
		else
			event_user(4)
	}
}