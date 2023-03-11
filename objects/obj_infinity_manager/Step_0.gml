if global.speedrun_skipcuts
{
	switch room
	{
		case rm_cutscene_intro : case rm_psychentrance_0: case rm_cutscene_appart_chronosdealdeath :
		case rm_cutscene_appart_chronosdealdeath1 : case rm_cutscene_appart_swordclash : case rm_cutscene_appart_situation :
		case rm_cutscene_appart_tv : case rm_cutscene_tohether :
			room_goto_next()
		break
	}
}