image_index ++

audio_play_sound(sound_player_kickdoor,999,0)

if hit_box_damage_enemy 
	instance_create_depth(x,y,depth,obj_door_hitbox).image_xscale = image_xscale
else
	instance_create_depth(x,y,depth,obj_door_hitbox_player).image_xscale = image_xscale
	
image_speed_set(1)
open = true
solid = false
screen_shake_set(3,8,-2)
mask_index = spr_no_col_mask

enemy_create_trigger(150)