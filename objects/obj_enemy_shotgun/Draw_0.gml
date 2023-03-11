image_blend = merge_color(c_black,c_white,global.slow_motion)

var aim_ = sprite_index=spr_shotgun_aim

draw_self_light()
	
if aim_ 
{
	draw_sprite_ext(spr_shotgun_arm,shotgun_frame,x,y,1,image_xscale,arm_dir,image_blend,image_alpha)
	gpu_set_blendmode(bm_add)
	apply_light_effect(spr_shotgun_arm,shotgun_frame,x,y,1,image_xscale,arm_dir,image_blend,image_alpha)	
	gpu_set_blendmode(bm_normal)
}