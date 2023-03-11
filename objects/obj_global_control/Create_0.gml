#region Define #MACROS

	#macro EDITOR_FOLDER ""

	#macro GAME_WIDTH	720
	#macro GAME_HEIGHT	405
	
	#macro KEY			keyboard_check
	#macro KEY_PRS		keyboard_check_pressed
	#macro KEY_RLS		keyboard_check_released
	
	#macro GMP			gamepad_button_check
	#macro GMP_PRS		gamepad_button_check_pressed
	#macro GMP_RLS		gamepad_button_check_released
	#macro GMP_JOY		gamepad_axis_value
	
	#macro MBT			mouse_check_button
	#macro MBT_PRS		mouse_check_button_pressed
	#macro MBT_RLS		mouse_check_button_released

#endregion

global.game_spd		= 1
global.slow_motion	= 1
global.enemy_count  = 0
global.cutscene_id	= ""
global.difficulty	= 1
global.speedrun_mode= 0
global.zero_sword	= sword_normal

randomize()
surface_depth_disable(true)

control_load()
option_load()
input_init()

instance_create_depth(0,0,0,obj_camera)
instance_create_depth(0,0,0,obj_music_control)
instance_create_depth(0,0,0,obj_infinity_manager)

room_goto(rm_main_menu)