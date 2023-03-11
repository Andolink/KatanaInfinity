if !instance_exists(obj_player)
{
	exit
}

var hud_style = 0

start_anim = lerp(start_anim,0,0.1)

var cam_x = camera_get_view_x(view_camera[0])
var cam_y = camera_get_view_y(view_camera[0])
var cam_s = camera_get_view_width(view_camera[0])/GAME_WIDTH
var x_ = global.input_aim_x-cam_x*cam_s
var y_ = global.input_aim_y-cam_y*cam_s

if obj_player.gameplay_mode = 2
{
	draw_sprite_ext(spr_cursor,1,x_,y_,1,1,0,c_white,1)
}
else
{
	draw_sprite_ext(spr_cursor,0,x_,y_,1,1,0,c_white,1)
}

draw_sprite_ext(spr_hud,0,GAME_WIDTH/2,0-start_anim,1,1,0,c_white,1)

draw_set_font(global.font_timer)
draw_set_halign(fa_right)
draw_set_valign(fa_top)

if global.speedrun_showtimer
{
	draw_sprite_ext(spr_hud_speedrun1,0,GAME_WIDTH/2,0-start_anim,1,1,0,c_white,1)
}

if global.speedrun_showdeath
{
	draw_sprite_ext(spr_hud_speedrun,0,GAME_WIDTH/2,0-start_anim,1,1,0,c_white,1)

	if global.speedrun_deathcount1000 > 0
	draw_set_color(c_white) else draw_set_color(c_gray)
	draw_text(GAME_WIDTH*.342-1-56,3-start_anim,string(global.speedrun_deathcount1000))
	if global.speedrun_deathcount100 > 0 || global.speedrun_deathcount1000 > 0
	draw_set_color(c_white) else draw_set_color(c_gray)
	draw_text(GAME_WIDTH*.342-1-49,3-start_anim,string(global.speedrun_deathcount100))
	if global.speedrun_deathcount10 > 0 || global.speedrun_deathcount100 > 0 || global.speedrun_deathcount1000 > 0
	draw_set_color(c_white) else draw_set_color(c_gray)
	draw_text(GAME_WIDTH*.342-1-42,3-start_anim,string(global.speedrun_deathcount10))
	if global.speedrun_deathcount1 > 0 || global.speedrun_deathcount10 > 0 || global.speedrun_deathcount100 > 0 || global.speedrun_deathcount1000 > 0
	draw_set_color(c_white) else draw_set_color(c_gray)
	draw_text(GAME_WIDTH*.342-1-35,3-start_anim,string(global.speedrun_deathcount1))
	draw_text(GAME_WIDTH*.342-1-28,3-start_anim,"/")
	if global.speedrun_deathcount1000gl > 0
	draw_set_color(c_white) else draw_set_color(c_gray)
	draw_text(GAME_WIDTH*.342-1-21,3-start_anim,string(global.speedrun_deathcount1000gl))
	if global.speedrun_deathcount100gl > 0 || global.speedrun_deathcount1000gl > 0
	draw_set_color(c_white) else draw_set_color(c_gray)
	draw_text(GAME_WIDTH*.342-1-14,3-start_anim,string(global.speedrun_deathcount100gl))
	if global.speedrun_deathcount10gl > 0 || global.speedrun_deathcount100gl > 0 || global.speedrun_deathcount1000gl > 0
	draw_set_color(c_white) else draw_set_color(c_gray)
	draw_text(GAME_WIDTH*.342-1- 7,3-start_anim,string(global.speedrun_deathcount10gl))
	if global.speedrun_deathcount1gl > 0 || global.speedrun_deathcount10gl > 0 || global.speedrun_deathcount100gl > 0 || global.speedrun_deathcount1000gl > 0
	draw_set_color(c_white) else draw_set_color(c_gray)
	draw_text(GAME_WIDTH*.342-1   ,3-start_anim,string(global.speedrun_deathcount1gl))
}

draw_sprite_ext(spr_hud_timer,1,GAME_WIDTH/2,0-start_anim*2,1,1,0,c_white,1)
draw_sprite_part(spr_hud_timer_bar,0,0,0,
				 sprite_get_width(spr_hud_timer_bar)*(global.level_timer/global.level_timer_max),11,
				 GAME_WIDTH/2-sprite_get_width(spr_hud_timer_bar)/2+8,2-start_anim*2)
draw_sprite_ext(spr_hud_timer,0,GAME_WIDTH/2,0-start_anim*2,1,1,0,c_white,1)

draw_sprite_ext(spr_hud_battery,0,0-start_anim*2,0,1,1,0,c_white,1)

var key_ = global.key_chronos[1]
if global.gamepad >= 0 key_ = global.key_gp_chronos[1]
draw_sprite(input_get_sprite(key_),input_get(global.input_chronos,CHECK,obj_player.cutscene),77+17-start_anim*2,11)

var i = 0

repeat(11)
{
	var col = c_white
	if instance_exists(obj_player)
	{
		if i > obj_player.chronos
		{col = c_red}
	}
	
	draw_sprite_ext(spr_hud_battery_part,0,12+i*5-start_anim*2,6,1,1,0,col,1)
	i++
}

draw_sprite_ext(spr_hud_subweapon,1,GAME_WIDTH-8+other.start_anim*2,0,1,1,0,c_white,1)

//var item_ = 
with obj_player
{
	switch gameplay_mode
	{
		default : draw_sprite_ext(spr_katanaicons,sword,GAME_WIDTH-50+other.start_anim*2,12,1,1,0,c_white,1) break
		case gameplay_no_sword : draw_sprite_ext(spr_itemicons,0,GAME_WIDTH-50+other.start_anim*2,12,1,1,0,c_white,1) break
		case gameplay_gun : draw_sprite_ext(spr_pistol,0,GAME_WIDTH-50+other.start_anim*2,12,1,1,0,c_white,1) break
	}
	
	if object != noone
	{draw_sprite_ext(object_sprite,0,GAME_WIDTH-20+other.start_anim*2,12,1,1,0,c_white,1)}
	else
	{draw_sprite_ext(spr_itemicons,0,GAME_WIDTH-20+other.start_anim*2,12,1,1,0,c_white,1)}
}