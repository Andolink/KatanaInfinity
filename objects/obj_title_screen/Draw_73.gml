draw_set_font(font_xirod)
draw_set_halign(fa_middle)
draw_set_valign(fa_middle)

//var text_ = "Difficulty : < Normal >"
//if global.difficulty = 2
//text_ = "Difficulty : < HardMode >"

draw_set_color(c_black)
draw_set_alpha(.5)
draw_roundrect(GAME_WIDTH/2-180,GAME_HEIGHT/2+60+text_y_dec,GAME_WIDTH/2+180,GAME_HEIGHT+text_y_dec,0)
draw_set_alpha(1)

draw_set_color(c_white)
draw_set_alpha(.25)
text_select_y = lerp(text_select_y,menu_index*21,.2)

draw_roundrect(GAME_WIDTH/2-150,GAME_HEIGHT/2+70+text_select_y+text_y_dec,GAME_WIDTH/2+150,GAME_HEIGHT/2+90+text_select_y+text_y_dec,0)
draw_set_alpha(1)

if visible_text < 3
{
	var i = 0
	repeat(6)
	{
		switch i
		{
			case 0 : var text_ = "NEW GAME" break
			case 1 : var text_ = "CONTINUE" break
			case 2 : var text_ = "SPEEDRUN" break
			case 3 : var text_ = "LEVEL EDITOR" break
			case 4 : var text_ = "OPTIONS" break
			case 5 : var text_ = "EXIT" break
		}
		
		if i = menu_index
		{
			text_glow += 4
			if text_glow > 360 text_glow -= 360
			draw_set_color(c_white)
			draw_set_alpha(lengthdir_x(1.2,text_glow))
			draw_text(
			GAME_WIDTH/2,
			GAME_HEIGHT/2+80+i*21+text_y_dec+1,
			text_
			)
		}
		
		draw_set_alpha(1)
		draw_set_color(merge_color(c_white,c_black,0.05))
		draw_text(
		GAME_WIDTH/2,
		GAME_HEIGHT/2+80+i*21+text_y_dec+2,
		text_
		)
		
		i++
	}
}