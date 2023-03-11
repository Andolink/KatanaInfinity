if place_meeting(x,y,obj_player)
&& instance_exists(obj_go_arrow)
&& obj_player.hp > 0
&& !transition
{
	obj_player.cutscene = true
	
	if x > room_width/2
		global.cutscene_id = "PLAYERexit"
	else
		global.cutscene_id = "PLAYERexit_right"
		
	instance_create_depth(0,0,0,obj_player_win_gui)
	transition = true
}