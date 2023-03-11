draw_sprite_ext(spr_go_text,0,exit_x-24*text_move*go_side,exit_y-20,image_xscale,1,0,c_white,1)

var cam_x = camera_get_view_x(view_camera[0])
var cam_y = camera_get_view_y(view_camera[0])

var ang = point_direction(obj_player.x,obj_player.y,exit_x,exit_y)
ang += angle_difference(arrow_ang,ang)*clamp(1-(point_distance(obj_player.x,obj_player.y,exit_x,exit_y)-500)/500,0,1)

var x_	= clamp(lerp(obj_player.x,exit_x,clamp(1-(point_distance(obj_camera.x,obj_camera.y,exit_x,exit_y)-500)/500,.5,1)),
cam_x+48,cam_x+obj_camera.camera_size*GAME_WIDTH-48)

var y_	= clamp(lerp(obj_player.y,exit_y,clamp(1-(point_distance(obj_camera.x,obj_camera.y,exit_x,exit_y)-500)/500,.5,1)),
cam_y+48,cam_y+obj_camera.camera_size*GAME_HEIGHT-48)

x_ += lengthdir_x(-24*text_move,ang)
y_ += lengthdir_y(-24*text_move,ang)

draw_sprite_ext(spr_go_arrow,0,x_,y_,1,1,ang,c_white,1)