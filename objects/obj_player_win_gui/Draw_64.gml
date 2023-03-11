draw_set_color(c_black)
draw_set_alpha(trans)
draw_rectangle(-1,-1,1000,1000,0)
draw_set_alpha(1)

draw_set_halign(fa_middle)
draw_set_valign(fa_middle)
draw_set_color(c_white)
draw_set_font(global.font_text)

var text = "Yes, that should work."

draw_text(GAME_WIDTH/2,GAME_HEIGHT/2,text)