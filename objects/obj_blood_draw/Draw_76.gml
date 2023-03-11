if !surface_exists(blood_surf)
{blood_surf = surface_create(room_width,room_height)}

surface_set_target(blood_surf) #region
			
if blood_glitch_fix 
{
	draw_clear_alpha(c_black,0)
	blood_glitch_fix = false
}
			
with obj_bloodsplatter
{
	draw_self()
	instance_destroy()
}
			
surface_reset_target() #endregion
