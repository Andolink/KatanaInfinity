if glitch_effect > 0
{
	//layer_set_visible(layer_get_id("GlitchedEffect0"),true)
	//layer_set_visible(layer_get_id("GlitchedEffect1"),true)
}
else
{
	//layer_set_visible(layer_get_id("GlitchedEffect0"),false)
	//layer_set_visible(layer_get_id("GlitchedEffect1"),false)
}

global.level_timer = 3600

glitch_effect -= global.game_spd

if !cutscene_has_started 
&& ((obj_player.x > 1000 && global.zero_infinity_relation < 0)
|| (obj_player.x > 880 && global.zero_infinity_relation >= 0))
&& global.boss_state = 0
{
	instance_create_depth(0,0,0,obj_glitch_feedback)
	
	instance_destroy(obj_player)
	instance_destroy(obj_player_attack)
	
	if global.zero_infinity_relation < 0
	{
		instance_create_depth(1099,318,depth,obj_cuts_infinity_boss).image_xscale = -1
		instance_create_depth(1043,318,depth,obj_cuts_zero_boss)
	}
	else
	{
		instance_create_depth(880+32,318,depth,obj_cuts_infinity_boss)
		instance_create_depth(880,318,depth,obj_cuts_zero_boss)
	}
	cutscene_has_started = true
}

if boss_create
{
	obj_camera.free_mode = true
	with obj_camera
	{
		x = lerp(x,room_width*.75,.1)
		y = lerp(y,room_height*.5,.1)
	}
}