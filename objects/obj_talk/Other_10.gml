scribble_font_set_default(global.font_text_name)

var tx_ = message[message_index]

text =	scribble(tx_)
		.align(fa_left,fa_left)
		.blend(c_white,1)

typist = scribble_typist()
typist.in(.5,2)
typist.ease(SCRIBBLE_EASE.QUART,2,2,1,1,0,1)
typist.character_delay_add(",", 200)
typist.character_delay_add(".", 300)
typist.character_delay_add("!", 300)
typist.character_delay_add("?", 300)
typist.sound(sound_npc_dialogue_therapistphone_01, 0, 1, 1)

text_width = text.get_width()
text_height = text.get_height()

text.wrap(text_width)

typist.in(text_spd,2)

text_width += 6
text_height += 4

waiting_answer_mult	= message_amul[message_index]
waiting_bef_switch = 0
answer_time = 0

quick_answer_appear_anim = 0
answer_appear_anim = 0