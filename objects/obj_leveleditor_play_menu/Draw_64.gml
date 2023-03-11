menu_draw()

//START LEVEL

switch global.speedrun_startlevelid
{
	case 0 : global.speedrun_startlevel = rm_cutscene_intro break
	case 1 : global.speedrun_startlevel = rm_cutscene_tohether break
	case 2 : global.speedrun_startlevel = rm_secretpassage_psyboss break
}

speedrun_option_save()