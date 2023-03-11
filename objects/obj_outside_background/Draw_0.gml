var cam_x = camera_get_view_x(view_camera[0])+GAME_WIDTH/2*(obj_camera.camera_size-1)
var cam_y = camera_get_view_y(view_camera[0])+GAME_HEIGHT/2*(obj_camera.camera_size-1)

draw_sprite_ext(spr_skyline_clouds,0,
lerp(0,cam_x,0.8),
lerp(0,cam_y,0.95),room_width/700,1,0,c_white,1)

draw_sprite_ext(spr_skyline_black,0,
lerp(0,cam_x,0.6),
405-190+lerp(0,cam_y,0.9),room_width/700,1,0,c_white,1)