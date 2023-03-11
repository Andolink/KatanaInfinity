t--
life--
if t <= 0
{
	t = 2
	if image_blend = c_aqua
		image_blend = c_fuchsia
	else
		image_blend = c_aqua
		
	x += lengthdir_x(90,image_angle)
	y += lengthdir_y(90,image_angle)
}

if life <=0
{instance_destroy()}
