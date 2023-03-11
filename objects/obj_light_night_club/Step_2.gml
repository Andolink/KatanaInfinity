if time <=0 
{
	image_blend = base_col[irandom(3)]
	col = image_blend
	time = 60
}
time -= global.game_spd