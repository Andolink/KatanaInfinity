if instance_exists(obj_player) && !free_mode
{
	#region PLAYER CAMERA
	
	var final_pos_x = obj_player.x
	var final_pos_y = obj_player.y

	var i = .15
	if input_get(global.input_walk,CHECK,obj_player.cutscene)
		i = .4
	
	if global.gamepad != -1
	{
		var dir_ = point_direction(0,0,GMP_JOY(global.gamepad,gp_axisrh),GMP_JOY(global.gamepad,gp_axislv))
		var dist_ = point_distance(0,0,GMP_JOY(global.gamepad,gp_axisrh),GMP_JOY(global.gamepad,gp_axislv))
		var x_ = obj_player.x+lengthdir_x(dist_,dir_)*200
		var y_ = obj_player.y+lengthdir_y(dist_,dir_)*200
	}
	else
	{
		x_ = mouse_x y_ = mouse_y
	}
	
	final_pos_x = lerp(final_pos_x,x_,i)
	final_pos_y = lerp(final_pos_y,y_,i)

	x = lerp(x,final_pos_x,.25)
	y = lerp(y,final_pos_y,.25)
	
	apply_room_border = true
	
	#endregion
}
else if instance_exists(obj_particule_editor)
{
	x = 0
	y = 0
}
else if instance_exists(obj_level_editor)
{
	#region LEVEL EDITOR CAMERA
	
	var wheel = mouse_wheel_down()-mouse_wheel_up()
	
	if wheel != 0 && !obj_level_editor.mouse_on_gui
	{
		if KEY(vk_control)
		{s_editor_tar += wheel*s_editor_tar*(.1+keyboard_check(vk_shift)*.25)}
		else
		if KEY(vk_shift)
		{x_editor_tar += (wheel*s_editor_tar *16)}
		else
		{y_editor_tar += (wheel*s_editor_tar *16)}
	}
	else
	{
		x_editor_tar	+= ((KEY(vk_right)-KEY(vk_left))*s_editor_tar *(2+keyboard_check(vk_shift)*6))
		y_editor_tar	+= ((KEY(vk_down )-KEY(vk_up  ))*s_editor_tar *(2+keyboard_check(vk_shift)*6))
	}
	
	if MBT_PRS(mb_middle)
	{
		window_mouse_set(window_get_width() / 2, window_get_height() / 2);
	}
	
	if MBT(mb_middle) && !obj_level_editor.mouse_on_gui
	{
		x_editor_tar += (x-mouse_x)/2
		y_editor_tar += (y-mouse_y)/2
		window_mouse_set(window_get_width() / 2, window_get_height() / 2);
	}
	
	x			= lerp(x,x_editor_tar,.4)
	y			= lerp(y,y_editor_tar,.4)
	camera_size = lerp(camera_size,s_editor_tar,.4)
	
	apply_room_border = false
	
	#endregion
}
else if instance_exists(obj_lvl_pack_manager)
{
	#region LVLPACK EDITOR CAMERA
	
	var wheel = mouse_wheel_down()-mouse_wheel_up()
	
	if wheel != 0
	{
		if KEY(vk_control)
		{s_editor_tar += wheel*s_editor_tar*(.1+keyboard_check(vk_shift)*.25)}
		else
		if KEY(vk_shift)
		{x_editor_tar += (wheel*s_editor_tar *16)}
		else
		{y_editor_tar += (wheel*s_editor_tar *16)}
	}
	else
	{
		x_editor_tar	+= ((KEY(vk_right)-KEY(vk_left))*s_editor_tar *(2+keyboard_check(vk_shift)*6))
		y_editor_tar	+= ((KEY(vk_down )-KEY(vk_up  ))*s_editor_tar *(2+keyboard_check(vk_shift)*6))
	}
	
	if MBT_PRS(mb_middle)
	{
		window_mouse_set(window_get_width() / 2, window_get_height() / 2);
	}
	
	if MBT(mb_middle)
	{
		x_editor_tar += (x-mouse_x)/2
		y_editor_tar += (y-mouse_y)/2
		window_mouse_set(window_get_width() / 2, window_get_height() / 2);
	}
	
	x			= lerp(x,x_editor_tar,.4)
	y			= lerp(y,y_editor_tar,.4)
	camera_size = lerp(camera_size,s_editor_tar,.4)
	
	apply_room_border = false
	
	#endregion
}

camera_width  = GAME_WIDTH	*	camera_size
camera_height = GAME_HEIGHT	*	camera_size

if apply_room_border
{
	x = clamp(x,camera_width/2,room_width-camera_width/2)
	y = clamp(y,camera_height/2,room_height-camera_height/2)
}

// ===== Apply screen shake =====

if global.screen_shake
{
	var dir = random(360)
	var len = global.screen_shake_intensity*global.scrshake_lvl
	shake_x = lengthdir_x(len,dir)
	shake_y = lengthdir_y(len,dir)
	
	global.screen_shake_intensity +=  global.screen_shake_intensity_add
	global.screen_shake -= 1
}
else
{
	shake_x = 0
	shake_y = 0
}

// ==============================

camera_set_view_pos(camera,x-camera_width/2+shake_x,y-camera_height/2+shake_y)
camera_set_view_size(camera,camera_width,camera_height)