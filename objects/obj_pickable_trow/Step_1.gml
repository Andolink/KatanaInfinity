var image_angle_previous = image_angle
image_angle += hspd*2*global.game_spd

var col_check_step = 5

instance_deactivate_object(par_platform)

repeat(col_check_step)
{
	if !place_free(x,y)
	{instance_destroy()}
	else if place_meeting(x,y,obj_enemy_ball)
	{instance_destroy()}
	
	x += hspd/col_check_step
	y += vspd/col_check_step
	
	var inst = instance_place(x,y,obj_pickable)
	if inst
	{
		inst.physic_enable = true
		inst.hspd = hspd/2
		inst.vspd = vspd/2
	}
	
	var inst = instance_place(x,y,par_enemy)
	if inst && inst.state != inst.state_hit
		break
}

instance_activate_object(par_platform)

var t = 3
var i = 1/t
repeat(t)
{
	echo_create(lerp(xprevious,x,i),lerp(yprevious,y,i),depth+1,sprite_index,image_index,image_xscale,image_yscale,
	lerp(image_angle_previous,image_angle,i),image_alpha/4,c_white,4)
	i+=1/t
}