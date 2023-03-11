//var pl_atk = instance_place(x,y,obj_player_attack)

//if pl_atk
//{
//	physic_enable = true
//	hspd = lengthdir_x(8,pl_atk.image_angle)
//	vspd = lengthdir_y(8,pl_atk.image_angle)
//}

//if physic_enable
//{
//	if in_ground
//		hspd = lerp(hspd,0,.1*global.game_spd)
//	else
//		hspd = lerp(hspd,0,.02*global.game_spd)
//	vspd = lerp(vspd,20,.02*global.game_spd)
	
//	image_angle += hspd*global.game_spd
	
//	var i = 0
//	while !place_free(x,y) || place_meeting(x,y,obj_pickable)
//	{
//		if !place_meeting(x+i,y,obj_pickable) && place_free(x+i,y)
//		{x += i break}
//		else if !place_meeting(x-i,y,obj_pickable) && place_free(x-i,y)
//		{x -= i break}
//		else if !place_meeting(x,y+i,obj_pickable) && place_free(x,y+i)
//		{y += i break}
//		else if !place_meeting(x,y-i,obj_pickable) && place_free(x,y-i)
//		{y -= i break}
//		i++
//	}
	
//	var inst = instance_place(x+hspd,y+vspd,obj_pickable_trow)
//	if inst
//	{inst.physic_enable = true}
	
//	if !place_free(x+hspd,y)
//	|| place_meeting(x+hspd,y,obj_pickable)
//	{
//		hspd = -hspd*.5
//	}
	
//	if !place_free(x,y+vspd) 
//	|| place_meeting(x,y+vspd,obj_pickable)
//	|| in_platforme
//	{
//		vspd = -vspd*.5
//	}
	
//	collision_system(hspd,vspd)
//}