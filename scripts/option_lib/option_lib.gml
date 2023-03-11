global.sfx_volume	= 1
global.music_vol	= 1
global.global_vol	= 1
global.fullscreen	= true
global.scrshake_lvl	= 1
global.hitpause_lvl	= 1
global.player_aim_assist = true
global.slash_type	= 0
global.mwheel_char	= true

function option_update() { #region
	
	//FULLSCREEN CODE

	if window_get_fullscreen() != global.fullscreen
		window_set_fullscreen(global.fullscreen)
	
	//SOUND CODE

	audio_group_set_gain(Music,1*global.music_vol*global.global_vol,0)
	audio_group_set_gain(Sfx,.6*global.sfx_volume*global.global_vol,0)
	
}#endregion

function option_save() { #region

	ini_open("option.ini")

	ini_write_real("OPTION","sfxvol",global.sfx_volume)
	ini_write_real("OPTION","musvol",global.music_vol)
	ini_write_real("OPTION","glovol",global.global_vol)
	ini_write_real("OPTION","fulscr",global.fullscreen) 
	ini_write_real("OPTION","scrsha",global.scrshake_lvl) 
	ini_write_real("OPTION","hitpau",global.hitpause_lvl) 
	ini_write_real("OPTION","aimasi",global.player_aim_assist) 
	ini_write_real("OPTION","slasht",global.slash_type) 
	ini_write_real("OPTION","zerosw",global.zero_sword) 
	ini_write_real("OPTION","mwhchr",global.mwheel_char)

	ini_close()
	
} #endregion

function option_load() { #region

	ini_open("option.ini")
	global.sfx_volume		= ini_read_real("OPTION","sfxvol",global.sfx_volume)
	global.music_vol		= ini_read_real("OPTION","musvol",global.music_vol)
	global.global_vol		= ini_read_real("OPTION","glovol",global.global_vol)
	global.fullscreen		= ini_read_real("OPTION","fulscr",global.fullscreen) 
	global.scrshake_lvl		= ini_read_real("OPTION","scrsha",global.scrshake_lvl) 
	global.hitpause_lvl		= ini_read_real("OPTION","hitpau",global.hitpause_lvl) 
	global.player_aim_assist= ini_read_real("OPTION","aimasi",global.player_aim_assist) 
	global.slash_type		= ini_read_real("OPTION","slasht",global.slash_type)
	global.zero_sword		= ini_read_real("OPTION","zerosw",global.zero_sword)
	global.mwheel_char		= ini_read_real("OPTION","mwhchr",global.mwheel_char)
	ini_close()
	
	option_update()
	
} #endregion

function control_save_key(key,key_gp,section) { #region
	if key != -1
	{
		ini_write_real(section, "type",key[0])
		ini_write_real(section,  "key",key[1])
		ini_write_real(section,"type1",key[2])
		ini_write_real(section, "key1",key[3])
		ini_write_real(section,"type2",key[4])
		ini_write_real(section, "key2",key[5])
	}
	
	if key_gp != -1
	{
		ini_write_real(section, "type_gp",key_gp[0])
		ini_write_real(section,  "key_gp",key_gp[1])
		ini_write_real(section,"type_gp1",key_gp[2])
		ini_write_real(section, "key_gp1",key_gp[3])
		ini_write_real(section,"type_gp2",key_gp[4])
		ini_write_real(section, "key_gp2",key_gp[5])
	}
	
} #endregion

function control_load_key(key,key_gp,section) { #region
	if key != -1
	{	
		key[0] = ini_read_real(section,"type",key[0])
		key[1] = ini_read_real(section, "key",key[1])
		key[2] = ini_read_real(section,"type1",key[2])
		key[3] = ini_read_real(section, "key1",key[3])
		key[4] = ini_read_real(section,"type2",key[4])
		key[5] = ini_read_real(section, "key2",key[5])
	}
	
	if key_gp != -1
	{
		key_gp[0] = ini_read_real(section,"type_gp",key_gp[0])
		key_gp[1] = ini_read_real(section, "key_gp",key_gp[1])
		key_gp[2] = ini_read_real(section,"type_gp1",key_gp[2])
		key_gp[3] = ini_read_real(section, "key_gp1",key_gp[3])
		key_gp[4] = ini_read_real(section,"type_gp2",key_gp[4])
		key_gp[5] = ini_read_real(section, "key_gp2",key_gp[5])
	}
	
} #endregion
	
function control_save() { #region

ini_open("control.ini")

//KEYBOARD

control_save_key(global.key_up				,-1							,"Up")
control_save_key(global.key_down			,-1							,"Down")
control_save_key(global.key_left			,-1							,"Left")
control_save_key(global.key_right			,-1							,"Right")

control_save_key(global.key_jump			,global.key_gp_jump			,"Jump")
control_save_key(global.key_interact		,global.key_gp_interact		,"Interact")
control_save_key(global.key_roll			,global.key_gp_roll			,"Roll")
control_save_key(global.key_attack			,global.key_gp_attack		,"Attack")
control_save_key(global.key_object			,global.key_gp_object		,"Object")
control_save_key(global.key_walk			,global.key_gp_walk			,"Walk")
control_save_key(global.key_chronos			,global.key_gp_chronos		,"SlowMotion")
control_save_key(global.key_pl_switch		,global.key_gp_pl_switch	,"CharSwitch")
control_save_key(global.key_pause			,global.key_gp_pause		,"Pause")
control_save_key(global.key_deathrestart	,global.key_gp_deathrestart	,"DeathRestart")
control_save_key(global.key_restart			,global.key_gp_restart		,"Restart")
control_save_key(global.key_select			,global.key_gp_select		,"Select")

ini_close()
	
} #endregion

function control_load() { #region

ini_open("control.ini")

//Keyboard

control_load_key(global.key_up				,-1							,"Up")
control_load_key(global.key_down			,-1							,"Down")
control_load_key(global.key_left			,-1							,"Left")
control_load_key(global.key_right			,-1							,"Right")

control_load_key(global.key_jump			,global.key_gp_jump			,"Jump")
control_load_key(global.key_interact		,global.key_gp_interact		,"Interact")
control_load_key(global.key_roll			,global.key_gp_roll			,"Roll")
control_load_key(global.key_attack			,global.key_gp_attack		,"Attack")
control_load_key(global.key_object			,global.key_gp_object		,"Object")
control_load_key(global.key_walk			,global.key_gp_walk			,"Walk")
control_load_key(global.key_chronos			,global.key_gp_chronos		,"SlowMotion")
control_load_key(global.key_pl_switch		,global.key_gp_pl_switch	,"CharSwitch")
control_load_key(global.key_pause			,global.key_gp_pause		,"Pause")
control_load_key(global.key_deathrestart	,global.key_gp_deathrestart	,"DeathRestart")
control_load_key(global.key_restart			,global.key_gp_restart		,"Restart")
control_load_key(global.key_select			,global.key_gp_select		,"Select")

ini_close()
	
} #endregion