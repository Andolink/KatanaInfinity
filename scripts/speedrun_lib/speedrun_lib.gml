#macro speedrun_rule_any			0
#macro speedrun_rule_breakthelight	1
#macro speedrun_rule_truepascifist	2

function speedrun_option_reset() { #region
	global.speedrun_hardmode	= false
	global.speedrun_stableseed	= true
	global.speedrun_skipcuts	= true
	global.speedrun_actiononly	= true
	global.speedrun_skipreplay	= true
	global.speedrun_dragdashmax	= false
	global.speedrun_secrtboss	= false
	global.speedrun_showtimer	= true
	global.speedrun_showdeath	= true
	global.speedrun_noslowmo	= false
	global.speedrun_chronos_mode= 0
	global.speedrun_nodeathmode	= false
	global.speedrun_weapon		= 0
	global.speedrun_startlevel	= rm_cutscene_intro
	global.speedrun_startlevelid= 0
	global.speedrun_rule		= speedrun_rule_any
	global.speedrun_char_mode	= false
	global.speedrun_gamespeed	= 1
	global.speedrun_gamespeedid = 0

	global.speedrun_deathcount1000	= 0
	global.speedrun_deathcount100	= 0
	global.speedrun_deathcount10	= 0
	global.speedrun_deathcount1		= 0

	global.speedrun_deathcount1000gl= 0
	global.speedrun_deathcount100gl	= 0
	global.speedrun_deathcount10gl	= 0
	global.speedrun_deathcount1gl	= 0

	global.speedrun_timer_msec	= 0
	global.speedrun_timer_sec	= 0
	global.speedrun_timer_min	= 0

	global.speedrun_timergl_msec= 0
	global.speedrun_timergl_sec	= 0
	global.speedrun_timergl_min	= 0
}

#endregion
speedrun_option_reset()

function speedrun_option_save() { #region

	ini_open("speedrun_option.ini")
	ini_write_real("SPEEDRUN","hardmd",global.speedrun_hardmode)
	ini_write_real("SPEEDRUN","stseed",global.speedrun_stableseed)
	ini_write_real("SPEEDRUN","skpcut",global.speedrun_skipcuts)
	//ini_write_real("SPEEDRUN","actonl",global.speedrun_actiononly)
	//ini_write_real("SPEEDRUN","skprep",global.speedrun_skipreplay)
	//ini_write_real("SPEEDRUN","drgmax",global.speedrun_dragdashmax)
	//ini_write_real("SPEEDRUN","scrbos",global.speedrun_secrtboss)
	ini_write_real("SPEEDRUN","shotim",global.speedrun_showtimer)
	ini_write_real("SPEEDRUN","shodea",global.speedrun_showdeath)
	ini_write_real("SPEEDRUN","noslow",global.speedrun_noslowmo)
	ini_write_real("SPEEDRUN","slowmd",global.speedrun_chronos_mode)
	ini_write_real("SPEEDRUN","onedea",global.speedrun_nodeathmode)
	ini_write_real("SPEEDRUN","srrule",global.speedrun_rule)
	ini_write_real("SPEEDRUN","charmd",global.speedrun_char_mode)
	ini_write_real("SPEEDRUN","slmspd",global.speedrun_gamespeedid)
	//ini_write_real("SPEEDRUN","weapon",global.speedrun_weapon)
	//ini_write_real("SPEEDRUN","stlevl",global.speedrun_startlevel)
	ini_write_real("SPEEDRUN","slvlid",global.speedrun_startlevelid)
	ini_close()
	
} #endregion

function speedrun_option_load() { #region

	ini_open("speedrun_option.ini")
	global.speedrun_hardmode	= ini_read_real("SPEEDRUN","hardmd",global.speedrun_hardmode)
	global.speedrun_stableseed	= ini_read_real("SPEEDRUN","stseed",global.speedrun_stableseed)
	global.speedrun_skipcuts	= ini_read_real("SPEEDRUN","skpcut",global.speedrun_skipcuts)
	//ini_read_real("SPEEDRUN","actonl",global.speedrun_actiononly)
	//ini_read_real("SPEEDRUN","skprep",global.speedrun_skipreplay)
	//ini_read_real("SPEEDRUN","drgmax",global.speedrun_dragdashmax)
	//ini_read_real("SPEEDRUN","scrbos",global.speedrun_secrtboss)
	global.speedrun_showtimer	= ini_read_real("SPEEDRUN","shotim",global.speedrun_showtimer)
	global.speedrun_showdeath	= ini_read_real("SPEEDRUN","shodea",global.speedrun_showdeath)
	global.speedrun_noslowmo	= ini_read_real("SPEEDRUN","noslow",global.speedrun_noslowmo)
	global.speedrun_chronos_mode= ini_read_real("SPEEDRUN","slowmd",global.speedrun_chronos_mode)
	global.speedrun_nodeathmode = ini_read_real("SPEEDRUN","onedea",global.speedrun_nodeathmode)
	global.speedrun_rule		= ini_read_real("SPEEDRUN","srrule",global.speedrun_rule)
	global.speedrun_char_mode	= ini_read_real("SPEEDRUN","charmd",global.speedrun_char_mode)
	//ini_read_real("SPEEDRUN","weapon",global.speedrun_weapon)
	//ini_read_real("SPEEDRUN","stlevl",global.speedrun_startlevel)
	
	global.speedrun_gamespeedid = ini_read_real("SPEEDRUN","slmspd",global.speedrun_gamespeedid)
	global.speedrun_startlevelid= ini_read_real("SPEEDRUN","slvlid",global.speedrun_startlevelid)
	ini_close()
	
	option_update()
	
} #endregion