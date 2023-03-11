if sprite
{part_type_sprite(part,sprite_id,animat,strtch,srandom)}
else
{part_type_shape(part,shape_id)}

part_type_scale(part,scalex,scaley)
part_type_size(part,sizemin,sizemax,sizeinc,sizewig)

switch color
{
	case 1 : part_type_color1(part,color1)					break
	case 2 : part_type_color2(part,color1,color2)			break
	case 3 : part_type_color3(part,color1,color2,color3)	break
}

color1 = color_[color1_]
color2 = color_[color2_]
color3 = color_[color3_]

switch alpha
{
	case 1 : part_type_alpha1(part,alpha1)					break
	case 2 : part_type_alpha2(part,alpha1,alpha2)			break
	case 3 : part_type_alpha3(part,alpha1,alpha2,alpha3)	break
}

part_type_speed(part,spdmin,spdmax,spdinc,spdwig)
part_type_direction(part,dirmin,dirmax,dirinc,dirwig)
part_type_gravity(part,grav,gravang)
part_type_orientation(part,orimin,orimax,oriinc,oriwig,true)
part_type_life(part,lifemin,lifemax)
part_type_blend(part,additive)

if KEY(vk_space)
{particule(obj_part_systeme.part_system,mouse_x,mouse_y,part,1)}

if KEY_PRS(ord("S"))
{
	var txt = ""
	var name = get_string("Particule Name : ","part_x")
	
	txt += name+" = part_type_create()"
	
	txt += "\n"
	
	if sprite
	{txt += "part_type_sprite("+name+","+sprite_get_name(sprite_id)+","+string(animat)+","+string(strtch)+","+string(srandom)+")"}
	else
	{txt += "part_type_shape("+name+","+string(shape_id)+")"}
	
	txt += "\n"
	
	txt += "part_type_scale("+name+","+string(scalex)+","+string(scaley)+")"
	txt += "\n"
	txt += "part_type_size("+name+","+string(sizemin)+","+string(sizemax)+","+string(sizeinc)+","+string(sizewig)+")"
	txt += "\n"
	switch color
	{
		case 1 : txt += "part_type_color1("+name+","+string(color1)+")"					break
		case 2 : txt += "part_type_color2("+name+","+string(color1)+","+string(color2)+")"		break
		case 3 : txt += "part_type_color3("+name+","+string(color1)+","+string(color2)+","+string(color3)+")"	break
	}
	
	txt += "\n"

	switch alpha
	{
		case 1 : txt += "part_type_alpha1("+name+","+string(alpha1)+")"					break
		case 2 : txt += "part_type_alpha2("+name+","+string(alpha1)+","+string(alpha2)+")"			break
		case 3 : txt += "part_type_alpha3("+name+","+string(alpha1)+","+string(alpha2)+","+string(alpha3)+")"	break
	}
	
	txt += "\n"

	txt += "part_type_speed("+name+","+string(spdmin)+","+string(spdmax)+","+string(spdinc)+","+string(spdwig)+")"
	txt += "\n"
	txt += "part_type_direction("+name+","+string(dirmin)+","+string(dirmax)+","+string(dirinc)+","+string(dirwig)+")"
	txt += "\n"
	txt += "part_type_gravity("+name+","+string(grav)+","+string(gravang)+")"
	txt += "\n"
	txt += "part_type_orientation("+name+","+string(orimin)+","+string(orimax)+","+string(oriinc)+","+string(oriwig)+",+true)"
	txt += "\n"
	txt += "part_type_life("+name+","+string(lifemin)+","+string(lifemax)+")"
	txt += "\n"
	txt += "part_type_blend("+name+","+string(additive)+")"
	
	clipboard_set_text(
	txt
	)
}