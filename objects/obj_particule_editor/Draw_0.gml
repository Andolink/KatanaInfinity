var i = 0
draw_set_color(c_black)

if mouse_x > room_width-60	select	+= mouse_wheel_down()-mouse_wheel_up()
else						select2 += mouse_wheel_down()-mouse_wheel_up()

repeat(20)
{
	select = clamp(select,0,9)
	var txt = ""
	switch i
	{
		case 0 : txt = "Visual"		break
		case 1 : txt = "Scale"		break
		case 2 : txt = "Color"		break
		case 3 : txt = "Speed"		break
		case 4 : txt = "Direction"	break
		case 5 : txt = "Gravity"	break
		case 6 : txt = "Orientation"break
		case 7 : txt = "Alpha"		break
		case 8 : txt = "Size"		break
		case 9 : txt = "Life"		break
	}
	draw_set_alpha(.5)
	if i = select
	{draw_set_alpha(1)}
	draw_set_halign(fa_left)
	draw_text(room_width-60,room_height/2+i*16-select*16,txt)
	draw_set_alpha(1)
	i++
}

draw_set_halign(fa_right)

switch(select)
{
	case 0 : // "visual"
	#region
	if sprite
	{
		select2 = clamp(select2,0,4)
		switch select2
		{
			case 0 : if MBT_PRS(mb_left) sprite = !sprite break
			case 1 : if MBT_PRS(mb_left) sprite_id = asset_get_index(get_string("Sprite name",sprite_get_name(sprite_id))) break
			case 2 : if MBT_PRS(mb_left) animat = !animat break
			case 3 : if MBT_PRS(mb_left) strtch = !strtch break
			case 4 : if MBT_PRS(mb_left) srandom = !srandom break
		}
		draw_text(room_width-70,room_height/2-select2*16,		"Switch to Shape")
		draw_text(room_width-70,room_height/2+16-select2*16,	"Sprite = "+sprite_get_name(sprite_id))
		draw_text(room_width-70,room_height/2+32-select2*16,	"Animated = "+string(animat))
		draw_text(room_width-70,room_height/2+48-select2*16,	"Stretch = "+string(strtch))
		draw_text(room_width-70,room_height/2+64-select2*16,	"Random = "+string(srandom))	
	}
	else
	{
		select2 = clamp(select2,0,1)
		switch select2
		{
			case 0 : if MBT_PRS(mb_left) sprite = !sprite break
			case 1 : if MBT_PRS(mb_left) shape_id = get_integer("Shape id",shape_id) break
		}
		draw_text(room_width-70,room_height/2-select2*16,		"Switch to Sprite")
		draw_text(room_width-70,room_height/2+16-select2*16,	"Shape = "+string(shape_id))
	}
	#endregion
	break
	case 1 : // "scale"	
	#region
	
	select2 = clamp(select2,0,1)
	switch select2
	{
		case 0 : 
		if MBT_PRS(mb_left) scalex = get_integer("Scale X",scalex)
		break
		case 1 : 
		if MBT_PRS(mb_left) scaley = get_integer("Scale Y",scaley)
		break
	}
	draw_text(room_width-70,room_height/2-select2*16,		"Scale X = "+string(scalex))
	draw_text(room_width-70,room_height/2+16-select2*16,	"Scale Y = "+string(scaley))	
	
	#endregion
	break
	case 2 : // "color"	
	#region
	
	select2 = clamp(select2,0,4)
	switch select2
	{
		case 0 : 
		if MBT_PRS(mb_left) 
		{color ++ if color > 3 color = 1}
		break
		case 1 : 
		if MBT_PRS(mb_left)	{color1_ ++ if color1_ > 21 color1_ = 0}
		break
		case 2 : 
		if MBT_PRS(mb_left)	{color2_ ++ if color2_ > 21 color2_ = 0}
		break
		case 3 : 
		if MBT_PRS(mb_left)	{color3_ ++ if color3_ > 21 color3_ = 0}
		break
		case 4 : 
		if MBT_PRS(mb_left)	additive = !additive 
		break
	}
	draw_text(room_width-70,room_height/2-select2*16,		"Color step = "+string(color))
	draw_set_color(color1)
	draw_text(room_width-70,room_height/2+16-select2*16,	"Color0 = "+string(color1))	
	draw_set_color(color2)
	draw_text(room_width-70,room_height/2+32-select2*16,	"Color1 = "+string(color2))	
	draw_set_color(color3)
	draw_text(room_width-70,room_height/2+48-select2*16,	"Color2 ="+string(color3))	
	draw_set_color(c_black)
	draw_text(room_width-70,room_height/2+64-select2*16,	"Additive ="+string(additive))	
	
	#endregion
	break
	case 3 : // "speed"	
	#region
	
	select2 = clamp(select2,0,3)
	switch select2
	{
		case 0 : 
		if MBT_PRS(mb_left)	spdmin = get_integer("Min",spdmin)
		break
		case 1 : 
		if MBT_PRS(mb_left)	spdmax = get_integer("Max",spdmax)
		break
		case 2 : 
		if MBT_PRS(mb_left)	spdinc = get_integer("Inc",spdinc)
		break
		case 3 : 
		if MBT_PRS(mb_left)	spdwig = get_integer("Wig",spdwig)
		break
	}
	draw_text(room_width-70,room_height/2-select2*16,		"Speed Min = "+string(spdmin))
	draw_text(room_width-70,room_height/2+16-select2*16,	"Speed Max = "+string(spdmax))	
	draw_text(room_width-70,room_height/2+32-select2*16,	"Speed Inc = "+string(spdinc))	
	draw_text(room_width-70,room_height/2+48-select2*16,	"Speed Wig = "+string(spdwig))	
	
	#endregion
	break
	case 4 : // "dir"	
	#region
	
	select2 = clamp(select2,0,3)
	switch select2
	{
		case 0 : 
		if MBT_PRS(mb_left)	dirmin = get_integer("Min",dirmin)
		break
		case 1 : 
		if MBT_PRS(mb_left)	dirmax = get_integer("Max",dirmax)
		break
		case 2 : 
		if MBT_PRS(mb_left)	dirinc = get_integer("Inc",dirinc)
		break
		case 3 : 
		if MBT_PRS(mb_left)	dirwig = get_integer("Wig",dirwig)
		break
	}
	draw_text(room_width-70,room_height/2-select2*16,		"Dir Min = "+string(dirmin))
	draw_text(room_width-70,room_height/2+16-select2*16,	"Dir Max = "+string(dirmax))	
	draw_text(room_width-70,room_height/2+32-select2*16,	"Dir Inc = "+string(dirinc))	
	draw_text(room_width-70,room_height/2+48-select2*16,	"Dir Wig = "+string(dirwig))	
	
	#endregion
	break
	case 5 : // "grav"	
	#region
	
	select2 = clamp(select2,0,1)
	switch select2
	{
		case 0 : 
		if MBT_PRS(mb_left) 
		if MBT_PRS(mb_left)	grav	= get_integer("Gravity",grav)
		break
		case 1 : 
		if MBT_PRS(mb_left)	gravang  = get_integer("Angle",gravang)
		break
	}
	draw_text(room_width-70,room_height/2-select2*16,		"Gravity = "+string(grav))
	draw_text(room_width-70,room_height/2+16-select2*16,	"Angle = "+string(gravang))		
	
	#endregion
	break
	case 6 : // "ori"	
	#region
	
	select2 = clamp(select2,0,3)
	switch select2
	{
		case 0 : 
		if MBT_PRS(mb_left)	orimin = get_integer("Min",orimin)
		break
		case 1 : 
		if MBT_PRS(mb_left)	orimax = get_integer("Max",orimax)
		break
		case 2 : 
		if MBT_PRS(mb_left)	oriinc = get_integer("Inc",oriinc)
		break
		case 3 : 
		if MBT_PRS(mb_left)	oriwig = get_integer("Wig",oriwig)
		break
	}
	draw_text(room_width-70,room_height/2-select2*16,		"Ori Min = "+string(orimin))
	draw_text(room_width-70,room_height/2+16-select2*16,	"Ori Max = "+string(orimax))	
	draw_text(room_width-70,room_height/2+32-select2*16,	"Ori Inc = "+string(oriinc))	
	draw_text(room_width-70,room_height/2+48-select2*16,	"Ori Wig = "+string(oriwig))	
	
	#endregion
	break
	case 7 : // "alpha"	
	#region
	
	select2 = clamp(select2,0,3)
	switch select2
	{
		case 0 : 
		if MBT_PRS(mb_left) 
		{alpha ++ if alpha > 3 alpha = 1}
		break
		case 1 : 
		if MBT_PRS(mb_left)	alpha1 = get_integer("Alpha",alpha1)
		break
		case 2 : 
		if MBT_PRS(mb_left)	alpha2 = get_integer("Alpha",alpha2)
		break
		case 3 : 
		if MBT_PRS(mb_left)	alpha3 = get_integer("Alpha",alpha3)
		break
	}
	draw_text(room_width-70,room_height/2-select2*16,		"Alpha Step = "+string(alpha))
	draw_text(room_width-70,room_height/2+16-select2*16,	"Alpha0 = "+string(alpha1))	
	draw_text(room_width-70,room_height/2+32-select2*16,	"Alpha1 = "+string(alpha2))	
	draw_text(room_width-70,room_height/2+48-select2*16,	"Alpha2 ="+string(alpha3))	
	
	#endregion
	break
	case 8 : // "size"	
	#region
	
	select2 = clamp(select2,0,3)
	switch select2
	{
		case 0 : 
		if MBT_PRS(mb_left)	sizemin = get_integer("Min",sizemin)
		break
		case 1 : 
		if MBT_PRS(mb_left)	sizemax = get_integer("Max",sizemax)
		break
		case 2 : 
		if MBT_PRS(mb_left)	sizeinc = get_integer("Inc",sizeinc)
		break
		case 3 : 
		if MBT_PRS(mb_left)	sizewig = get_integer("Wig",sizewig)
		break
	}
	draw_text(room_width-70,room_height/2-select2*16,		"Size Min = "+string(sizemin))
	draw_text(room_width-70,room_height/2+16-select2*16,	"Size Max = "+string(sizemax))	
	draw_text(room_width-70,room_height/2+32-select2*16,	"Size Inc = "+string(sizeinc))	
	draw_text(room_width-70,room_height/2+48-select2*16,	"Size Wig = "+string(sizewig))	
	
	#endregion
	break
	case 9 : // "life"	
	#region
	
	select2 = clamp(select2,0,1)
	switch select2
	{
		case 0 : 
		if MBT_PRS(mb_left)	lifemin = get_integer("Min",lifemin)
		break
		case 1 : 
		if MBT_PRS(mb_left)	lifemax = get_integer("Max",lifemax)
		break
	}
	draw_text(room_width-70,room_height/2-select2*16,		"Life Min = "+string(lifemin))
	draw_text(room_width-70,room_height/2+16-select2*16,	"Life Max = "+string(lifemax))	

	#endregion
	break
}