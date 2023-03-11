#region GAMEPLAYS

#macro gameplay_sword				0
#macro gameplay_no_sword			1
#macro gameplay_gun					2
#macro gameplay_dragon				3
#macro gameplay_murasama			4

#macro char_switch_skin				0
#macro char_switch_gameplay			1

#endregion
#region SKINS

#macro skin_zero					0
#macro skin_zero_no_sword			1
#macro skin_infinity				2
#macro skin_zero_gun				3
#macro skin_dragon					4
#macro skin_murasama				5

#endregion
#region SPRITES

#macro spr_idle						0
#macro spr_idle_to_run				1
#macro spr_run						2
#macro spr_run_to_idle				3
#macro spr_idle_to_walk				4
#macro spr_walk						5
#macro spr_jump						6
#macro spr_fall						7
#macro spr_attack					8
#macro spr_roll						9
#macro spr_door_break				10
#macro spr_door_break_full			11
#macro spr_wall_grab				12
#macro spr_wall_slide				13
#macro spr_flip						14
#macro spr_casual_idle				15
#macro spr_casual_walk				16
#macro spr_casual_walk_backward		17
#macro spr_answer_phone				18
#macro spr_hurt						19
#macro spr_hurt_loop				20
#macro spr_hurt_ground				21
#macro spr_hurt_ground_to_idle		22
#macro spr_dragon_slash_dash		23

#endregion
#region WEAPON

#macro sword_normal 0
#macro sword_dragon 1
#macro sword_color	2
#macro sword_big	3
#macro sword_flame	4
#macro sword_old	5
#macro sword_master 6
#macro sword_short	7
#macro sword_mura	8

#endregion

#region ZERO
	global.player_sprite[spr_idle					,skin_zero] = spr_pl_idle
	global.player_sprite[spr_idle_to_run			,skin_zero] = spr_pl_idle_to_run
	global.player_sprite[spr_run					,skin_zero] = spr_pl_run
	global.player_sprite[spr_run_to_idle			,skin_zero] = spr_pl_run_to_idle
	global.player_sprite[spr_idle_to_walk			,skin_zero] = spr_pl_idle_to_walk
	global.player_sprite[spr_walk					,skin_zero] = spr_pl_walk
	global.player_sprite[spr_jump					,skin_zero] = spr_pl_jump
	global.player_sprite[spr_fall					,skin_zero] = spr_pl_fall
	global.player_sprite[spr_attack					,skin_zero] = spr_pl_attack
	global.player_sprite[spr_roll					,skin_zero] = spr_pl_roll
	global.player_sprite[spr_door_break				,skin_zero] = spr_pl_door_break
	global.player_sprite[spr_door_break_full		,skin_zero] = spr_pl_door_break_full
	global.player_sprite[spr_wall_grab				,skin_zero] = spr_pl_wall_grab
	global.player_sprite[spr_wall_slide				,skin_zero] = spr_pl_wall_slide
	global.player_sprite[spr_flip					,skin_zero] = spr_pl_flip
	global.player_sprite[spr_casual_idle			,skin_zero] = spr_pl_casual_idle
	global.player_sprite[spr_casual_walk			,skin_zero] = spr_pl_casual_walk
	global.player_sprite[spr_casual_walk_backward	,skin_zero] = spr_pl_casual_walk_backward
	global.player_sprite[spr_answer_phone			,skin_zero] = spr_pl_answer_phone
	global.player_sprite[spr_hurt					,skin_zero] = spr_pl_hurt
	global.player_sprite[spr_hurt_loop				,skin_zero] = spr_pl_hurt_loop
	global.player_sprite[spr_hurt_ground			,skin_zero] = spr_pl_hurt_ground
	global.player_sprite[spr_hurt_ground_to_idle	,skin_zero] = spr_pl_hurt_ground_to_idle
	global.player_sprite[spr_dragon_slash_dash		,skin_zero] = spr_dragon_dash
#endregion
#region ZERO - NO SWORD
	global.player_sprite[spr_idle					,skin_zero_no_sword] = spr_player_nosword_idle
	global.player_sprite[spr_idle_to_run			,skin_zero_no_sword] = spr_player_nosword_prerun
	global.player_sprite[spr_run					,skin_zero_no_sword] = spr_player_nosword_run
	global.player_sprite[spr_run_to_idle			,skin_zero_no_sword] = spr_player_nosword_postrun
	global.player_sprite[spr_idle_to_walk			,skin_zero_no_sword] = spr_pl_idle_to_walk
	global.player_sprite[spr_walk					,skin_zero_no_sword] = spr_pl_walk
	global.player_sprite[spr_jump					,skin_zero_no_sword] = spr_player_nosword_jump
	global.player_sprite[spr_fall					,skin_zero_no_sword] = spr_player_nosword_fall
	global.player_sprite[spr_attack					,skin_zero_no_sword] = spr_pl_attack
	global.player_sprite[spr_roll					,skin_zero_no_sword] = spr_player_nosword_roll
	global.player_sprite[spr_door_break				,skin_zero_no_sword] = spr_player_nosword_doorbreak
	global.player_sprite[spr_door_break_full		,skin_zero_no_sword] = spr_player_nosword_doorbreak
	global.player_sprite[spr_wall_grab				,skin_zero_no_sword] = spr_player_nosword_wallslide
	global.player_sprite[spr_wall_slide				,skin_zero_no_sword] = spr_player_nosword_wallslide
	global.player_sprite[spr_flip					,skin_zero_no_sword] = spr_pl_flip
	global.player_sprite[spr_casual_idle			,skin_zero_no_sword] = spr_player_nosword_casual_idle
	global.player_sprite[spr_casual_walk			,skin_zero_no_sword] = spr_player_nosword_casualwalk
	global.player_sprite[spr_casual_walk_backward	,skin_zero_no_sword] = spr_player_nosword_casualwalk_backwards
	global.player_sprite[spr_answer_phone			,skin_zero_no_sword] = spr_pl_answer_phone
	global.player_sprite[spr_hurt					,skin_zero_no_sword] = spr_player_nosword_hurtfly_begin
	global.player_sprite[spr_hurt_loop				,skin_zero_no_sword] = spr_player_nosword_hurtfly_loop
	global.player_sprite[spr_hurt_ground			,skin_zero_no_sword] = spr_player_nosword_hurtground
	global.player_sprite[spr_hurt_ground_to_idle	,skin_zero_no_sword] = spr_player_nosword_hurtrecover
	global.player_sprite[spr_dragon_slash_dash		,skin_zero_no_sword] = spr_dragon_dash
#endregion
#region INFINITY
	global.player_sprite[spr_idle					,skin_infinity] = spr_pl_idle_infinity
	global.player_sprite[spr_idle_to_run			,skin_infinity] = spr_pl_idle_to_run_infinity
	global.player_sprite[spr_run					,skin_infinity] = spr_pl_run_infinity
	global.player_sprite[spr_run_to_idle			,skin_infinity] = spr_pl_run_to_idle_infinity
	global.player_sprite[spr_idle_to_walk			,skin_infinity] = spr_pl_idle_to_walk_infinity
	global.player_sprite[spr_walk					,skin_infinity] = spr_pl_walk_infinity
	global.player_sprite[spr_jump					,skin_infinity] = spr_pl_jump_infinity
	global.player_sprite[spr_fall					,skin_infinity] = spr_pl_fall_infinity
	global.player_sprite[spr_attack					,skin_infinity] = spr_pl_attack_infinity
	global.player_sprite[spr_roll					,skin_infinity] = spr_pl_roll_infinity
	global.player_sprite[spr_door_break				,skin_infinity] = spr_pl_door_break_infinity
	global.player_sprite[spr_door_break_full		,skin_infinity] = spr_pl_door_break_full_infinity
	global.player_sprite[spr_wall_grab				,skin_infinity] = spr_pl_wall_grab_infinity
	global.player_sprite[spr_wall_slide				,skin_infinity] = spr_pl_wall_slide_infinity
	global.player_sprite[spr_flip					,skin_infinity] = spr_pl_flip_infinity
	global.player_sprite[spr_casual_idle			,skin_infinity] = spr_pl_casual_idle_infinity
	global.player_sprite[spr_casual_walk			,skin_infinity] = spr_pl_casual_walk_infinity
	global.player_sprite[spr_casual_walk_backward	,skin_infinity] = spr_pl_casual_walk_backward_infinity
	global.player_sprite[spr_answer_phone			,skin_infinity] = spr_pl_answer_phone_infinity
	global.player_sprite[spr_hurt					,skin_infinity] = spr_pl_hurt_infinity
	global.player_sprite[spr_hurt_loop				,skin_infinity] = spr_pl_hurt_loop_infinity
	global.player_sprite[spr_hurt_ground			,skin_infinity] = spr_pl_hurt_ground_infinity
	global.player_sprite[spr_hurt_ground_to_idle	,skin_infinity] = spr_pl_hurt_ground_to_idle_infinity
	global.player_sprite[spr_dragon_slash_dash		,skin_infinity] = spr_dragon_dash
#endregion
#region ZERO - GUN
	global.player_sprite[spr_idle					,skin_zero_gun] = spr_player_pistol_idle
	global.player_sprite[spr_idle_to_run			,skin_zero_gun] = spr_player_pistol_prerun
	global.player_sprite[spr_run					,skin_zero_gun] = spr_player_pistol_run
	global.player_sprite[spr_run_to_idle			,skin_zero_gun] = spr_player_pistol_postrun
	global.player_sprite[spr_idle_to_walk			,skin_zero_gun] = spr_pl_idle_to_walk
	global.player_sprite[spr_walk					,skin_zero_gun] = spr_pl_walk
	global.player_sprite[spr_jump					,skin_zero_gun] = spr_player_pistol_jump
	global.player_sprite[spr_fall					,skin_zero_gun] = spr_player_pistol_fall
	global.player_sprite[spr_attack					,skin_zero_gun] = spr_player_pistol_attack
	global.player_sprite[spr_roll					,skin_zero_gun] = spr_player_pistol_roll
	global.player_sprite[spr_door_break				,skin_zero_gun] = spr_player_pistol_doorbreak
	global.player_sprite[spr_door_break_full		,skin_zero_gun] = spr_player_pistol_doorbreak
	global.player_sprite[spr_wall_grab				,skin_zero_gun] = spr_player_pistol_wallslide
	global.player_sprite[spr_wall_slide				,skin_zero_gun] = spr_player_pistol_wallslide
	global.player_sprite[spr_flip					,skin_zero_gun] = spr_pl_flip
	global.player_sprite[spr_casual_idle			,skin_zero_gun] = spr_player_pistol_casual_idle
	global.player_sprite[spr_casual_walk			,skin_zero_gun] = spr_player_pistol_casualwalk
	global.player_sprite[spr_casual_walk_backward	,skin_zero_gun]	= spr_player_pistol_casualwalk_backwards
	global.player_sprite[spr_answer_phone			,skin_zero_gun] = spr_pl_answer_phone
	global.player_sprite[spr_hurt					,skin_zero_gun] = spr_player_pistol_hurtfly_begin
	global.player_sprite[spr_hurt_loop				,skin_zero_gun] = spr_player_pistol_hurtfly_loop
	global.player_sprite[spr_hurt_ground			,skin_zero_gun] = spr_player_pistol_hurtground
	global.player_sprite[spr_hurt_ground_to_idle	,skin_zero_gun] = spr_player_pistol_hurtrecover
	global.player_sprite[spr_dragon_slash_dash		,skin_zero_gun] = spr_dragon_dash
#endregion
#region DRAGON
	global.player_sprite[spr_idle					,skin_dragon] = spr_dragon_idle
	global.player_sprite[spr_idle_to_run			,skin_dragon] = spr_dragon_idle_to_run
	global.player_sprite[spr_run					,skin_dragon] = spr_dragon_run
	global.player_sprite[spr_run_to_idle			,skin_dragon] = spr_dragon_run_to_idle
	global.player_sprite[spr_idle_to_walk			,skin_dragon] = spr_dragon_idle_to_sneak
	global.player_sprite[spr_walk					,skin_dragon] = spr_dragon_sneak
	global.player_sprite[spr_jump					,skin_dragon] = spr_dragon_jump
	global.player_sprite[spr_fall					,skin_dragon] = spr_dragon_fall
	global.player_sprite[spr_attack					,skin_dragon] = spr_dragon_attack
	global.player_sprite[spr_roll					,skin_dragon] = spr_dragon_roll
	global.player_sprite[spr_door_break				,skin_dragon] = spr_dragon_doorkick
	global.player_sprite[spr_door_break_full		,skin_dragon] = spr_dragon_doorkick
	global.player_sprite[spr_wall_grab				,skin_dragon] = spr_dragon_wallgrab
	global.player_sprite[spr_wall_slide				,skin_dragon] = spr_dragon_wallslide
	global.player_sprite[spr_flip					,skin_dragon] = spr_dragon_flip
	global.player_sprite[spr_casual_idle			,skin_dragon] = spr_dragon_casual_idle
	global.player_sprite[spr_casual_walk			,skin_dragon] = spr_dragon_casual_walk
	global.player_sprite[spr_casual_walk_backward	,skin_dragon] = spr_dragon_casual_walk
	global.player_sprite[spr_answer_phone			,skin_dragon] = spr_pl_answer_phone_infinity
	global.player_sprite[spr_hurt					,skin_dragon] = spr_dragon_hurtfly_begin
	global.player_sprite[spr_hurt_loop				,skin_dragon] = spr_dragon_hurtfly
	global.player_sprite[spr_hurt_ground			,skin_dragon] = spr_dragon_hurtground
	global.player_sprite[spr_hurt_ground_to_idle	,skin_dragon] = spr_dragon_hurtrecover
	global.player_sprite[spr_dragon_slash_dash		,skin_dragon] = spr_dragon_dash
#endregion
#region MURASAMA
	global.player_sprite[spr_idle					,skin_murasama] = spr_murasama_idle
	global.player_sprite[spr_idle_to_run			,skin_murasama] = spr_murasama_idle_to_run
	global.player_sprite[spr_run					,skin_murasama] = spr_murasama_run
	global.player_sprite[spr_run_to_idle			,skin_murasama] = spr_murasama_run_to_idle
	global.player_sprite[spr_idle_to_walk			,skin_murasama] = spr_murasama_idle_to_walk
	global.player_sprite[spr_walk					,skin_murasama] = spr_murasama_walk
	global.player_sprite[spr_jump					,skin_murasama] = spr_murasama_jump
	global.player_sprite[spr_fall					,skin_murasama] = spr_murasama_fall
	global.player_sprite[spr_attack					,skin_murasama] = spr_murasama_attack
	global.player_sprite[spr_roll					,skin_murasama] = spr_murasama_ninjarun
	global.player_sprite[spr_door_break				,skin_murasama] = spr_murasama_doorbreak
	global.player_sprite[spr_door_break_full		,skin_murasama] = spr_murasama_doorbreak
	global.player_sprite[spr_wall_grab				,skin_murasama] = spr_murasama_wallgrab
	global.player_sprite[spr_wall_slide				,skin_murasama] = spr_murasama_wallslide
	global.player_sprite[spr_flip					,skin_murasama] = spr_pl_flip
	global.player_sprite[spr_casual_idle			,skin_murasama] = spr_pl_casual_idle
	global.player_sprite[spr_casual_walk			,skin_murasama] = spr_pl_casual_walk
	global.player_sprite[spr_casual_walk_backward	,skin_murasama] = spr_pl_casual_walk_backward
	global.player_sprite[spr_answer_phone			,skin_murasama] = spr_pl_answer_phone
	global.player_sprite[spr_hurt					,skin_murasama] = spr_murasama_hurtfly_begin
	global.player_sprite[spr_hurt_loop				,skin_murasama] = spr_murasama_hurtfly_loop
	global.player_sprite[spr_hurt_ground			,skin_murasama] = spr_murasama_hurtground
	global.player_sprite[spr_hurt_ground_to_idle	,skin_murasama] = spr_murasama_hurtrecover
	global.player_sprite[spr_dragon_slash_dash		,skin_murasama] = spr_murasama_triple_attack
#endregion

function player_get_sprite(spr_,type_) { #region
	return global.player_sprite[spr_,type_]
} #endregion

global.char_switch_id = 0

function slow_motion_reset() { #region
	return global.game_spd/global.slow_motion
} #endregion

function player_set_characters(skin_,gameplay_) { #region
	var i = 0
	var num = argument_count/2
	repeat(num)
	{
		char_switch[i,char_switch_skin]		= argument[0+i*2]
		char_switch[i,char_switch_gameplay]	= argument[1+i*2]
		i++
	}
	char_switch_num = num
	
	if global.char_switch_id >= num
	{global.char_switch_id = 0}
	
	skin_id			= char_switch[global.char_switch_id,char_switch_skin]
	gameplay_mode	= char_switch[global.char_switch_id,char_switch_gameplay]
} #endregion

function player_set_sprite(spr_,type_,img_reset=false){ #region
	sprite_index = global.player_sprite[spr_,type_]
	sprite_id = spr_
	if img_reset
	{image_index = 0}
} #endregion
	
function player_set_char_speedrun_option(){ #region
	with obj_player
	{
		switch global.speedrun_char_mode
		{
			case 1 : //ZERO
				player_set_characters(skin_zero,gameplay_sword) 
				allow_char_switch = false
			break
			case 2 : //Gun ZERO
				player_set_characters(skin_zero_gun,gameplay_gun) 
				allow_char_switch = false
			break
			case 3 : //Infinty
				player_set_characters(skin_infinity,gameplay_sword) 
				allow_char_switch = false
			break
			case 4 : //Fifteen
			player_set_characters(skin_dragon,gameplay_dragon) 
			allow_char_switch = false
			break
			case 5 : //Murasama
			player_set_characters(skin_murasama,gameplay_murasama) 
			allow_char_switch = false
			break
			case 6 : //Gun ZERO + Infinty
				player_set_characters(skin_zero_gun,gameplay_gun,skin_infinity,gameplay_sword) 
				allow_char_switch = true
			break
			case 7 : //Gun ZERO + Fifteen
				player_set_characters(skin_zero_gun,gameplay_gun,skin_dragon,gameplay_dragon) 
				allow_char_switch = true
			break
			case 8 : //Gun ZERO + Murasama
				player_set_characters(skin_zero_gun,gameplay_gun,skin_murasama,gameplay_murasama)
				allow_char_switch = true
			break
		}
	}
} #endregion