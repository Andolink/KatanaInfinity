trans = lerp(trans,0,0.05)

if !init_camera
{
	with obj_camera
	{
		x = other.x
		y = other.y
		camera_size = .45
	}
	init_camera = true
}
else
{
	if instance_exists(textbox) && textbox != -1
	{
		with obj_camera
		{
			if other.textbox.text_break
			{
				x = lerp(x,370,.05)
			}
			else
			{
				x = lerp(x,324,.05)
				y = lerp(y,other.y-32,.05)
			}
		}
	}
}

if camera_state = 0
{
	with obj_camera
	{camera_size = lerp(camera_size,.6,.005)}
}
else
if camera_state = 1
{
	with obj_camera
	{camera_size = lerp(camera_size,.6,.1)}
}
