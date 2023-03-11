textbox = instance_create_depth(x,y,depth,obj_talk)

camera_state = 1

with textbox
{
	dialogue_init()
	text_x = obj_cuts_infinity_clash.x text_y = obj_cuts_infinity_clash.y-32
	dialogue_add_line("Sometimes[delay,50] I miss the [c_yellow]army[/c].")
	dialogue_add_line("Of course[delay,30] not the [c_red]mass killings and the [c_red]war crimes[/c]...")
	dialogue_add_line("... but the [c_aqua][wave]adrenaline[/c][/wave], that [c_red][shake]feeling of power[/shake][/c].")
	dialogue_add_line("What do [c_yellow]you[/c] think about that?",,,,function(){#region
		dialogue_add_choice("Yes, I sometimes ask myself.",function(){#region
			global.zero_infinity_relation += 1
			dialogue_init()
			text_x = obj_cuts_infinity_clash.x text_y = obj_cuts_infinity_clash.y-32
			dialogue_add_line("We could become [c_yellow]hitmans[/c].",text_sword_clash_go_back_to_main)
		})#endregion
		dialogue_add_choice("I will never be a mindless soldier again.",function(){#region
			dialogue_init()
			global.zero_infinity_relation -= .5
			text_x = obj_cuts_infinity_clash.x text_y = obj_cuts_infinity_clash.y-32
			dialogue_add_line("Forget it,\nwe [shake]can't[/shake] have those kind of discussions with [shake]you[/shake].",text_sword_clash_go_back_to_main)
		})#endregion
	})#endregion
		
	
}