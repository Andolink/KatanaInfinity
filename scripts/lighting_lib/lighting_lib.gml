// DEFINE SHADER UNIFORM

// DEFINE SHADER UNIFORM

global.u_col_light		= shader_get_uniform(shd_lighting, "col_light");
global.u_light_pos		= shader_get_uniform(shd_lighting, "light_pos");
global.u_texel_size		= shader_get_uniform(shd_lighting, "texel_size");
global.u_steps			= shader_get_uniform(shd_lighting, "steps");

global.ambiant_light	= true
global.ambiant_light_x	= lengthdir_x(128,75)
global.ambiant_light_y	= lengthdir_y(128,75)
global.ambiant_light_col= c_fuchsia

function light_set_ambiant(enable,col_=c_fuchsia,x_=lengthdir_x(128,75),y_=lengthdir_y(128,75)) {#region
	global.ambiant_light	= enable
	global.ambiant_light_x	= x_
	global.ambiant_light_y	= y_
	global.ambiant_light_col= col_
} #endregion

#region 
function apply_light_effect(spr_,ind_,x_,y_,xsc_,ysc_,ang_,blend_,alpha_,light_=1,ambiant_=1) {#region
	
	if global.ambiant_light && ambiant_
	{
		init_light(-1,spr_,ind_,x_,y_,xsc_,ysc_,ang_)
		draw_sprite_ext(spr_,ind_,x_,y_,xsc_,ysc_,ang_,blend_,alpha_)
		shader_reset()
	}
	
	if light_
	{
		with obj_light
		{
			var dist_ = point_distance(x,y,x_,y_)
			if dist_<150
			{
				init_light(id,spr_,ind_,x_,y_,xsc_,ysc_,ang_)
				draw_sprite_ext(spr_,ind_,x_,y_,xsc_,ysc_,ang_,blend_,alpha_*(1-clamp((dist_-50)/200,0,1)))
				shader_reset()
			}
		}
	}
	
}#endregion

function init_light(light__,spr__,ind__,x__,y__,xsc__,ysc__,ang__) { #region
	shader_set(shd_lighting)
	
	if light__ = -1
	{
		var light_pos_x		= x__+global.ambiant_light_x
		var light_pos_y		= y__+global.ambiant_light_y
		var light_col		= [color_get_red(global.ambiant_light_col)/255,
							   color_get_green(global.ambiant_light_col)/255,
							   color_get_blue(global.ambiant_light_col)/255]
	
		var dist_	= point_distance(x__,y__,light_pos_x,light_pos_y)
		var angle_	= point_direction(x__,y__,light_pos_x,light_pos_y)-ang__
	}
	else
	{
		var light_pos_x		= light__.x
		var light_pos_y		= light__.y
		var light_col		= [color_get_red(light__.col)/255,
								color_get_green(light__.col)/255,
								color_get_blue(light__.col)/255]

		var dist_	= point_distance(x__,y__,light_pos_x,light_pos_y)
		var angle_	= point_direction(x__,y__,light_pos_x,light_pos_y)-ang__
	}
	
	var tex			= sprite_get_texture(spr__, ind__);
	var texel_size	= [texture_get_texel_width(tex)*xsc__, texture_get_texel_height(tex)*ysc__];
	shader_set_uniform_f_array(global.u_texel_size, texel_size);
	shader_set_uniform_f_array(global.u_col_light, light_col);
	shader_set_uniform_f(global.u_light_pos, x__+lengthdir_x(dist_,angle_), y__+lengthdir_y(dist_,angle_));
	shader_set_uniform_f(global.u_steps, 3)
} #endregion

function draw_self_light() {#region
	
	draw_self()
	gpu_set_blendmode(bm_add)
	apply_light_effect(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)	
	gpu_set_blendmode(bm_normal)
	
}#endregion	
#endregion

#region
//function apply_light_effect(spr_,ind_,x_,y_,xsc_,ysc_,ang_,blend_,alpha_) {
	
//	var inst_n = instance_nearest(x,y,obj_light)
	
//	if inst_n && distance_to_object(inst_n)<100
//	{
//		var light			= inst_n
//		var light_pos_x		= light.x
//		var light_pos_y		= light.y
//		var light_col		= [color_get_red(light.col)/255,
//							   color_get_green(light.col)/255,
//							   color_get_blue(light.col)/255]
							   
//		shader_set(shd_lighting)

//		var dist_	= point_distance(x,y,light_pos_x,light_pos_y)
//		var angle_	= point_direction(x,y,light_pos_x,light_pos_y)-ang_

//		var tex			= sprite_get_texture(spr_, ind_);
//		texel_size		= [texture_get_texel_width(tex)*xsc_, texture_get_texel_height(tex)*ysc_];
//		shader_set_uniform_f_array(global.u_texel_size, texel_size);
//		shader_set_uniform_f_array(global.u_col_light, light_col);
//		shader_set_uniform_f(global.u_light_pos, x+lengthdir_x(dist_,angle_), y+lengthdir_y(dist_,angle_));
//		shader_set_uniform_f(global.u_steps, 4)
	
//		draw_sprite_ext(spr_,ind_,x_,y_,xsc_,ysc_,ang_,blend_,alpha_)
	
//		shader_reset()
//	}


//	if global.ambiant_light
//	{
//		var light_pos_x		= x+global.ambiant_light_x
//		var light_pos_y		= y+global.ambiant_light_y
//		var light_col		= [color_get_red(global.ambiant_light_col)/255,
//							   color_get_green(global.ambiant_light_col)/255,
//							   color_get_blue(global.ambiant_light_col)/255]
							   
//		shader_set(shd_lighting)

//		var dist_	= point_distance(x,y,light_pos_x,light_pos_y)
//		var angle_	= point_direction(x,y,light_pos_x,light_pos_y)-ang_

//		var tex			= sprite_get_texture(spr_, ind_);
//		texel_size		= [texture_get_texel_width(tex)*xsc_, texture_get_texel_height(tex)*ysc_];
//		shader_set_uniform_f_array(global.u_texel_size, texel_size);
//		shader_set_uniform_f_array(global.u_col_light, light_col);
//		shader_set_uniform_f(global.u_light_pos, x+lengthdir_x(dist_,angle_), y+lengthdir_y(dist_,angle_));
//		shader_set_uniform_f(global.u_steps, 4)
	
//		draw_sprite_ext(spr_,ind_,x_,y_,xsc_,ysc_,ang_,blend_,alpha_)
	
//		shader_reset()
//	}

	

//}#endregion

//function draw_self_light() {#region
	
//	draw_self()
//	gpu_set_blendmode(bm_add)
//	apply_light_effect(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha,
//	)

//	gpu_set_blendmode(bm_normal)
	
//}
#endregion
	
