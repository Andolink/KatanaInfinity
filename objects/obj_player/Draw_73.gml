if gameplay_mode = gameplay_dragon && dragon_dash_range != 0
{
	draw_sprite_ext(spr_dragon_dash_range,0,x,y,1,1,0,c_white,dragon_dash_range)
	draw_set_color(c_aqua)
	draw_set_alpha(dragon_dash_range)
	draw_circle(dragon_dash_x,dragon_dash_y,dragon_dash_range*5,0)
	draw_line_width(x,y,dragon_dash_x,dragon_dash_y,4)
	draw_set_alpha(1)
}

show_debug_message(char_switch_num)