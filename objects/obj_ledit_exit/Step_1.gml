level_editor_grab_object(false)

if obj_level_editor.grab = id
{
	if KEY_PRS(ord("X"))
	{image_angle += 90}
	
	image_yscale += (KEY_PRS(vk_add)-KEY_PRS(vk_subtract))*2
	image_yscale = clamp(image_yscale,1,99)
}

x = floor(x/16)*16+8
y = floor(y/16)*16

visible = global.level_editor_col_visi