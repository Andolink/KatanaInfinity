global.audio_bullet_refelect_buffer = 0
function bullet_update() {
	if global.audio_bullet_refelect_buffer > 0 
		global.audio_bullet_refelect_buffer --
}

time_source_start(time_source_create(time_source_game, 1, time_source_units_frames, bullet_update, [], -1, time_source_expire_after)) 

function create_bullet(x_,y_,depth_,dir_,spd_,sprite_=spr_enemy_ball,player_side=false){ #region
	var inst = obj_enemy_ball
	if player_side inst = obj_player_ball

	inst = instance_create_depth(x_,y_,depth_,inst)
	
	with inst
	{
		image_yscale = .75
		image_angle = dir_
		sprite_index = sprite_
		dir = dir_
		spd = spd_
	}
	
	return inst
} #endregion

function create_psy_bullet(x_,y_,depth_,dir_,spd_){ #region
	var inst = obj_sci_enemy_ball

	inst = instance_create_depth(x_,y_,depth_,inst)
	
	with inst
	{
		image_angle = dir_
		dir = dir_
		spd = spd_
	}
	
	return inst
} #endregion


function create_psych_bullet(x_,y_,depth_,dir_,spd_,start_,start_count_=999999){ #region
	var inst = obj_psych_bullet

	inst = instance_create_depth(x_,y_,depth_,inst)
	
	with inst
	{
		image_angle = dir_
		dir = dir_
		spd = spd_
		start = start_
		start_count = start_count_
	}
	
	return inst
} #endregion