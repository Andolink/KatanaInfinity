/// @param vspd
function collision_y(argument0) {
	
	var ___vspd = argument0

	instance_get_information()
#region semi-collision

	if ___vspd >= 0
	&& in_platforme
	{y = floor(y) return 2}
	
#endregion
#region move

	else
	if (place_free(x,y+___vspd))
	{
		y += ___vspd
		if object_index = obj_player 
		{
			y = clamp(y,-100,room_height+500)
			if y = -100
			{jumps_stat = 0}
		}
		return 1
	}
	else
	{return 0}

#endregion

}
