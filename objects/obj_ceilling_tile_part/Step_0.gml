//var pl_atk = instance_place(x,y,obj_player_attack)

//if pl_atk
//{
//	hspd = lengthdir_x(8,pl_atk.image_angle)
//	vspd = lengthdir_y(8,pl_atk.image_angle)
//}

if in_ground
	hspd = lerp(hspd,0,.1*global.game_spd)
else
	hspd = lerp(hspd,0,.02*global.game_spd)
vspd = lerp(vspd,20,.01*global.game_spd)
	
image_angle += hspd*global.game_spd
	
collision_free()

collision_lib()

if !place_free(x+hspd,y)
{
	hspd = -hspd*.5
}
	
if !place_free(x,y+vspd) 
|| in_platforme
{
	vspd = -vspd*.5
}
	
collision_system(hspd,vspd)