textbox = instance_create_depth(x,y,depth,obj_talk)

with textbox
{
	dialogue_init()
	text_x = obj_cuts_infinity_wash.x text_y = obj_cuts_infinity_wash.y-32
	dialogue_add_line("You could do the [c_yellow]chores[/c] sometimes you know.")
	dialogue_add_line("Without [c_yellow]me[/c], this house would be a [c_red][shake]complete mess[/shake][/c].",,,,function(){
		dialogue_add_choice("Okay I'll clean this katana.",function(){
			dialogue_init()
			text_x = obj_cuts_infinity_wash.x text_y = obj_cuts_infinity_wash.y-32
			audio_play_sound(sound_player_roll,999,0)
			obj_cuts_zero_situ.sprite_index = spr_player_nosword_roll
			obj_cuts_zero_situ.image_index	= 0
			obj_cuts_zero_situ.hspd			= 8
			obj_cuts_zero_situ.y			+= 8	
			dialogue_add_line("[c_red][shake]"+text_angry_effect+"DON'T "+text_angry_effect+"TOUCH "+text_angry_effect+"IT!!![/shake][/c]\nBe careful not to drop your dumbbell on [c_yellow]my katana[/c].")
			dialogue_add_line("It's [c_red][pulse]all[/pulse][/c] I have left of my memories as a [c_fuchsia]NULL[/c].",,,,function(){
				dialogue_add_choice("I never had the chance to try it.")
			})
			dialogue_add_line("[wave]Ah ah ah ah...[/wave] You'll have to get over\n my [c_red]dead body[/c] if you want to use it.",function(){
				with obj_door_knock 
				{image_speed = 1} text_break = 120
			})
			dialogue_add_line("Finally, [shake][c_yellow]HE[/c][/shake]'s here.",function(){
				obj_cuts_zero_situ.alarm[1]=10
			})
		})
		dialogue_add_choice("I'm busy right now",function(){
			dialogue_init()
			global.zero_infinity_relation -= 1
			audio_play_sound(sound_player_roll,999,0)
			text_x = obj_cuts_infinity_wash.x text_y = obj_cuts_infinity_wash.y-32
			obj_cuts_zero_situ.sprite_index = spr_player_nosword_roll
			obj_cuts_zero_situ.image_index	= 0
			obj_cuts_zero_situ.hspd			= 8
			obj_cuts_zero_situ.y			+= 8	
			dialogue_add_line("...")
			dialogue_add_line("[c_red][shake]"+text_angry_effect+"HEY "+text_angry_effect+"ASSHOLE "+text_angry_effect+"DON'T "+text_angry_effect+"TOUCH "+text_angry_effect+"MY "+text_angry_effect+"KATANA!![/c][/shake]")
			
			dialogue_add_line("It's "+text_angry_effect+"[c_red][shake]ALL[/c][shake] I have left of my memories as a [c_fuchsia]NULL[/c].",,,,function(){
				dialogue_add_choice("I don't care")
			})
			dialogue_add_line("If you want to use it...",,,.2)
			dialogue_add_line("[c_red][shake]You'll have to get over my dead body.",function(){
				with obj_door_knock 
				{image_speed = 1} text_break = 120
			},,.2)
			dialogue_add_line("[shake]Huh ...[/shake] [shake][c_yellow]HE[/c][/shake]'s finally here.",function(){
				obj_cuts_zero_situ.alarm[1]=10
			})
		})
	})
}
