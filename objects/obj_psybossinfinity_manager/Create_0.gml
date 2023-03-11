glitch_effect = 0
boss_create = false
cutscene_has_started = false

obj_music_control.new_music_intro = -1
obj_music_control.new_music_loop = -1

instance_deactivate_object(obj_psybossinfinity_tentacle)

if global.boss_state = 0 && global.speedrun_skipcuts
{global.boss_state = 1}

if global.boss_state >= 1
{
	with obj_camera
	{
		x = room_width*.75
		y = room_height*.5
	}
	global.cutscene_id = ""
	obj_player.cutscene = false
	obj_player.x = 1072
	obj_camera.x = 1072
	boss_create = true
	obj_camera.free_mode = true
	instance_create_depth(1072,304,depth,obj_psybossinfinity)
	
	with obj_psybossinfinity
	{
		state_id = global.boss_state
		if state_list[state_id]=state_go_to_final_phase
		{time_before_attack = 0}
	}
}