textbox = instance_create_depth(x,y,depth,obj_talk)

with textbox
{
	dialogue_init()
	text_x = obj_cuts_infinity_tv.x+4 text_y = obj_cuts_infinity_tv.y-25
	dialogue_add_line("So, [wave]how's the anime[/wave] ?",,,,function(){#region
		dialogue_add_quick_choice("Complete garbage.", function(){ #region
			dialogue_init()
			global.zero_infinity_relation -= 2
			text_x = obj_cuts_infinity_tv.x+4 text_y = obj_cuts_infinity_tv.y-25
			dialogue_add_line("...")
			dialogue_add_line("[shake]You[/shake] are the one who made [shake]me[/shake] choose the anime!", function(){
				with obj_door_knock 
				{image_speed = 1} text_break = 120
			}
			,,,function(){ #region
				dialogue_add_quick_choice("Shut up!")
				dialogue_add_choice("Shut up!")
				dialogue_add_choice("...")
			})#endregion
			
			dialogue_add_line("[shake]Open it![/shake] It's our [c_aqua]delivery[/c].",function(){obj_cuts_zero_tv.state = 1})
		})#endregion
		dialogue_add_choice("I'm not a big fan...", function() { #region
			dialogue_init()
			text_x = obj_cuts_infinity_tv.x+4 text_y = obj_cuts_infinity_tv.y-25
			dialogue_add_line("Sorry...\nAt least there are some samurais...",function(){
				with obj_door_knock 
				{image_speed = 1} text_break = 120
			})
			
			dialogue_add_line("[wave]Oh![/wave] It's our [c_aqua]delivery[/c].",function(){obj_cuts_zero_tv.state = 1})
		})#endregion
		dialogue_add_choice("I love samurai films.",function() { #region
			dialogue_init()
			global.zero_infinity_relation += 2
			text_x = obj_cuts_infinity_tv.x+4 text_y = obj_cuts_infinity_tv.y-25
			dialogue_add_line("It's [pulse][c_red]Ex Vs X - Sakura reDUX 2[/c][/pulse], a masterpiece!",function(){
				with obj_door_knock 
				{image_speed = 1} text_break = 120
			})
			
			dialogue_add_line("[wave]Oh![/wave] It's our [c_aqua]delivery[/c].",function(){obj_cuts_zero_tv.state = 1})
		})#endregion
	})#endregion
	
}