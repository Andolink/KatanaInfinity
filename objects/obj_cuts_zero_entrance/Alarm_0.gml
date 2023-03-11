textbox = instance_create_depth(0,0,0,obj_talk)

with textbox
{
	dialogue_init()
	text_x = obj_cuts_infinity_entrance.x text_y = obj_cuts_infinity_entrance.y-30
	
	dialogue_add_line("This is the place.")
	dialogue_add_line("I'll start with the first [c_yellow]floor[/c],\nyou take the [c_yellow]roof[/c].",,,,
		function(){  #region CHOICES 
			dialogue_add_quick_choice("Why are you the one who always decides?",
			function(){
				dialogue_init()
				text_x = obj_cuts_infinity_entrance.x text_y = obj_cuts_infinity_entrance.y-30
				dialogue_add_line("No time for [shake]this[/shake]. Let's go!",
				function(){obj_cuts_zero_entrance.state = 1 global.zero_infinity_relation -= 2})
			})
			
			dialogue_add_choice("Why are you the one who always decides?",
			function(){
				dialogue_init()
				text_x = obj_cuts_infinity_entrance.x text_y = obj_cuts_infinity_entrance.y-30
				dialogue_add_line("No time for this. Let's go!",
				function(){obj_cuts_zero_entrance.state = 1 global.zero_infinity_relation -= 1})
			})
			
			dialogue_add_choice("All Right.",
			function(){
				dialogue_init()
				text_x = obj_cuts_infinity_entrance.x text_y = obj_cuts_infinity_entrance.y-30
				dialogue_add_line("Let's go!",
				function(){obj_cuts_zero_entrance.state = 1 global.zero_infinity_relation += 1})
			}) #endregion
		}
	)
	event_user(0)
}