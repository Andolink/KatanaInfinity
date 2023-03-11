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

if state = 1
{
	trans = lerp(trans,1.2,0.005)
	cam_x_spd = lerp(cam_x_spd,.6,0.01)
	obj_camera.x += cam_x_spd
	if trans > 1
	{
		room_goto_next()
	}
}