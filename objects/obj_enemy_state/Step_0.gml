if anim_state = 0
{
	image_index = 0
	image_xscale = 0.5
	image_yscale = 0.5
	image_speed = 1
	anim_state = 1
}

if anim_state = 1
{
	image_xscale = lerp(image_xscale,1.2,0.5)
	image_yscale = image_xscale
}