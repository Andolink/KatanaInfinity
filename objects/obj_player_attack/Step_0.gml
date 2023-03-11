if !instance_exists(creator)
{instance_destroy() exit}

if sprite_index = spr_no_col_mask
{
	var sfx_ = choose(sound_player_slash_1,sound_player_slash_2,sound_player_slash_3)
	if sword = -1 
		sword = creator.sword
	switch(sword)
	{
		case sword_normal	: sprite_index = spr_slash break
		case sword_dragon	: sprite_index = spr_dragon_attack_slash break
		case sword_mura		: sprite_index = spr_murasama_slash break
		case sword_color	: sprite_index = spr_color_slash
							  sfx_ = choose(sound_player_prismsword_slash_01,sound_player_prismsword_slash_02,sound_player_prismsword_slash_03) break 
		case sword_big		: sprite_index = spr_broadsword_slash 
							  sfx_ = choose(sound_player_claymore_slash_01,sound_player_claymore_slash_02,sound_player_claymore_slash_03) break
		case sword_flame	: sprite_index = spr_flamesword_slash
			repeat(4)
			{
				var ang_ = image_angle+random_range(-30,30)
				with instance_create_depth(x+lengthdir_x(36,ang_),y+lengthdir_y(36,ang_),depth,obj_slash_fire)
				{ang = ang_ spd = 4.2+random(.8)}
			}
			sfx_ = choose(sound_player_phoenix_slash_01,sound_player_phoenix_slash_02,sound_player_phoenix_slash_03) break 
		break
		case sword_old		: sprite_index = spr_oldslash  break
		case sword_master	: sprite_index = spr_master_slash 
							  var ang_ = image_angle
							  if creator.attack_master = 1
							  {
									with instance_create_depth(x+lengthdir_x(40,ang_),y+lengthdir_y(40,ang_),depth,obj_slash_master)
									{ang = ang_}
									creator.attack_master = 0
							  }
							  sfx_ = choose(sound_player_mastersword_slash_01,sound_player_mastersword_slash_02,sound_player_mastersword_slash_03) break
		case sword_short	: sprite_index = choose(spr_short_slash_1,spr_short_slash_2,spr_short_slash_3)
							  sfx_ = choose(sound_player_knife_slash_01,sound_player_knife_slash_02,sound_player_knife_slash_03) break
	}
	
	audio_play_sound(sfx_,999,0)
}

x = creator.x
y = creator.y

image_speed = creator.player_game_speed

