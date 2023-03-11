if text_break
{
	typist.pause()
	text_break -= global.game_spd
	text_box_open_anim = 0
	if text_break <= 0
	{typist.unpause()}
	exit
}
else if text_box_open_anim_state = 0
{
	#region OPEN TEXT BOX
	
	text_box_open_anim = lerp(text_box_open_anim,1,.2)
	
	#endregion
}
else if text_box_open_anim_state = 1
{
	#region CLOSE TEXT BOX
	
	text_box_open_anim = lerp(text_box_open_anim,0,.2)
	
	if text_box_open_anim <= 0.05
	{
		
		if message_choice_num[message_index-1]<=0
		{
			if message_func[message_index-1] != -1 
				message_func[message_index-1]()
		}
		else
		{
			if choice_index != -1
			{
				if message_choice_func[message_index-1,choice_index] != -1
					message_choice_func[message_index-1,choice_index]()
				else
				if message_func[message_index-1] != -1 
					message_func[message_index-1]()
			}
			else
			{
				if message_choice_quick_func[message_index-1] != -1
					message_choice_quick_func[message_index-1]()
				else
				if message_func[message_index-1] != -1 
					message_func[message_index-1]()
			}
		}

		if message_index > message_max 
		{
			instance_destroy()
		}
		else
		{
			text_box_open_anim_state = 0
			typist.reset()
			typist.unpause()
			event_user(0)
			if text_break
				typist.pause()
		}
	}
	
	#endregion
}

typist.in(text_spd*global.game_spd,2)

if typist.get_state() < 1
{
	answer_time += waiting_answer_mult
	waiting_bef_switch = typist.get_state()*(1/waiting_answer_mult)
}
else
{
	waiting_bef_switch += (1/answer_time)*global.game_spd
	waiting_bef_switch = clamp(waiting_bef_switch,0,1)
}

if text_box_open_anim_state = 0
{
	if message_index<=message_max
	{
		if typist.get_state() < 1
		{
			quick_answer_appear_anim = lerp(quick_answer_appear_anim,1,.1)
			answer_appear_anim = 0
		}
		else
		{
			quick_answer_appear_anim = lerp(quick_answer_appear_anim,2,.1) 
			answer_appear_anim = lerp(answer_appear_anim,1,.1)
		}
	}
	
	if message_choice_num[message_index]>0
	{
		var old_choice_index = choice_index
		choice_index += input_get(global.input_down,PRESSED)-input_get(global.input_up,PRESSED)
		choice_index = clamp(choice_index,0,message_choice_num[message_index]-1)
	
		if choice_index != old_choice_index
		{
			audio_play_sound(sound_menubeep_1,999,0)
		}
	}
	
	if typist.get_state() < 1
	&& input_get(global.input_select,PRESSED)
	&& message_choice_num[message_index]<=0
	&& !auto_dialogue
	{
		answer_time = answer_time/typist.get_state()
		typist.skip()
	}
	else if (input_get(global.input_select,PRESSED) && (typist.get_state() = 1 
	|| (message_choice_num[message_index]>0 && (message_choice_quick_text[message_index] != -1)))
	&& !auto_dialogue)
	|| waiting_bef_switch >= 1
	{
		if message_choice_num[message_index]>0
		{
			if typist.get_state() < 1
			{
				choice_index = -1
				audio_play_sound(choose(sound_ui_dialogue_shatter_01,sound_ui_dialogue_shatter_02),999,0)
			}
			else
			{
				audio_play_sound(sound_menubeep_1,999,0)
			}
		}
		quick_answer_appear_anim = 0
		answer_appear_anim = 0
		text_box_open_anim_state = 1
		message_index++
		typist.reset()
		typist.pause()
	}
}