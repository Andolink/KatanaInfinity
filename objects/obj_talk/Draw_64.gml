if message_index<=message_max && message_choice_num[message_index]>0
&& !text_break
{
	var top_y = GAME_HEIGHT-message_choice_num[message_index]*20-20
	
	draw_sprite_ext(spr_choice_bar,0,GAME_WIDTH/2-128,top_y,16,1,0,c_white,0.6)
	
	draw_sprite_ext(spr_choice_bar,1,GAME_WIDTH/2-128,top_y,16/waiting_answer_mult,1,0,c_red,1)
	draw_sprite_ext(spr_choice_bar,1,GAME_WIDTH/2-128,top_y,16*waiting_bef_switch,1,0,c_white,1)
	draw_sprite_ext(spr_choice_bar,1,GAME_WIDTH/2-128,top_y,16/waiting_answer_mult,1,0,c_red,.5)
	
	draw_set_halign(fa_middle)
	draw_set_valign(fa_middle)
	draw_set_font(global.font_text)

	
	#region DRAW QUICK ANSWER
	
	if message_choice_quick_text[message_index] != -1
	{
	
		var y_dec = 18
		var alp_ = 1-point_distance(quick_answer_appear_anim,0,1,0)
		var x_dec = (quick_answer_appear_anim-1)*50
		
		draw_set_color(c_red)
		draw_sprite_ext(spr_choice_box,0,GAME_WIDTH/2+x_dec,top_y+18,((string_width(message_choice_quick_text[message_index])+8)/32),1,0,draw_get_color(),alp_)
		
		draw_set_alpha(alp_)
		draw_text(GAME_WIDTH/2+x_dec,top_y+y_dec,message_choice_quick_text[message_index])
		draw_set_alpha(1)
	
	}
	
	#endregion
	
	#region DRAW ANSWERS
	
	if message_choice_num[message_index] != -1
	{
	
		var y_dec = 18
		var i = 0
		var alp_ = 1-point_distance(answer_appear_anim,0,1,0)
		var x_dec = (answer_appear_anim-1)*50
	
		repeat(message_choice_num[message_index])
		{	
			draw_set_color(c_white)
			var txt_ = message_choice_text[message_index,i]
			
			if i = choice_index draw_set_color(c_aqua)
			draw_sprite_ext(spr_choice_box,0,GAME_WIDTH/2+x_dec,top_y+y_dec,((string_width(txt_)+8)/32),1,0,draw_get_color(),alp_)
		
			draw_set_color(c_white)
			draw_set_alpha(alp_)
			draw_text(GAME_WIDTH/2+x_dec,top_y+y_dec,txt_)
			draw_set_alpha(1)
			y_dec += 20
			i++
		}
	}
	
	#endregion
}