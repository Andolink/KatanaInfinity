/*=========== INIT INPUT STATES ==========*/
/**/									/**/
/**/	#macro PRESSED				0	/**/
/**/	#macro CHECK				1	/**/
/**/	#macro RELEASED				2	/**/
/**/	#macro PRESSED_CUTSCENE		3	/**/
/**/	#macro CHECK_CUTSCENE		4	/**/
/**/	#macro RELEASED_CUTSCENE	5	/**/
/**/									/**/
/*========================================*/

function input_reset(_type){ #region
	
	_type[CHECK]	= false
	_type[PRESSED]	= false
	_type[RELEASED]	= false
	
	_type[PRESSED_CUTSCENE]	= false
	_type[CHECK_CUTSCENE]	= false
	_type[RELEASED_CUTSCENE]= false
	
} #endregion

function input_init(){ #region
	
	global.input_up[0]=0			input_reset(global.input_up)
	global.input_down[0]=0			input_reset(global.input_down)
	global.input_left[0]=0			input_reset(global.input_left)
	global.input_right[0]=0			input_reset(global.input_right)
	
	global.input_jump[0]=0			input_reset(global.input_jump)
	global.input_interact[0]=0		input_reset(global.input_interact)
	global.input_roll[0]=0			input_reset(global.input_roll)
	global.input_attack[0]=0		input_reset(global.input_attack)
	global.input_object[0]=0		input_reset(global.input_object)
	global.input_walk[0]=0			input_reset(global.input_walk)
	global.input_chronos[0]=0		input_reset(global.input_chronos)
	global.input_pl_switch[0]=0		input_reset(global.input_pl_switch)
	
	global.input_pause[0]=0			input_reset(global.input_pause)
	global.input_deathrestart[0]=0	input_reset(global.input_deathrestart)
	global.input_restart[0]=0		input_reset(global.input_restart)
	global.input_select[0]=0		input_reset(global.input_select)
	
	global.gamepad = 0
	global.input_aim_x = 0
	global.input_aim_y = 0
} #endregion

function input_cutscene_update(){ #region
	
	input_cutscene_set(global.input_up,false)
	input_cutscene_set(global.input_down,false)
	input_cutscene_set(global.input_left,false)
	input_cutscene_set(global.input_right,false)
	
	input_cutscene_set(global.input_jump,false)
	input_cutscene_set(global.input_interact,false)
	input_cutscene_set(global.input_roll,false)
	input_cutscene_set(global.input_attack,false)
	input_cutscene_set(global.input_object,false)
	input_cutscene_set(global.input_walk,false)
	input_cutscene_set(global.input_chronos,false)
	input_cutscene_set(global.input_pl_switch,false)
	
	input_cutscene_set(global.input_pause,false)
	
	switch(global.cutscene_id)
	{
		case "PLAYERstart" : #region
		
		if instance_exists(obj_player) {
			if obj_player.cutscene_var = 0
			{
				obj_player.x = -20 
				obj_player.cutscene = true
				obj_player.cutscene_var = 1
			}
		
			if obj_player.x < obj_player.xstart
			{
				input_cutscene_set(global.input_right,true)
			}
			else
			{
				obj_player.cutscene_var ++
				if obj_player.cutscene_var > 20
				{
					audio_play_sound(sound_boss_therapist_glitchdeath_02,999,false)
					instance_create_depth(0,0,0,obj_glitch_feedback,{play_sound : false})
					sleep(10)
					obj_player.cutscene_var = 0
					obj_player.cutscene = false
					global.cutscene_id = ""
				}
			}
		}
		
		break #endregion
		
		case "PLAYERstart_right" : #region
		
		if instance_exists(obj_player) {
			if obj_player.cutscene_var = 0
			{
				obj_player.x = room_width+20
				obj_player.cutscene = true
				obj_player.cutscene_var = 1
			}
		
			if obj_player.x > obj_player.xstart
			{
				input_cutscene_set(global.input_left,true)
			}
			else
			{
				obj_player.cutscene_var ++
				if obj_player.cutscene_var > 20
				{
					audio_play_sound(sound_boss_therapist_glitchdeath_02,999,false)
					instance_create_depth(0,0,0,obj_glitch_feedback,{play_sound : false})
					sleep(10)
					obj_player.cutscene_var = 0
					obj_player.cutscene = false
					global.cutscene_id = ""
				}
			}
		}
		
		break #endregion
		
		case "PLAYERexit" : #region
		
		if instance_exists(obj_player) {
			if obj_player.cutscene_var = 0
			{obj_player.cutscene = true}
		
			if obj_player.x < room_width+32
			{
				input_cutscene_set(global.input_right,true)
			}
		}
		
		break #endregion
		
		case "PLAYERexit_right" : #region
		
		if instance_exists(obj_player) {
			if obj_player.cutscene_var = 0
			{obj_player.cutscene = true}
		
			if obj_player.x > -32
			{
				input_cutscene_set(global.input_left,true)
			}
		}
		
		break #endregion
	}
	
}#endregion

function input_bind_key(keyvar_,type,key_,type2=-1,key2_=-1,type3=-1,key3_=-1) { #region
	keyvar_[0]=type
	keyvar_[1]=key_
	
	keyvar_[2]=type2
	keyvar_[3]=key2_
	
	keyvar_[4]=type3
	keyvar_[5]=key3_
} #endregion

function input_update(){ #region
	
	var gp_num = gamepad_get_device_count();
	for (var i = 0; i < gp_num; i++;)
	{
	    if gamepad_is_connected(i) 
		{
			global.gamepad = i
			break
		}
		else
		{
			global.gamepad = -1
		}
	}
	
	input_set(global.input_up,			global.key_up,			[GMP,gp_padu],	[GMP_JOY,gp_axislv,-.5])
	input_set(global.input_down,		global.key_down,		[GMP,gp_padd],	[GMP_JOY,gp_axislv,.5])
	input_set(global.input_left,		global.key_left,		[GMP,gp_padl],	[GMP_JOY,gp_axislh,-.5])
	input_set(global.input_right,		global.key_right,		[GMP,gp_padr],	[GMP_JOY,gp_axislh,.5])
	
	input_set(global.input_jump,		global.key_jump,		global.key_gp_jump)
	input_set(global.input_interact,	global.key_interact,	global.key_gp_interact)
	input_set(global.input_roll,		global.key_roll,		global.key_gp_roll)
	input_set(global.input_attack,		global.key_attack,		global.key_gp_attack)
	input_set(global.input_object,		global.key_object,		global.key_gp_object)
	input_set(global.input_walk,		global.key_walk,		global.key_gp_walk)
	input_set(global.input_pl_switch,	global.key_pl_switch,	global.key_gp_pl_switch)
	input_set(global.input_chronos,		global.key_chronos,		global.key_gp_chronos)
		
	input_set(global.input_pause,		global.key_pause,		global.key_gp_pause)
	input_set(global.input_deathrestart,global.key_deathrestart,global.key_gp_deathrestart)
	input_set(global.input_restart,		global.key_restart,		global.key_gp_restart)
	input_set(global.input_select,		global.key_select,		global.key_gp_select)
	
	if global.gamepad = -1
	{
		global.input_aim_x = mouse_x
		global.input_aim_y = mouse_y
	}
	else
	{
		var dir_ = point_direction(0,0,GMP_JOY(global.gamepad,gp_axisrh),GMP_JOY(global.gamepad,gp_axisrv))
		var dist_ = point_distance(0,0,GMP_JOY(global.gamepad,gp_axisrh),GMP_JOY(global.gamepad,gp_axisrv))
		
		if dist_ < 0.1
		{
			var dir_ = point_direction(0,0,GMP_JOY(global.gamepad,gp_axislh),GMP_JOY(global.gamepad,gp_axislv))
			var dist_ = point_distance(0,0,GMP_JOY(global.gamepad,gp_axislh),GMP_JOY(global.gamepad,gp_axislv))
		}
		
		if instance_exists(obj_player)
		{
			global.input_aim_x = obj_player.x+lengthdir_x(dist_*200,dir_)
			global.input_aim_y = obj_player.y+lengthdir_y(dist_*200,dir_)
		}
		else
		{
			global.input_aim_x += lengthdir_x(dist_*100,dir_)
			global.input_aim_y += lengthdir_y(dist_*100,dir_)
		}
	}
	
	input_cutscene_update()
	
} #endregion

function input_get(_type,_state,cutscene_mode=false){ #region
	if !cutscene_mode 
		return _type[_state]
	else
		return _type[_state+3]
} #endregion

function input_set(_type){ #region
	
	var arg_num = 1
	var old = input_get(_type,CHECK)
	
	repeat(argument_count-1)
	{
		var cur_inp = argument[arg_num]
		var i = 0
		repeat(floor(array_length(cur_inp)/2))
		{
			switch cur_inp[0+i*2]
			{
				case KEY :
					_type[CHECK]	=KEY	(cur_inp[1+i*2])
				break
				case MBT :
					_type[CHECK]	=MBT	(cur_inp[1+i*2])
				break
				case GMP :
					_type[CHECK]	=GMP	(global.gamepad,cur_inp[1+i*2])
				break
				case GMP_JOY:
					if cur_inp[2+i*2]>0
						_type[CHECK]	=GMP_JOY	(global.gamepad,cur_inp[1+i*2])>cur_inp[2+i*2]
					else
						_type[CHECK]	=GMP_JOY	(global.gamepad,cur_inp[1]+i*2)<cur_inp[2+i*2]
					i++
				break
			}
			
			if _type[CHECK]
			{break}
			i++
		}
		
		if _type[CHECK]=true
			break
		arg_num ++
	}
	
	_type[PRESSED]	= !old  &&  _type[CHECK]
	_type[RELEASED]	=  old  && !_type[CHECK]
	
} #endregion

function input_cutscene_set(_type,val_){ #region

	var old = input_get(_type,CHECK_CUTSCENE)
	
	_type[CHECK_CUTSCENE]	= val_
	
	_type[PRESSED_CUTSCENE]	= !old  &&  _type[CHECK_CUTSCENE]
	_type[RELEASED_CUTSCENE]	=  old  && !_type[CHECK_CUTSCENE]
	
} #endregion

function input_gamepad_any() { #region

if gamepad_button_check_pressed(global.gamepad,gp_face1)
{return gp_face1}else
if gamepad_button_check_pressed(global.gamepad,gp_face2)
{return gp_face2}else
if gamepad_button_check_pressed(global.gamepad,gp_face3)
{return gp_face3}else
if gamepad_button_check_pressed(global.gamepad,gp_face4)
{return gp_face4}else
if gamepad_button_check_pressed(global.gamepad,gp_padl)
{return gp_padl}else
if gamepad_button_check_pressed(global.gamepad,gp_padr)
{return gp_padr}else
if gamepad_button_check_pressed(global.gamepad,gp_padu)
{return gp_padu}else
if gamepad_button_check_pressed(global.gamepad,gp_padd)
{return gp_padd}else
if gamepad_button_check_pressed(global.gamepad,gp_select)
{return gp_select}else
if gamepad_button_check_pressed(global.gamepad,gp_start)
{return gp_start}else
if gamepad_button_check_pressed(global.gamepad,gp_stickl)
{return gp_stickl}else
if gamepad_button_check_pressed(global.gamepad,gp_stickr)
{return gp_stickr}else
if gamepad_button_check_pressed(global.gamepad,gp_shoulderl)
{return gp_shoulderl}else
if gamepad_button_check_pressed(global.gamepad,gp_shoulderr)
{return gp_shoulderr}else
if gamepad_button_check_pressed(global.gamepad,gp_shoulderlb)
{return gp_shoulderlb}else
if gamepad_button_check_pressed(global.gamepad,gp_shoulderrb)
{return gp_shoulderrb}

} #endregion

#region input binding init

global.key_up[0]				= 0		input_bind_key(global.key_up,KEY,ord("W"),KEY,vk_up,KEY,ord("Z"))
global.key_down[0]				= 0		input_bind_key(global.key_down,KEY,ord("S"),KEY,vk_down)
global.key_left[0]				= 0		input_bind_key(global.key_left,KEY,ord("A"),KEY,vk_left,KEY,ord("Q"))
global.key_right[0]				= 0		input_bind_key(global.key_right,KEY,ord("D"),KEY,vk_right)
	
global.key_jump[0]				= 0		input_bind_key(global.key_jump,KEY,vk_space)
global.key_interact[0]			= 0		input_bind_key(global.key_interact,KEY,ord("E"))
global.key_roll[0]				= 0		input_bind_key(global.key_roll,KEY,ord("S"))
global.key_attack[0]			= 0		input_bind_key(global.key_attack,MBT,mb_left)
global.key_object[0]			= 0		input_bind_key(global.key_object,MBT,mb_right)
global.key_walk[0]				= 0		input_bind_key(global.key_walk,KEY,vk_control)
global.key_pl_switch[0]			= 0		input_bind_key(global.key_pl_switch,KEY,vk_tab)
global.key_chronos[0]			= 0		input_bind_key(global.key_chronos,KEY,vk_shift,MBT,mb_middle)

global.key_pause[0]				= 0		input_bind_key(global.key_pause,KEY,vk_escape)
global.key_deathrestart[0]		= 0		input_bind_key(global.key_deathrestart,MBT,mb_left)
global.key_restart[0]			= 0		input_bind_key(global.key_restart,KEY,ord("R"))
global.key_select[0]			= 0		input_bind_key(global.key_select,KEY,vk_space)

global.key_gp_jump[0]			= 0		input_bind_key(global.key_gp_jump,GMP,gp_face1)
global.key_gp_interact[0]		= 0		input_bind_key(global.key_gp_interact,GMP,gp_face4)
global.key_gp_roll[0]			= 0		input_bind_key(global.key_gp_roll,GMP,gp_shoulderrb)
global.key_gp_attack[0]			= 0		input_bind_key(global.key_gp_attack,GMP,gp_face3,GMP,gp_shoulderl)
global.key_gp_object[0]			= 0		input_bind_key(global.key_gp_object,GMP,gp_face2)
global.key_gp_walk[0]			= 0		input_bind_key(global.key_gp_walk,GMP,gp_face4)
global.key_gp_pl_switch[0]		= 0		input_bind_key(global.key_gp_pl_switch,GMP,gp_shoulderr)
global.key_gp_chronos[0]		= 0		input_bind_key(global.key_gp_chronos,GMP,gp_shoulderlb)

global.key_gp_pause[0]			= 0		input_bind_key(global.key_gp_pause,GMP,gp_start)
global.key_gp_deathrestart[0]	= 0		input_bind_key(global.key_gp_deathrestart,GMP,gp_face3)
global.key_gp_restart[0]		= 0		input_bind_key(global.key_gp_restart,GMP,gp_select)
global.key_gp_select[0]			= 0		input_bind_key(global.key_gp_select,GMP,gp_face1)

#endregion