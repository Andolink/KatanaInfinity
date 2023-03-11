image_blend = merge_color(c_black,c_white,global.slow_motion)

var aim_ = sprite_index=spr_cop_aim

if aim_ 
{
	draw_sprite_ext(spr_cop_rightarm,0,x,y,1,image_xscale,arm_dir,image_blend,image_alpha)
	gpu_set_blendmode(bm_add)
	apply_light_effect(spr_cop_rightarm,0,x,y,1,image_xscale,arm_dir,image_blend,image_alpha)	
	gpu_set_blendmode(bm_normal)
}

draw_self_light()

if aim_ 
{
	draw_sprite_ext(spr_cop_gun,0,x,y,1,image_xscale,arm_dir,image_blend,image_alpha)
	draw_sprite_ext(spr_cop_leftarm,0,x,y,1,image_xscale,arm_dir,image_blend,image_alpha)
	gpu_set_blendmode(bm_add)
	apply_light_effect(spr_cop_gun,0,x,y,1,image_xscale,arm_dir,image_blend,image_alpha)	
	apply_light_effect(spr_cop_leftarm,0,x,y,1,image_xscale,arm_dir,image_blend,image_alpha)	
	gpu_set_blendmode(bm_normal)
}