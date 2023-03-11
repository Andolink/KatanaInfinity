function collision_system(hspd,vspd) {  #region

instance_get_information()

hspd *= global.game_spd
vspd *= global.game_spd
var hspd_ = hspd
var vspd_ = vspd

#region move x		begin

	if (frac(x) != 0)
	&& (abs(hspd >= 1))
	{
		if (hspd > 0)
		{hspd_ -= 1-frac(x) collision_x(1-frac(x))}
		else if (hspd < 0)
		{hspd_ -= -frac(x) collision_x(-frac(x))}
	}

#endregion
#region move x		run

	repeat(floor(abs(hspd_)))
	{
		var i = collision_x(sign(hspd_))
		if (i=0)
		{break}
	}

#endregion
#region move x		end

	if (frac(hspd_) != 0) 
	{collision_x(frac(hspd_))}

#endregion

#region move y		begin

	if (frac(y) != 0)
	&& abs(vspd>=1)
	{
		if (vspd > 0)
		{vspd_ -= 1-frac(y) collision_y(1-frac(y))}
		else
		{vspd_ -= -frac(y) collision_y(-frac(y))}
	}

#endregion
#region move y		run

	repeat(floor(abs(vspd_)))
	{
		var i = collision_y(sign(vspd_))
		if (i=0)
		{break}
	}

#endregion
#region move y		end

	if (frac(vspd_) != 0)
	{collision_y(frac(vspd_))}

#endregion

#region reset jump if wall on top

	if vspd < 0
	&& !place_free(x,y-1)
	{
		jumps_stat = 0
		vspd = 0
	}

#endregion

#region fix weird Y pos
if in_ground && place_free(x,round(y))
{
	y = round(y)
}
#endregion

} #endregion

function instance_get_y_ground() { #region
	var val = y
	while place_free(x,val) && val < room_height
	&& !place_meeting(x,val,par_platform)
	{
		val++
	}

	val += bbox_bottom-y
	
	return val
} #endregion
	
function collision_free() { #region
	var i = 0
	while !place_free(x,y)
	{
		if place_free(x+i,y)
		{x += i break}
		else if place_free(x-i,y)
		{x -= i break}
		else if place_free(x,y+i)
		{y += i break}
		else if place_free(x,y-i)
		{y -= i break}
		i++
	}
} #endregion

function collision_free_all() { #region
	var i = 0
	while !place_free(x,y)
	{
		if place_free(x+i,y) && !place_meeting(x+i,y,par_platform)
		{x += i break}
		else if place_free(x-i,y) && !place_meeting(x-i,y,par_platform)
		{x -= i break}
		else if place_free(x,y+i) && !place_meeting(x,y+i,par_platform)
		{y += i break}
		else if place_free(x,y-i) && !place_meeting(x,y-i,par_platform)
		{y -= i break}
		i++
	}
} #endregion