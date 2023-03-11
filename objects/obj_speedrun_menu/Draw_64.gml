menu_draw()

//START LEVEL

switch global.speedrun_startlevelid
{
	case 0 : global.speedrun_startlevel = rm_cutscene_intro break
	case 1 : global.speedrun_startlevel = rm_cutscene_tohether break
	case 2 : global.speedrun_startlevel = rm_secretpassage_psyboss break
}

//GAME SPEED

switch global.speedrun_gamespeedid
{
	case 0 : global.speedrun_gamespeed	= 1		break
	case 1 : global.speedrun_gamespeed	= 1.25	break
	case 2 : global.speedrun_gamespeed	= 1.5	break
	case 3 : global.speedrun_gamespeed	= 2		break
}

speedrun_option_save()