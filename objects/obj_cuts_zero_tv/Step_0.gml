trans = lerp(trans,0,0.05)

if !init_camera
{
	with obj_camera
	{
		x = other.x
		y = other.y-32
		camera_size = .6
	}
	init_camera = true
}
else
{
	if textbox = -1
	{
		with obj_camera
		{
			camera_size -= 0.0001
		}
	}
	
	if instance_exists(textbox) && textbox != -1
	{
		with obj_camera
		{
			if other.textbox.text_break
			{
				x = lerp(x,340,.05)
			}
			else
			{
				x = lerp(x,other.textbox.text_x,.05)
			}
		}
	}
}

if state = 1
{
	alarm[1]=30
	state++
}