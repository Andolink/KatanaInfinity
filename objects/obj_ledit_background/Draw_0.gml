var cam_x = camera_get_view_x(view_camera[0])+GAME_WIDTH/2*(obj_camera.camera_size-1)
var cam_y = camera_get_view_y(view_camera[0])+GAME_HEIGHT/2*(obj_camera.camera_size-1)

if instance_exists(obj_level_editor)
{
	cam_x = 0
	cam_y = 0
}

switch global.level_editor_background
{
	default :
	break
	case "Skyline" : #region
	
	draw_sprite_ext(spr_skyline_clouds,0,
	lerp(0,cam_x,0.8),
	lerp(0,cam_y,0.95),room_width/sprite_get_width(spr_skyline_clouds),1,0,c_white,1)

	draw_sprite_ext(spr_skyline_black,0,
	lerp(0,cam_x,0.6),
	405-190+lerp(0,cam_y,0.9),room_width/sprite_get_width(spr_skyline_black),1,0,c_white,1)
	
	break #endregion
	case "City" : #region
	
	draw_sprite_ext(spr_mansion_sky_0,0,
	lerp(0,cam_x,1),
	lerp(0,cam_y,1),room_width/sprite_get_width(spr_mansion_sky_0),1,0,c_white,1)

	draw_sprite_ext(spr_mansion_skyline_back_0,0,
	lerp(0,cam_x,0.85),
	405-176+lerp(0,cam_y,0.9),room_width/sprite_get_width(spr_mansion_skyline_back_0),1,0,c_white,1)
	
	draw_sprite_ext(spr_mansion_skyline_front_0,0,
	lerp(0,cam_x,0.7),
	405-176+lerp(0,cam_y,0.85),room_width/sprite_get_width(spr_mansion_skyline_front_0),1,0,c_white,1)
	
	break #endregion
	case "Chinatown" : #region
	
	draw_sprite_ext(spr_chinatown_loop_parallax_2_0,0,
	lerp(0,cam_x,0.8),
	lerp(0,cam_y,0.95),room_width/sprite_get_width(spr_chinatown_loop_parallax_2_0),1,0,c_white,1)

	draw_sprite_ext(spr_chinatown_loop_parallax_1_0,0,
	lerp(0,cam_x,0.6),
	lerp(0,cam_y,0.9),room_width/sprite_get_width(spr_chinatown_loop_parallax_1_0),1,0,c_white,1)
	
	break #endregion
	case "Roof" : #region
	
	draw_sprite_ext(spr_skyline_clouds,0,
	lerp(0,cam_x,1),
	lerp(0,cam_y,0.95),room_width/sprite_get_width(spr_skyline_clouds),1,0,c_white,1)

	draw_sprite_ext(spr_cityscape_crater_0,0,
	lerp(0,cam_x,1),
	405-320+lerp(0,cam_y,0.9),room_width/sprite_get_width(spr_cityscape_crater_0),1,0,c_white,1)

	draw_sprite_ext(spr_cityscape_skyline_1,0,
	lerp(0,cam_x,1),
	405-280+lerp(0,cam_y,0.85),room_width/sprite_get_width(spr_cityscape_skyline_1),1,0,c_white,1)
	
	draw_sprite_ext(spr_cityscape_skyline_2,0,
	lerp(0,cam_x,1),
	405-240+lerp(0,cam_y,0.8),room_width/sprite_get_width(spr_cityscape_skyline_2),1,0,c_white,1)
	
	draw_sprite_ext(spr_cityscape_skyline_3,0,
	lerp(0,cam_x,1),
	405-200+lerp(0,cam_y,0.75),room_width/sprite_get_width(spr_cityscape_skyline_3),1,0,c_white,1)
	
	draw_sprite_ext(spr_cityscape_skyline_4,0,
	lerp(0,cam_x,1),
	405-160+lerp(0,cam_y,0.7),room_width/sprite_get_width(spr_cityscape_skyline_4),1,0,c_white,1)
	
	break #endregion
	case "Beach" : #region
	
	draw_sprite_ext(spr_dreamshed_parallax_bg_3,0,
	lerp(0,cam_x,1),
	lerp(0,cam_y,1),room_width/sprite_get_width(spr_dreamshed_parallax_bg_3),1,0,c_white,1)

	draw_sprite_ext(spr_dreamshed_parallax_bg_2,0,
	lerp(0,cam_x,0.85),
	405-220+lerp(0,cam_y,0.9),room_width/sprite_get_width(spr_dreamshed_parallax_bg_2),1,0,c_white,1)
	
	draw_sprite_ext(spr_dreamshed_parallax_bg_1,0,
	lerp(0,cam_x,0.7),
	405-176+lerp(0,cam_y,0.85),room_width/sprite_get_width(spr_dreamshed_parallax_bg_1),1,0,c_white,1)
	
	break #endregion
}