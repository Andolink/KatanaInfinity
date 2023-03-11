if visible level_editor_grab_object()

x = floor(x/16)*16
y = floor(y/16)*16

if instance_exists(obj_level_editor)
{
	if obj_level_editor.placing_ele = 0
	{
		image_alpha = lerp(image_alpha,clamp(1-distance_to_point(mouse_x,mouse_y)/250,0.25,1),.1)
	}
	else
	{
		image_alpha = lerp(image_alpha,.25,.1)
	}
}
else
{
	image_alpha = .5
}

visible = global.level_editor_col_visi