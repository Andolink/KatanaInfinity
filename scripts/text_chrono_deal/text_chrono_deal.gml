function text_chrono_deal_main(){
	dialogue_init()
	obj_cuts_zero_tv_chronodeal1.sprite_index = spr_cuts_zero_look_at_infi
	obj_cuts_zero_tv_chronodeal1.image_index = 0
	obj_cuts_infinity_chronodeal1.sprite_index = spr_cuts_infi_read_letter
	obj_cuts_infinity_chronodeal1.image_index = 0
	text_x = obj_cuts_infinity_chronodeal1.x text_y = obj_cuts_infinity_chronodeal1.y-32
	dialogue_add_line("[slant]'Your skills can be of use to us.'")	
	dialogue_add_line("[slant]'If you want some chronos,\nmeet me tomorrow at LAB n5'")
	dialogue_add_line("-Doctor [pulse][c_yellow]LECTER[/c][/pulse]",,,,function(){
		dialogue_add_choice("Let's not waste anymore time. Let's go!",function(){
			global.zero_infinity_relation -= .5
			obj_cuts_infinity_chronodeal1.sprite_index = spr_cuts_infi_read_letter_look_zero
			obj_cuts_infinity_chronodeal1.image_index = 0
			dialogue_init()
			text_x = obj_cuts_infinity_chronodeal1.x text_y = obj_cuts_infinity_chronodeal1.y-32
			dialogue_add_line("Since when do [c_yellow][shake]you[/shake][/c] give [c_yellow][shake]me[/shake][/c] [pulse][c_red]orders[/c][/pulse]?")
			dialogue_add_line("[shake][c_red]We'll take them by surprise...")
			dialogue_add_line("[shake][c_red]and steal all the [c_aqua]CHRONOS[c_red] we can. [pulse]NOW[/pulse]!",function(){
			obj_cuts_infinity_chronodeal1.sprite_index = spr_cuts_infi_read_letter
			obj_cuts_infinity_chronodeal1.image_index = 0})
			dialogue_add_line("[slant][c_red]'meet me tomorrow at LAB n5'...",function()
			{obj_cuts_zero_tv_chronodeal1.state = 1})
		})
		dialogue_add_choice("Maybe we should accept his offer.",function(){
			dialogue_init()	
			obj_cuts_infinity_chronodeal1.sprite_index = spr_cuts_infi_read_letter_look_zero
			obj_cuts_infinity_chronodeal1.image_index = 0
			text_x = obj_cuts_infinity_chronodeal1.x text_y = obj_cuts_infinity_chronodeal1.y-32
			dialogue_add_line("I've a better [c_yellow][wave]plan[/wave][/c]...\nLet's take them by surprise.")
			dialogue_add_line("We are going to steal\nall the [c_aqua]CHRONOS[/c] ... [c_red][pulse]NOW[/pulse][/c]!",function(){
			obj_cuts_infinity_chronodeal1.sprite_index = spr_cuts_infi_read_letter
			obj_cuts_infinity_chronodeal1.image_index = 0})
			dialogue_add_line("[slant]'meet me tomorrow at LAB n5'...",function()
			{obj_cuts_zero_tv_chronodeal1.state = 1})
		})
	})
}