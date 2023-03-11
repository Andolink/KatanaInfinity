textbox = instance_create_depth(0,0,0,obj_talk)

with textbox
{
	dialogue_init()
	text_x = obj_receptionist.x text_y = obj_receptionist.y-32
	
	dialogue_add_line("Hi, how can I help you?",,,,
		function(){ #region CHOICES
			dialogue_add_quick_choice("Could I please go?",text_receptionist_shut_up)
			dialogue_add_choice("Could I please go?",text_receptionist_shut_up)
			dialogue_add_choice("...")
			dialogue_add_choice("I'll just be on my way.")
		}	
	)#endregion
	
	dialogue_add_line("[wave][rainbow]Wow[/wave][/rainbow] !!! Your outfit looks [shake]SO[/shake] [rainbow]interesting[/rainbow]!",,,,
		function(){ #region CHOICES
			dialogue_add_quick_choice("Could I please go?",text_receptionist_shut_up)
			dialogue_add_choice("Could I please go?",text_receptionist_shut_up)
			dialogue_add_choice("It's called cosplay.",text_receptionist_cosplay)
			dialogue_add_choice("It's a bathrobe.",text_receptionist_bath)
		}	
	)#endregion
}

