if instance_exists(obj_infinity_credit)
{
	with obj_camera
	{
		x = lerp(x,442,.025)
		y = lerp(y,211,.025)
	}
	back_back = lerp(back_back,.5,0.05)
}
else
{
	with obj_camera
	{
		x = other.x
		y = other.y
		camera_size = 1
	}
}

