function menu_init(title_,menu_pos_=0,draw_back_=true){
	menu_name	= title_
	menu_pos	= menu_pos_
	menu_y		= 0
	select_y = 0
	menu_line_num = 0
	menu_line_text[0] = ""
	menu_line_mode[0] = 0
	menu_line_var[0] = -1
	draw_back = draw_back_
	message_draw = false
	binding_key = false
	binding_key_num = 0
	binding_key_timer = 3
	wait_to_avoid_miss_click = 4
}

function menu_add_line(text_,mode_,var_,var1_=-1){
	menu_line_text[menu_line_num] = text_
	menu_line_mode[menu_line_num] = mode_
	menu_line_var[menu_line_num] = var_
	if var1_ != -1 menu_line_var1[menu_line_num] = var1_
	menu_line_num++
}

function menu_draw(){
	
	wait_to_avoid_miss_click--
	if instance_exists(obj_ledit_message)
	{wait_to_avoid_miss_click = 1}
	
	// BACKGROUND
	
	if draw_back
	{
		draw_set_color(#0000FF)
		draw_set_alpha(.9)
		draw_rectangle(-1,-1,1000,1000,-1)
		draw_set_alpha(1)
	}
	
	// SETUP FONT

	draw_set_font(font_pause)
	draw_set_color(c_white)
	
	// DRAW TITLE
	
	draw_set_halign(fa_middle)
	draw_set_valign(fa_middle)
	
	draw_text(GAME_WIDTH/2,20,menu_name)
	
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	
	draw_set_color(c_white)
	var st_y = 40
	
	select_y = lerp(select_y,menu_pos*25,0.5)
	
	menu_y = clamp(-(select_y-st_y-GAME_HEIGHT/3),-(menu_line_num-1)*22,0)
	
	draw_rectangle(-1,st_y+select_y+menu_y,GAME_WIDTH,st_y+select_y+22+menu_y,0)
	
	var mov_y =  input_get(global.input_down,PRESSED)-input_get(global.input_up,PRESSED)
	if message_draw || wait_to_avoid_miss_click mov_y = 0
	menu_pos += mov_y
	
	if mov_y != 0
		audio_play_sound(sound_menubeep_1,999,0)
	
	if menu_pos < 0
	{menu_pos = menu_line_num-1}
	else if menu_pos >= menu_line_num
	{menu_pos = 0}

	if binding_key
	{
		wait_to_avoid_miss_click = 4
		binding_key_timer -= 1/60
		
		if binding_key_timer <= 0
		{
			binding_key = false 
			audio_play_sound(sound_menubeep_2,999,0)
			if binding_key_num != 0
			{
				menu_line_var[menu_pos,0+binding_key_num*2]=-1
				menu_line_var[menu_pos,1+binding_key_num*2]=-1
			}
		}
		
		if global.gamepad = -1
		{
			if keyboard_check_pressed(vk_anykey)
			{
				menu_line_var[menu_pos,0+binding_key_num*2]=KEY
				menu_line_var[menu_pos,1+binding_key_num*2]=keyboard_lastkey
				binding_key = false 
				audio_play_sound(sound_menubeep_2,999,0)
			}
			else if mouse_check_button_released(mb_any)
			{
				menu_line_var[menu_pos,0+binding_key_num*2]=MBT
				menu_line_var[menu_pos,1+binding_key_num*2]=mouse_lastbutton
				binding_key = false
				audio_play_sound(sound_menubeep_2,999,0)
			}
		}
		else
		{
			if input_gamepad_any()
			{
				menu_line_var[menu_pos,0+binding_key_num*2]=GMP
				menu_line_var[menu_pos,1+binding_key_num*2]=input_gamepad_any()
				binding_key = false 
				audio_play_sound(sound_menubeep_2,999,0)
			}
		}
	}
	else if wait_to_avoid_miss_click
	{}
	else if message_draw
	{
		if input_get(global.input_select,PRESSED)
		{
			message_draw = false 
			audio_play_sound(sound_menubeep_2,999,0)
		}
	}
	else
	{
		if input_get(global.input_pause,PRESSED)
		{
			event_user(0)
			audio_play_sound(sound_ui_menu_skip_01,999,0)
		}
		
		switch menu_line_mode[menu_pos]
		{
			case 0 : 
				if input_get(global.input_select,PRESSED)
				{
					audio_play_sound(sound_menubeep_2,999,0)
					variable_global_set(menu_line_var[menu_pos],!variable_global_get(menu_line_var[menu_pos]))
				}
			 break
			case 1 : 
				if input_get(global.input_select,PRESSED)
				{
					audio_play_sound(sound_menubeep_2,999,0)
					menu_line_var[menu_pos]() 
				}
			break
			case 2 :
				var mov_x = input_get(global.input_right,CHECK)-input_get(global.input_left,CHECK)
				if mov_x != 0
				{audio_play_sound(sound_changevolume_beep,999,0)} 
				var val_ = variable_global_get(menu_line_var[menu_pos])
				val_ += mov_x/100
				val_ = clamp(val_,0,1)
				variable_global_set(menu_line_var[menu_pos],val_) 
			break
			case 3 :
				var mov_x = input_get(global.input_right,PRESSED)-input_get(global.input_left,PRESSED)
				if mov_x != 0
				{audio_play_sound(sound_menubeep_1,999,0)}
				var val_ = variable_global_get(menu_line_var[menu_pos])
				val_ += mov_x
				val_ = clamp(val_,0,array_length(menu_line_var1[menu_pos])-1)
				variable_global_set(menu_line_var[menu_pos],val_)
			break
			case 4 :
				if input_get(global.input_select,PRESSED)
				{
					audio_play_sound(sound_menubeep_2,999,0)
					message_draw = true
				}
			break
			case 5 :
				if input_get(global.input_select,PRESSED)
				{
					binding_key_timer = 3
					audio_play_sound(sound_menubeep_2,999,0)
					binding_key = true
				}
				
				var mov_x = input_get(global.input_right,PRESSED)-input_get(global.input_left,PRESSED)
				if mov_x != 0
				{
					audio_play_sound(sound_menubeep_1,999,0)
					
					binding_key_num += mov_x
					if binding_key_num < 0 
						binding_key_num = 2
					else if binding_key_num > 2 
						binding_key_num = 0
				}
				
			break
			case 6 : 
			if input_get(global.input_select,PRESSED)
			{
				audio_play_sound(sound_menubeep_2,999,0)
				menu_line_var1[menu_pos]() 
			}
			break
		}
	}
	
	var i = 0
	repeat(menu_line_num)
	{
		var x_ = 40
		var y_ = st_y+i*25+menu_y
		
		if y_ >= st_y-1 && y_ <= GAME_HEIGHT*.9
		{
		
			if i = menu_pos
				draw_set_color(#0000FF)
			else
				draw_set_color(c_white)
		
			draw_text(x_,y_,menu_line_text[i])
			switch menu_line_mode[i]
			{
				case 0 : 
					draw_text(GAME_WIDTH/2,y_,":")
					draw_sprite_ext(spr_pausemenu_checkbox,variable_global_get(menu_line_var[i]),GAME_WIDTH/2+16,y_+2,
					1,1,0,draw_get_color(),1)
				break
				case 1 : 
				break
				case 2 : 
					draw_text(GAME_WIDTH/2,y_,":")
					draw_healthbar(GAME_WIDTH/2+20,y_+6,GAME_WIDTH/2+100,y_+18,variable_global_get(menu_line_var[i])*100,
					-1,draw_get_color(),draw_get_color(),0,0,0)
				break
				case 3 : 
					draw_text(GAME_WIDTH/2,y_,":")
					draw_text(GAME_WIDTH/2+20,y_,menu_line_var1[i,variable_global_get(menu_line_var[i])])
				break
				case 4 : 
				break
				case 5 : 
					draw_text(GAME_WIDTH/2,y_,":")
					var i__ = 0
					repeat(3)
					{
						var text_ = menu_line_var[i,1+i__*2]
						
						if i__ = binding_key_num && i = menu_pos
						{
							if text_ = -1
							{
								draw_text(GAME_WIDTH/2+20+90*i__,y_,"---")
								draw_line_width(GAME_WIDTH/2+20+90*i__,y_+20,GAME_WIDTH/2+20+90*i__+string_width("---"),y_+20,1)
							}
							else
								draw_sprite(input_get_sprite(text_),current_time/300,GAME_WIDTH/2+20+90*i__+17,y_+11)
						}
						else
						{
							if text_ = -1
								draw_text(GAME_WIDTH/2+20+90*i__,y_,"---")
							else
								draw_sprite(input_get_sprite(text_),0,GAME_WIDTH/2+20+90*i__+17,y_+11)
						}
						i__++
					}
					//binding_key_num
					
				break
				case 6 : 
					draw_text(GAME_WIDTH/2,y_,":")
					var val_ = variable_global_get(menu_line_var[i])
					draw_text(GAME_WIDTH/2+20,y_,val_)
				break
			}
		}
		i++
	}
	
	if binding_key
	{
		draw_set_halign(fa_middle)
		draw_set_valign(fa_middle)
		draw_set_color(#0000FF)
		draw_set_alpha(.8)
		var x_ = 50
		var y_ = 80
		draw_rectangle(-1+x_,-1+y_,GAME_WIDTH-x_,GAME_HEIGHT-y_,-1)
		draw_set_alpha(1)
		draw_set_color(c_white)
		draw_rectangle(-1+x_+1,-1+y_+1,GAME_WIDTH-x_-1,GAME_HEIGHT-y_-1,1)
		draw_text(GAME_WIDTH/2,GAME_HEIGHT/2-12,"Press ANY key \n"+string(floor(binding_key_timer)+1))

		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
	}
	else if message_draw
	{
		draw_set_halign(fa_right)
		draw_set_valign(fa_bottom)
		draw_set_color(#0000FF)
		draw_set_alpha(.8)
		draw_rectangle(-1+50,-1+50,GAME_WIDTH-50,GAME_HEIGHT-50,-1)
		draw_set_alpha(1)
		draw_set_color(c_white)
		draw_rectangle(-1+51,-1+51,GAME_WIDTH-51,GAME_HEIGHT-51,1)
		draw_text(GAME_WIDTH-55,GAME_HEIGHT-55,"CANCEL")
		
		draw_set_halign(fa_left)
		draw_set_valign(fa_top)
		draw_text(55,55,menu_line_var[menu_pos])
	}
	
}