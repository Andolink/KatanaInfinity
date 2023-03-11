#macro text_angry_effect "[sound_ui_dialogue_emphasis_01]"



function dialogue_init(spd_=.5,auto_=false) { #region
	auto_dialogue = auto_
	text_spd = spd_
	
	quick_answer_appear_anim	= 0
	answer_appear_anim			= 0
	
	message_index = 0
	message_max = -1
	
	text_box_open_anim			= 0
	text_box_open_anim_state	= 0
	
	waiting_bef_switch			= 0
	
	choice_num = 0
	choice_index = 0
	
	text_break = 0

	answer_time = 0
	
	text_x = x
	text_y = y
}#endregion

function dialogue_add_line(text_,func_=-1,answer_mult=5,spd_=-1,choice_init_=-1) { #region
	message_max ++
	message				[message_max]=text_
	message_func		[message_max]=func_
	message_amul		[message_max]=answer_mult
	message_choice_num	[message_max]=0
	
	message_choice_quick_text[message_max]=-1
	
	if choice_init_ = -1
	{
		message_choice_num[message_max]=-1
	}
	else
	{
		choice_init_()
	}
	
	if spd_ != -1
		message_spd	[message_max]=spd_
	else
		message_spd	[message_max]=text_spd
		
	if message_max = 0
	{event_user(0)}
	
}#endregion

function dialogue_add_quick_choice(text_,func_=-1) { #region
	message_choice_quick_text[message_max]=text_
	message_choice_quick_func[message_max]=func_
}#endregion

function dialogue_add_choice(text_,func_=-1) { #region
	message_choice_num[message_max] ++
	message_choice_text[message_max,message_choice_num[message_max]-1]=text_
	message_choice_func[message_max,message_choice_num[message_max]-1]=func_
}#endregion