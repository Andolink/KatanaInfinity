if !start
{
	visible_text = 0
	
	pos = lerp(pos,1,0.05)
	text_y_dec = lerp(text_y_dec,0,0.05)
	
	wait_to_avoid_miss_click--
	
	if input_get(global.input_select,PRESSED) && !wait_to_avoid_miss_click
	{
		audio_play_sound(sound_menubeep_2,999,0)
		start = true
	}
	
	var mov_y = input_get(global.input_down,PRESSED)-input_get(global.input_up,PRESSED)
	
	if mov_y != 0
	{
		text_glow = 0
		audio_play_sound(sound_menubeep_1,999,0)
		menu_index += mov_y
		if menu_index > 5
		{menu_index = 0}
		else if menu_index < 0
		{menu_index = 5}
	}
}
else if start_timer < 60
{
	visible_text ++
	if visible_text = 6
	{visible_text = 0}
	
	if menu_index = 0 || menu_index = 1
		pos += pos*.02
	
	if menu_index = 5
		pos -= pos*.02
	
	start_timer ++
		start_timer ++
	if start_timer = 60
	{
		visible_text = 5
		switch menu_index
		{
			case 0 : #region NEW GAME
				audio_sound_gain(ambiance,0,500)
				audio_sound_gain(sfx,0,500)
				
				with instance_create_depth(x,y,0,obj_hud_transition)
				{
					func_transition = function()
					{
						with obj_title_screen event_user(0)
						audio_stop_sound(sound_ambience_rain_title_01)
						room_goto(rm_cutscene_intro)
					}
				}
			#endregion
			break
			case 1 : #region CONTINUE
			audio_sound_gain(ambiance,0,500)
				audio_sound_gain(sfx,0,500)
				
				with instance_create_depth(x,y,0,obj_hud_transition)
				{
					func_transition = function()
					{
						with obj_title_screen event_user(0)
						audio_stop_sound(sound_ambience_rain_title_01)
						load()
						room_goto(global.starting_room)
					}
				}
			#endregion
			break
			case 2 : #region SPEEDRUN
				instance_create_depth(0,0,0,obj_speedrun_menu)
			#endregion
			break
			case 3 : #region LEVEL EDITOR
				instance_create_depth(0,0,0,obj_leveleditor_menu)
			#endregion
			break
			case 4 : #region OPTION
				instance_create_depth(0,0,0,obj_option_menu)
			#endregion
			break
			case 5 : #region EXIT
				game_end()
			#endregion
			break
		}
	}
}

#region BACKGROUND ANIMATION

title_glow += 4
if title_glow > 360
{title_glow -= 360}

title_plant_img += 0.25
if title_plant_img > sprite_get_number(spr_title_plants)
	title_plant_img = 0
	
#endregion