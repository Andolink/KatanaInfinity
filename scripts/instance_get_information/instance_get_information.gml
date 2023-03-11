function instance_get_information() {
	in_platforme	= collision_line(bbox_left,bbox_bottom,bbox_right,bbox_bottom,par_platform,0,0)
	in_ground		= !place_free(x,y+1) || in_platforme
	in_air			= !in_ground
	in_slope		= place_meeting(x,y+1,par_slope)
}
