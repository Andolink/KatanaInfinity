/// @param hspd
function collision_x(argument0) {
	var ___hspd = argument0

	instance_get_information()
		
	if (object_index = obj_player)
	//||  object_get_parent(object_index) = par_ennemi)
	&& !fall
	&& in_ground
	&& !place_meeting(x,y+1,par_slope)
	{var no_fall = true}
	else
	{var no_fall = false}

#region slope
	if (in_ground)	
	{
		var up = 0
		repeat(10)
		{
			if place_meeting(x + ___hspd, y, par_slope)
			&& in_ground
			&& place_free(x,y-1)
			{
				y -= 1
				up += 1
			}

			if (up >= 10) {y += up}
		}
	}

#endregion
#region move
	
#region help out of bloc
	
	if object_index = obj_player
	&& !place_free(x+sign(___hspd),y)
	&& y > 1
	&& vspd >= 0
	&& in_air
	{
		var up = 1
		repeat(7)
		{
			if place_free(x+sign(___hspd),y-up)
			&& !place_meeting(x+sign(___hspd),y,par_slope)
			{y-=up break}
			up++
		}
	}
	
	//if object_index = obj_player
	//&& place_meeting(x+sign(___hspd),y,par_platform)
	//&& vspd >= 0
	//&& in_air
	//&& !input_get(global.input_down,CHECK,cutscene)
	//{
	//	var up = 1
	//	repeat(7)
	//	{
	//		if !place_meeting(x+sign(___hspd),y-up,par_platform)
	//		&& place_free(x+sign(___hspd),y-up)
	//		{y-=up break}
	//		up++
	//	}
	//}
	
	#endregion
	
	if place_free(x+___hspd,clamp(y,0-(y-bbox_bottom+1),room_height+(bbox_top-y-1))) 
	&& (!no_fall 
	|| (no_fall
	&& (!place_free(bbox_right+___hspd,y+1)
	|| place_meeting(bbox_right+___hspd,y+1,par_platform))
	&& (!place_free(bbox_left+___hspd,y+1)
	|| place_meeting(bbox_left+___hspd,y+1,par_platform))))
	{
		x += ___hspd 
		return 1
	}
	else
	{return 0}

#endregion
}
