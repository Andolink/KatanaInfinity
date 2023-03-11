trans = lerp(trans,0,0.05)

if !init_camera
{
	with obj_camera
	{
		x = obj_cuts_infinity_wash.x
		y = obj_cuts_infinity_wash.y-32
		camera_size = .4
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
				x = lerp(x,400,.05)
			}
			else
			{
				x = lerp(x,other.textbox.text_x,.05)
			}
		}
	}
}

if sprite_index = spr_player_nosword_roll
{
	hspd = lerp(hspd,0,0.025)
	var t = 3
	var i = 1/t
	repeat(t)
	{
		echo_create(lerp(xprevious,x,i),lerp(yprevious,y,i),depth+1,
		sprite_index,image_index,image_xscale,image_yscale,
		image_angle,.4,merge_color(c_aqua,c_fuchsia,i),12,true,1)			
	}
	
	with particule_create(x+random_range(-5,5),bbox_bottom-random(15),depth-1,spr_dustcloud,0,.5+random(.4))
	{
		image_alpha = random_range(.5,1)
		hspd = -other.image_xscale*random_range(0.5,1.2)
		vspd = -random_range(0.5,1)
		image_angle = random(5)
		image_xscale = -other.image_xscale
	}
}

if hspd < 7
{hspd = lerp(hspd,0,0.5)}

x += hspd

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
