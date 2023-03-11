draw_sprite_ext(spr_player_death_gui,0,GAME_WIDTH/2,GAME_HEIGHT/2,4.5,1.8,0,c_white,1)

draw_set_halign(fa_middle)
draw_set_valign(fa_middle)
draw_set_font(global.font_text)

var text = "No...\nThat won't work.\n\n(LEFT CLICK to restart)"
if global.gamepad != -1
	var text = "No...\nThat won't work.\n\n(press ANY BUTTON to restart)"

draw_set_color(c_fuchsia)
draw_set_alpha(.5)
draw_text(GAME_WIDTH/2,GAME_HEIGHT/2,text)

draw_set_color(choose(#00C8FF,#32F4FF,#7FFFFF))
draw_set_alpha(1)

draw_text(GAME_WIDTH/2-.5-random(.2),GAME_HEIGHT/2-.5,text)