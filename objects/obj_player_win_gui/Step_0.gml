trans += 0.05
if trans >= 1.9 && !trans_end
{
	with instance_create_depth(x,y,0,obj_hud_transition)
	{
		func_transition = function()
		{
			if room = rm_level_editor_play
			{
				room_restart()
				global.level_play_id ++
				global.cutscene_id = "PLAYERstart"
				
			}
			else if room = rm_level_editor
			{
				instance_activate_all()
				instance_destroy(obj_camera) instance_create_depth(0,0,0,obj_camera)
				level_editor_load("LevelEditor/"+"_autosave")
			}
			else
			{
				room_goto_next()
				global.cutscene_id = "PLAYERstart"
			
				global.speedrun_timer_msec	= 0
				global.speedrun_timer_sec	= 0
				global.speedrun_timer_min	= 0
				global.speedrun_deathcount1000	= 0
				global.speedrun_deathcount100	= 0
				global.speedrun_deathcount10	= 0
				global.speedrun_deathcount1		= 0
			}
		}
	}
	trans_end = true
}