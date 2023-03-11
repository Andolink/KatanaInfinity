

function text_sword_clash_go_back_to_main(){
	dialogue_init()
	text_x = obj_cuts_infinity_clash.x text_y = obj_cuts_infinity_clash.y-32
	dialogue_add_line("For the moment...\nwe still depend on [c_yellow]LECTER's assistant[/c]...")
	dialogue_add_line("What if he decides to raise the [c_yellow]prices[/c]?\nWhat if he gets [c_red]caught[/c]?",,,,function(){
		dialogue_add_choice("We will advise if it happens.",function(){
			dialogue_init()
			global.zero_infinity_relation -= 1
			text_x = obj_cuts_infinity_clash.x text_y = obj_cuts_infinity_clash.y-32
			dialogue_add_line("You are [shake]SO[/shake] naive.",function(){
				with obj_door_knock 
				{image_speed = 1} text_break = 120
			})
			dialogue_add_line("Speaking of the [c_yellow]devil[/c]. [shake]Go open it.[/shake]",function(){
				obj_cuts_zero_clash.alarm[1]=10
			})
		})
		dialogue_add_choice("If he cares about his own life, I suggest he stays cautious.",function(){
			dialogue_init()
			global.zero_infinity_relation += 1.25
			text_x = obj_cuts_infinity_clash.x text_y = obj_cuts_infinity_clash.y-32
			dialogue_add_line("[wave]Ah ah![/wave] Exactly.",function(){
				with obj_door_knock 
				{image_speed = 1} text_break = 120
			})
			dialogue_add_line("Speaking of the [c_yellow]devil[/c]. Go open it.",function(){
				obj_cuts_zero_clash.alarm[1]=10
			})
		})
	})
}
