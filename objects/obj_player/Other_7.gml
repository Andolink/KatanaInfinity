if sprite_index = player_get_sprite(spr_idle_to_run,skin_id)		{ player_set_sprite(spr_run,skin_id) 		}
if sprite_index = player_get_sprite(spr_run,skin_id)				{ run_sfx = 0								}
if sprite_index = player_get_sprite(spr_run_to_idle,skin_id)		{ player_set_sprite(spr_idle,skin_id) 		}
if sprite_index = player_get_sprite(spr_idle_to_walk,skin_id)		{ player_set_sprite(spr_walk,skin_id)		}
if sprite_index = player_get_sprite(spr_attack,skin_id)				{ player_set_sprite(spr_fall,skin_id)		}
if sprite_index = player_get_sprite(spr_roll,skin_id)				{  player_set_sprite(spr_run_to_idle,skin_id)
																	   state = state_normal	rool_wait = 3
																	   mov_spd = 0.25}
if sprite_index = player_get_sprite(spr_flip,skin_id)				{ player_set_sprite(spr_fall,skin_id)		}
if sprite_index = player_get_sprite(spr_hurt,skin_id)				{ player_set_sprite(spr_hurt_loop,skin_id)	}
if sprite_index = player_get_sprite(spr_hurt_ground,skin_id)		{ image_speed_set(0)
																	  image_index = image_number-1				}
if sprite_index = player_get_sprite(spr_hurt_ground_to_idle,skin_id){ state = state_normal						}
if sprite_index = player_get_sprite(spr_door_break,skin_id)			{ state = state_normal						}
if sprite_index = player_get_sprite(spr_door_break_full,skin_id)	{ state = state_normal						}
if sprite_index = player_get_sprite(spr_dragon_slash_dash,skin_id)	{ player_set_sprite(spr_attack,skin_id,true)}