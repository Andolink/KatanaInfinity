var mouse_gui_x = device_mouse_x_to_gui(0)
var mouse_gui_y = device_mouse_y_to_gui(0)

draw_set_color(merge_color(#0000FF,c_black,.5))
draw_set_alpha(.6)
draw_rectangle(-1,-1,GAME_WIDTH,GAME_HEIGHT,-1)

draw_set_font(font_pause)
draw_set_color(#0000FF)
draw_set_alpha(.8)
draw_rectangle(-1+50,-1+50,GAME_WIDTH-50,GAME_HEIGHT-50,-1)
draw_set_alpha(1)
draw_set_color(c_white)
draw_rectangle(-1+51,-1+51,GAME_WIDTH-51,GAME_HEIGHT-51,1)

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text_scribble_ext(55,55,text,GAME_WIDTH-55*2)

#region TYPE BOUTON

var typ_char = ""

if typing
{
	typing_time +=.5
	if typing_time >= 10
	{typing_time = 0}
	if typing_time <= 4
	{typ_char = "_"}
	
	if KEY_PRS(vk_enter) && !wait_miss_click
	{
		if func!=-1 {func()}
		instance_destroy()
	}
	
	typed_text = string_copy(keyboard_string,1,50)
}

keyboard_string = typed_text

draw_set_halign(fa_left)
draw_set_valign(fa_bottom)

var box_x0 = 55
var box_y0 = GAME_HEIGHT-55-string_height("CANCEL")
var box_x1 = GAME_WIDTH-55-string_width("CANCEL")-12
var box_y1 = GAME_HEIGHT-55

draw_text(55,GAME_HEIGHT-55,keyboard_string+typ_char)

if mouse_gui_x > box_x0 && mouse_gui_x < box_x1
&& mouse_gui_y > box_y0 && mouse_gui_y < box_y1
{
	draw_set_color(c_white)
	draw_set_alpha(.5)
	draw_rectangle(box_x0,box_y0,box_x1,box_y1,0)
	draw_set_alpha(1)
	if MBT_PRS(mb_left) && !wait_miss_click
	{typing = true}
}
else
{
	if MBT_PRS(mb_left) && !wait_miss_click
	{typing = false}
}

#endregion

#region CANCEL BOUTON

draw_set_halign(fa_right)
draw_set_valign(fa_bottom)

var box_x0 = GAME_WIDTH-55-string_width("CANCEL")
var box_y0 = GAME_HEIGHT-55-string_height("CANCEL")
var box_x1 = GAME_WIDTH-55
var box_y1 = GAME_HEIGHT-55

draw_text(GAME_WIDTH-55,GAME_HEIGHT-55,"CANCEL")

if mouse_gui_x > box_x0 && mouse_gui_x < box_x1
&& mouse_gui_y > box_y0 && mouse_gui_y < box_y1
{
	draw_set_color(c_white)
	draw_set_alpha(.5)
	draw_rectangle(box_x0,box_y0,box_x1,box_y1,0)
	draw_set_alpha(1)
	if MBT_PRS(mb_left) && !wait_miss_click
	{instance_destroy()}
}

#endregion