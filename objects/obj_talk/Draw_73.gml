if text_break exit

draw_set_color(c_black)

var box_w = text_width
var box_h = text_height
var box_x = text_x
var box_y = text_y-box_h

var tri_x = text_x
var tri_y = text_y+8-box_h*(1-text_box_open_anim)

draw_set_alpha(text_box_open_anim*2)

draw_triangle(tri_x,tri_y,tri_x-3,tri_y-8,tri_x+3,tri_y-8,false)
draw_rectangle(box_x-box_w/2,box_y,box_x+box_w/2,box_y+box_h*text_box_open_anim,false)

draw_set_alpha(1)

draw_set_color(c_white)
draw_set_halign(fa_left)
draw_set_valign(fa_top)

text.draw(box_x-box_w/2+4,box_y+3,typist)

if typist.get_state() <= 1 && text_box_open_anim_state = 0
{
	draw_sprite(spr_textbox_circle,(1-waiting_bef_switch)*sprite_get_number(spr_textbox_circle),box_x+box_w/2,box_y+box_h*text_box_open_anim)
	draw_sprite(spr_textbox_arrow,0,box_x+box_w/2,box_y+box_h*text_box_open_anim)
}