player_dist = distance_to_object(obj_player)

if player_dist<24
{
	if tuto = -1
	{
		tuto = instance_create_depth(x,y,depth,obj_player_tuto)
		tuto.id_tuto = 1
	}
}
else
{
	if tuto != -1 
	{
		instance_destroy(tuto)
		tuto = -1
	}
}

if player_dist <24
&& input_get(global.input_interact,PRESSED,obj_player.cutscene)
&& obj_player.hp > 0
{
	event_user(0)
}