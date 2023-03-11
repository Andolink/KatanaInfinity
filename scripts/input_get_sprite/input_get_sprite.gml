function input_get_sprite(key_id){
	var spr_ = spr_keyboard_generic
	switch(key_id)
	{
		case ord("A") : spr_ = spr_keyboard_a break
		case ord("Z") : spr_ = spr_keyboard_z break
		case ord("E") : spr_ = spr_keyboard_e break
		case ord("R") : spr_ = spr_keyboard_r break
		case ord("T") : spr_ = spr_keyboard_t break
		case ord("Y") : spr_ = spr_keyboard_y break
		case ord("U") : spr_ = spr_keyboard_u break
		case ord("I") : spr_ = spr_keyboard_i break
		case ord("O") : spr_ = spr_keyboard_o break
		case ord("P") : spr_ = spr_keyboard_p break
		case ord("Q") : spr_ = spr_keyboard_q break
		case ord("S") : spr_ = spr_keyboard_s break
		case ord("D") : spr_ = spr_keyboard_d break
		case ord("F") : spr_ = spr_keyboard_f break
		case ord("G") : spr_ = spr_keyboard_g break
		case ord("H") : spr_ = spr_keyboard_h break
		case ord("J") : spr_ = spr_keyboard_j break
		case ord("K") : spr_ = spr_keyboard_k break
		case ord("L") : spr_ = spr_keyboard_l break
		case ord("M") : spr_ = spr_keyboard_m break
		case ord("W") : spr_ = spr_keyboard_w break
		case ord("X") : spr_ = spr_keyboard_x break
		case ord("C") : spr_ = spr_keyboard_c break
		case ord("V") : spr_ = spr_keyboard_v break
		case ord("B") : spr_ = spr_keyboard_b break
		case ord("N") : spr_ = spr_keyboard_n break
		
		case ord(",") : spr_ = spr_keyboard_comma break
		case ord(";") : spr_ = spr_keyboard_semicolon break
		//case ord(":") : spr_ = spr_keyboard_ break
		//case ord("!") : spr_ = spr_keyboard_ break
		case ord("=") : spr_ = spr_keyboard_equals break
		case ord("+") : spr_ = spr_keyboard_plus break
		//case ord("-") : spr_ = spr_keyboard_minus break
		case ord("[") : spr_ = spr_keyboard_openbracket break
		case ord("]") : spr_ = spr_keyboard_closedbracket break
		//case ord("\""): spr_ = spr_keyboard_backslash break
		case ord("/") : spr_ = spr_keyboard_slash break
		//case ord("'") : spr_ = spr_keyboard_apostrophe break
		
		case vk_left		: spr_ = spr_keyboard_left break
		case vk_right		: spr_ = spr_keyboard_right break
		case vk_up			: spr_ = spr_keyboard_up break
		case vk_down		: spr_ = spr_keyboard_down break
		case vk_enter		: spr_ = spr_keyboard_enter break
		case vk_escape		: spr_ = spr_keyboard_esc break
		case vk_space		: spr_ = spr_keyboard_sp break
		case vk_shift		: spr_ = spr_keyboard_shift break
		case vk_control		: spr_ = spr_keyboard_ctrl break
		case vk_alt			: spr_ = spr_keyboard_alt break
		case vk_backspace	: spr_ = spr_keyboard_backsp break
		case vk_tab			: spr_ = spr_keyboard_tab break
		case vk_home		: spr_ = spr_keyboard_home break
		case vk_end			: spr_ = spr_keyboard_end break
		case vk_delete		: spr_ = spr_keyboard_del break
		case vk_insert		: spr_ = spr_keyboard_ins break
		case vk_pageup		: spr_ = spr_keyboard_pgup break
		case vk_pagedown	: spr_ = spr_keyboard_pgdn break
		//case vk_pause		: spr_ = spr_keyboard_pause break
		//case vk_printscreen: spr_ = spr_keyboard_print break
		case vk_numpad0		: spr_ = spr_keyboard_0 break
		case vk_numpad1		: spr_ = spr_keyboard_1 break
		case vk_numpad2		: spr_ = spr_keyboard_2 break
		case vk_numpad3		: spr_ = spr_keyboard_3 break
		case vk_numpad4		: spr_ = spr_keyboard_4 break
		case vk_numpad5		: spr_ = spr_keyboard_5 break
		case vk_numpad6		: spr_ = spr_keyboard_6 break
		case vk_numpad7		: spr_ = spr_keyboard_7 break
		case vk_numpad8		: spr_ = spr_keyboard_8 break
		case vk_numpad9		: spr_ = spr_keyboard_9 break
		//case vk_multiply	: spr_ = spr_keyboard_mult break
		//case vk_divide	: spr_ = spr_keyboard_div break
		case vk_add			: spr_ = spr_keyboard_plus break
		case vk_subtract	: spr_ = spr_keyboard_minus break
		//case vk_decimal	: spr_ = spr_keyboard_dec break
		
		case gp_face1		: spr_ = spr_xbox_a break	//"A"
		case gp_face2		: spr_ = spr_xbox_b break	//"B"
		case gp_face3		: spr_ = spr_xbox_x break	//"X"
		case gp_face4		: spr_ = spr_xbox_y break	//"Y"
		case gp_shoulderl	: spr_ = spr_xbox_lb break
		case gp_shoulderlb	: spr_ = spr_xbox_lt break
		case gp_shoulderr	: spr_ = spr_xbox_rb break
		case gp_shoulderrb	: spr_ = spr_xbox_rt break
		case gp_select		: spr_ = spr_xbox_select break
		case gp_start		: spr_ = spr_xbox_start break
		case gp_stickl		: spr_ = spr_xbox_l3 break
		case gp_stickr		: spr_ = spr_xbox_r3 break
		case gp_padu		: spr_ = spr_xbox_dpad_up_static break
		case gp_padd		: spr_ = spr_xbox_dpad_down_static break
		case gp_padl		: spr_ = spr_xbox_dpad_left_static break
		case gp_padr		: spr_ = spr_xbox_dpad_right_static break
		
		case mb_left		: spr_ = spr_left_click break
		case mb_right		: spr_ = spr_right_click break
		case mb_middle		: spr_ = spr_middle_click break
	}
	
	return spr_
}