if instance_exists(creator)
{
	x = creator.x
	y = creator.y
}
else
{
	instance_destroy()
}

image_speed = global.game_spd