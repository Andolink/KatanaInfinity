if global.speedrun_showtimer && room != rm_main_menu && room != rm_level_editor && global.speedrun_mode
{
	draw_set_font(global.font_timer)
	draw_set_halign(fa_right)
	draw_set_valign(fa_top)

	draw_set_color(#E5B9D6)
	draw_text_scribble(GAME_WIDTH*.9,0,"[#E5B9D6]"+string(global.speedrun_timer_min)+":"+string(global.speedrun_timer_sec)+".["+global.font_timersmall_name+"]"+string(global.speedrun_timer_msec))
	draw_set_color(#26CCFF)
	draw_text_scribble(GAME_WIDTH*.9,10,"[#26CCFF]"+string(global.speedrun_timergl_min)+":"+string(global.speedrun_timergl_sec)+".["+global.font_timersmall_name+"]"+string(global.speedrun_timergl_msec))
}