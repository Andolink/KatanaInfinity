x += hspd

if !camera_init
{
	with obj_camera
	{
		x = room_width/2
		y = room_height*.75
		camera_size = .75
	}
	camera_init = true
}
else
{
	
}

if x > 190
{	
	hspd = lerp(hspd,0,0.5)
	if sprite_index = spr_player_nosword_run
	{
		sprite_index = spr_player_nosword_postrun
	}
	
	if state < 2
	{
		obj_camera.x = lerp(obj_camera.x,280,.01)
	}
}
else
{
	trans = lerp(trans,0,0.05)
	obj_camera.x -= 0.03
}

if state = 1
{
	obj_cuts_infinity_entrance.state = 1
	state += 0.1
}

if state > 1 && state < 2
{
	state += 0.008
	if state >= 1.9
	{
		layer_set_visible(layer_get_id("Effect_0"),true)
		layer_set_visible(layer_get_id("Effect_1"),true)
		instance_create_depth(0,0,0,obj_glitch_feedback)
		instance_destroy(obj_cuts_infinity_entrance)
		with obj_random_club_human
		{event_perform(ev_create,0)}
		var snd_ = audio_play_sound(mus_psych_drone_intro,999,0)
		audio_sound_gain(snd_,0,0)
		audio_sound_gain(snd_,1,100)
		audio_sound_set_track_position(snd_,10)
		alarm[1]=150
		state = 2
		screen_shake_set(300,0,0.001)
		obj_camera.camera_size -= 0.15
		obj_camera.x = x
		obj_camera.y = y
	}
}

if state = 2
{
	obj_music_control.gain = lerp(obj_music_control.gain,0,0.4) 
	audio_sound_gain(mus_psych_drone_intro,1,100)
	obj_camera.camera_size -= 0.0002
}

if state > 2
{
	obj_camera.camera_size = lerp(obj_camera.camera_size ,.8,0.0025)
}

if state = 4
{
	trans = lerp(trans,1.1,0.05)
	if trans > 1 
	{
		with instance_create_depth(x,y,0,obj_hud_transition)
		{func_transition = function(){room_goto_next()}}
		state = 5
	}
}