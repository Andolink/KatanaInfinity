draw_self()

if place_mouse()
{
	draw_set_color(c_white)
	draw_set_alpha(.8)
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1)
	draw_set_alpha(1)
}

draw_sprite_ext(spr_level_effect,0,x,y,1,1,0,c_white,random_range(0.08,0.11))
draw_set_font(global.font_text)
draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)
draw_text(bbox_left,bbox_top-1,name)