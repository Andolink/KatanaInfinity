function text_receptionist_shut_up(){ #region
	dialogue_init()
	text_x = obj_receptionist.x text_y = obj_receptionist.y-32
	audio_play_sound(sound_receptionist_backtobook,999,0)
	dialogue_add_line("Not before you give me the name of your reservation!",
		function(){
			obj_receptionist.sprite_index = spr_receptionist_angry 
			obj_receptionist.image_speed = 1
			audio_play_sound(sound_receptionist_angry,999,0)
			},,,
		function(){ #region CHOICES
			dialogue_add_quick_choice("Shut up!")
			dialogue_add_choice("Shut up!")
			dialogue_add_choice("My costume ? It's cosplay.",text_receptionist_cosplay)
			dialogue_add_choice("My costume ? It's a bathrobe.",text_receptionist_bath)
	})#endregion

	dialogue_add_line("[c_red][shake]How dare you!!!",
	function(){
		obj_receptionist.sprite_index = spr_receptionist_stand 
		obj_receptionist.image_speed = 1
		audio_play_sound(sound_receptionist_bookslam,999,0)
		},,,
		function(){ #region CHOICES
			dialogue_add_quick_choice("Shut up!")
			dialogue_add_choice("Shut up!")
			dialogue_add_choice("My costume ? It's cosplay.",text_receptionist_cosplay)
			dialogue_add_choice("My costume ? It's a bathrobe.",text_receptionist_bath)
	})#endregion

	dialogue_add_line("[c_red][shake]That's enough![/shake] This is not the time for this.\n[shake]Get out of my sight![/shake]",
	function(){obj_receptionist.cutsc=2 obj_receptionist_infinity.cutscene = false})
}#endregion
	
function text_receptionist_cosplay(){ #region
	dialogue_init()
	text_x = obj_receptionist.x text_y = obj_receptionist.y-32
	with obj_receptionist 
	{sprite_index = spr_receptionist_lookup image_index = image_number-.5 image_speed = 0}
	audio_play_sound(sound_receptionist_wow,999,0)
	dialogue_add_line("Oh, I love anime ! Who are you cosplaying ?",,,,
		function(){ #region CHOICES
			dialogue_add_choice("Schneck",function() { #region
					dialogue_add_line("[wave][rainbow]So cute![/wave][/rainbow] My twin and I are big Schneck fan!",
					function() {text_x = obj_receptionist.x text_y = obj_receptionist.y-32})
					dialogue_add_line("Have a good day, my little Schneck ;)",
					function(){obj_receptionist.cutsc=2 obj_receptionist_infinity.cutscene = false})
			})#endregion
			dialogue_add_choice("It's pretty obvious, Shinju Sakamura, in Ex Vs X - Sakura reDUX 2.", function() {#region
				dialogue_init()
				text_x = obj_receptionist.x text_y = obj_receptionist.y-32
				dialogue_add_line("[wave]Cool ![/wave] [shake]I don't know this anime[/shake] - what's it about ?",,,,
				function(){ #region
					dialogue_add_choice("Spinning tops in a battle arena.",function(){ #region
						dialogue_add_line("I must present you to my [c_red]twin[/c],\nshe would like to see you spinning like a spinning toy [wave][rainbow];)[/wave][/rainbow]")
						dialogue_add_line("[wave]Have a good day![/wave]",
						function(){obj_receptionist.cutsc=2 obj_receptionist_infinity.cutscene = false})
					})#endregion
					dialogue_add_choice("Childrens card games in a cyberpunk dystopia.",function(){ #region
						audio_play_sound(sound_receptionist_wow,999,0)
						dialogue_add_line("[wave][rainbow]Wow ![/wave][/rainbow] My [c_red]twin[/c] loves card games !\nAnd cyberpunk dystopian worlds !")
						dialogue_add_line("I must present you to [c_red]her[/c]!")
						dialogue_add_line("[wave]Have a good day![/wave]",
						function(){
							obj_receptionist.cutsc=2 
							obj_receptionist_infinity.cutscene = false
							sprite_index = spr_receptionist_lookdown image_index = 0
							audio_play_sound(sound_receptionist_backtobook,999,0)
						})
					})#endregion
				})#endregion
			})	#endregion
	})#endregion	
}#endregion

function text_receptionist_bath(){ #region
	dialogue_init()
	with obj_receptionist 
	{sprite_index = spr_receptionist_lookup image_index = image_number-.5 image_speed = 0}
	text_x = obj_receptionist.x text_y = obj_receptionist.y-32
	dialogue_add_line("You need to take a shower ?",,,,
		function(){ #region CHOICES
			dialogue_add_choice("Mind your own business !",function() { #region
				dialogue_add_line("[scale,.8]I didn't want to upset you[/scale]. Let's talk about something else.",,,,
				function() { #region
					dialogue_add_quick_choice("Shut up!!!",text_receptionist_shut_up)
					dialogue_add_choice("Shut up!!!",text_receptionist_shut_up)
					dialogue_add_choice("My costume ? It's cosplay.",text_receptionist_cosplay)
				}) #endregion
			})#endregion
			dialogue_add_choice("Sure, if you come with me.", function() {#region
				dialogue_init()
				text_x = obj_receptionist.x text_y = obj_receptionist.y-32
				audio_play_sound(sound_receptionist_wow,999,0)
				dialogue_add_line("[shake]Oh...[/shake]",
				function(){obj_receptionist.cutsc=2 obj_receptionist_infinity.cutscene = false obj_receptionist.sprite_index = spr_receptionist_shy})
			})	#endregion
	})#endregion
} #endregion