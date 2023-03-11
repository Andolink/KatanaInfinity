if instance_exists(creator)
{
	x = creator.x
	y = creator.bbox_top-16
	draw_self()
}
else
{
	instance_destroy()
}