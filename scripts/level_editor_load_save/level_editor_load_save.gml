function level_editor_destroy_all() {
	#region DESTROY INSTANCES
		
		instance_destroy(obj_zero_spawn,false)
		instance_destroy(obj_ledit_col,false)
		instance_destroy(obj_ledit_slope,false)
		instance_destroy(obj_ledit_platform,false)
		instance_destroy(obj_ledit_element,false)
		instance_destroy(obj_ledit_exit,false)
		//
		instance_destroy(obj_player,false)
		instance_destroy(obj_player_attack,false)
		instance_destroy(obj_dragon_slash,false)
		instance_destroy(obj_player_ball,false)
		instance_destroy(obj_slow_motion_black_mask,false)
		instance_destroy(obj_player_win_gui,false)
		instance_destroy(obj_player_death_gui,false)
		instance_destroy(obj_player_tuto,false)
		instance_destroy(obj_slash_master,false)
		instance_destroy(obj_slash_fire,false)
		
		instance_destroy(obj_go_arrow,false)
		instance_destroy(obj_exit,false)
		
		instance_destroy(par_enemy,false)
		instance_destroy(obj_enemy_shielcop_slash,false)
		instance_destroy(obj_enemy_redpomp_slash,false)
		instance_destroy(obj_enemy_pomp_slash,false)
		instance_destroy(obj_enemy_ball,false)
		instance_destroy(obj_sci_enemy_ball,false)
		instance_destroy(obj_enemy_trigger,false)
		instance_destroy(obj_enemy_state,false)
		instance_destroy(obj_enemy_terry_slash,false)
		instance_destroy(obj_drone,false)
		instance_destroy(obj_turret,false)
		
		instance_destroy(obj_blood,false)
		instance_destroy(obj_bloodsplatter,false)
		instance_destroy(obj_blood_draw,false)
		
		instance_destroy(obj_panic_switch,false)
		instance_destroy(obj_enemy_door,false)
		instance_destroy(obj_ceiling_laser,false)
		instance_destroy(obj_ceiling_gun,false)
		instance_destroy(obj_ceilling_laser_kill_effect,false)
		instance_destroy(obj_ceilling_laser_hit_box,false)
		instance_destroy(obj_ceilling_gun_hit_box,false)
		instance_destroy(obj_oild_drum,false)
		instance_destroy(obj_prison_alarm,false)
		
		instance_destroy(obj_ceilling_tile,false)
		instance_destroy(obj_ceilling_tile_part,false)
		
		instance_destroy(obj_door,false)
		instance_destroy(obj_door_hitbox,false)
		instance_destroy(obj_door_hitbox_player,false)
		
		instance_destroy(obj_sliding_door_door,false)
		instance_destroy(obj_stomper,false)
		
		instance_destroy(obj_pickable,false)
		instance_destroy(obj_pickable_trow,false)
		instance_destroy(obj_pickable_top_player,false)
		instance_destroy(obj_explosion,false)
		instance_destroy(obj_outside_background,false)
		
		instance_destroy(obj_graph_bar0ti,false)
		instance_destroy(obj_graph_tichat002,false)
		
		instance_destroy(obj_light_hotel,false)
		instance_destroy(obj_light_lab,false)
		instance_destroy(obj_particule_physic,false)
		instance_destroy(obj_particule,false)
		instance_destroy(obj_random_club_human,false)
		
		instance_destroy(obj_light,false)
		
		#endregion
}

function level_editor_quick_save() { #region
	
	quick_save_pos = 0
	
	var nam = "_save"+level_name
	var num = 12
	var nam_ = "LevelEditor/"+nam+string(num)+".txt"
	
	if file_exists(nam_)
	{file_delete(nam_)}
	
	repeat(12)
	{
		num--
		var nam_ = "LevelEditor/"+nam+string(num)+".txt"
		var nam__ = "LevelEditor/"+nam+string(num+1)+".txt"
		if file_exists(nam_)
		{
			file_rename(nam_,nam__)
		}
	}

	level_editor_save(nam+string(0),level_name)
} #endregion

function level_editor_quick_save_undo() { #region
	
	var nam = "LevelEditor/"+"_save"+level_name+string(quick_save_pos)+".txt"
	if file_exists(nam)
	{
		if quick_save_pos = 0 level_editor_quick_save()
		quick_save_pos ++
		level_editor_load("LevelEditor/"+"_save"+level_name+string(quick_save_pos))
		if quick_save_pos = 0 quick_save_pos ++
	}
	
} #endregion

function level_editor_quick_save_redo() { #region
	
	quick_save_pos --
	var nam = "LevelEditor/"+"_save"+level_name+string(quick_save_pos)+".txt"
	if file_exists(nam)
	{
		level_editor_load("LevelEditor/"+"_save"+level_name+string(quick_save_pos))
	}
	else
	{
		quick_save_pos ++
	}
	
} #endregion

function level_editor_save(file_,file_true_name=-1){ #region
	
	var file = file_text_open_write(EDITOR_FOLDER+"LevelEditor/"+file_+".txt")
	if file_true_name = -1
	{file_true_name = file_}
	var data = ""
	#region data
	
	var x_ = -1
	var y_ = -1
	if instance_exists(obj_zero_spawn)
	{
		x_ = obj_zero_spawn.x
		y_ = obj_zero_spawn.y
	}

	data += "data["
	data += string(room_width)
	data += ","
	data += string(room_height)
	data += ","
	data += file_true_name
	data += ","
	data += string(x_)
	data += ","
	data += string(y_)
	data += ","
	data += string(global.level_editor_ts_ground)
	data += ","
	data += string(global.level_editor_ts_wall)
	data += ","
	data += string(global.level_editor_music)
	data += ","
	data += string(global.level_editor_background)
	data += ","
	data += string(global.level_editor_timer)
	data += ","
	data += string(global.level_editor_col_visi)
	data += ","
	data += string(global.editor_mode)
	data += "]"

	with obj_ledit_exit
	{
		data += "exit["
		data += string(x)
		data += ","
		data += string(y)
		data += ","
		data += string(image_xscale)
		data += ","
		data += string(image_yscale)
		data += ","
		data += string(image_angle)
		data += "]"
	}

	#endregion
	
	#region tileset

	if layer_exists(layer_get_id("TileSet")) { #region
		var base_ts_			= layer_get_id("TileSet")
		var base_ts_tilemap_	= layer_tilemap_get_id(base_ts_)
		var base_ts_w_			= tilemap_get_width(base_ts_tilemap_)
		var base_ts_h_			= tilemap_get_height(base_ts_tilemap_)
		
		var x_ = 0 var y_ = 0
		
		data += "tilesetground["
		data += tileset_get_name(obj_level_editor.tilset_ground) data += ","
		data += sprite_get_name(obj_level_editor.tilset_ground_spr) data += ","
		
		repeat(base_ts_h_)
		{
			repeat(base_ts_w_)
			{
				var cur_tile_ = tilemap_get(base_ts_tilemap_,x_,y_)
				
				if !(x_ = 0 && y_ = 0)
				{data += ","}

				var empty = tile_get_empty(cur_tile_)
				
				if empty
				{
					data += "-"
				}
				else
				{
					data += string(tile_get_index(cur_tile_)) 
					//data += ","
					//data += string(tile_get_mirror(cur_tile_)) data += ","
					//data += string(tile_get_flip(cur_tile_)) data += ","
					//data += string(tile_get_mirror(cur_tile_))
				}
				x_ ++
			}
			x_ = 0
			y_ ++
		}
		
		data += "]"
	} #endregion
	if layer_exists(layer_get_id("TileSetBack")) { #region
		var base_ts_			= layer_get_id("TileSetBack")
		var base_ts_tilemap_	= layer_tilemap_get_id(base_ts_)
		var base_ts_w_			= tilemap_get_width(base_ts_tilemap_)
		var base_ts_h_			= tilemap_get_height(base_ts_tilemap_)
		
		var x_ = 0 var y_ = 0
		
		data += "tilesetwall["
		data += tileset_get_name(obj_level_editor.tilset_wall) data += ","
		data += sprite_get_name(obj_level_editor.tilset_wall_spr) data += ","
		
		repeat(base_ts_h_)
		{
			repeat(base_ts_w_)
			{
				var cur_tile_ = tilemap_get(base_ts_tilemap_,x_,y_)
				
				if !(x_ = 0 && y_ = 0)
				{data += ","}
				
				var empty = tile_get_empty(cur_tile_)
				
				if empty
				{
					data += "-"
				}
				else
				{
					data += string(tile_get_index(cur_tile_)) 
					//data += ","
					//data += string(tile_get_mirror(cur_tile_)) data += ","
					//data += string(tile_get_flip(cur_tile_)) data += ","
					//data += string(tile_get_mirror(cur_tile_))
				}
				x_ ++
			}
			x_ = 0
			y_ ++
		}
		
		data += "]"
	} #endregion

	#endregion

	#region ground

	with obj_ledit_col
	{
		data += "ground["
		data += sprite_get_name(sprite_index)
		data += ","
		data += string(x)
		data += ","
		data += string(y)
		data += ","
		data += object_get_name(object)
		data += ","
		data += string(image_xscale)
		data += ","
		data += string(image_yscale)
		data += "]"
	}
	
	with obj_ledit_slope
	{
		data += "slope["
		data += sprite_get_name(sprite_index)
		data += ","
		data += string(x)
		data += ","
		data += string(y)
		data += ","
		data += object_get_name(object)
		data += ","
		data += string(image_xscale)
		data += "]"
	}

	with obj_ledit_platform
	{
		data += "platform["
		data += sprite_get_name(sprite_index)
		data += ","
		data += string(x)
		data += ","
		data += string(y)
		data += ","
		data += object_get_name(object)
		data += ","
		data += string(image_xscale)
		data += "]"
	}

	#endregion
	
	#region element

	with obj_ledit_element
	{
		data += "element["
		data += sprite_get_name(sprite_index)
		data += ","
		data += string(x)
		data += ","
		data += string(y)
		data += ","
		data += object_get_name(object)
		data += ","
		data += string(image_xscale)
		data += "]"
	}
	
	#endregion
	
	file_text_write_string(file,data)
	file_text_close(file)
} #endregion

function level_editor_load(file_){ #region

	var load_ = false

	if file_exists(EDITOR_FOLDER+file_+".txt")
	{
		var file = file_text_open_read(EDITOR_FOLDER+file_+".txt")
		var data = file_text_read_string(file)
		var pos	 = 1
		var curr = ""
		
		level_editor_destroy_all()
		
		repeat(string_length(data))
		{
			curr += string_char_at(data,pos)
	
			#region ground
			
			if curr = "ground["
			{
				with instance_create_depth(x,y,0,obj_ledit_col)
				{
					var typ = 0
					curr = ""
					while(string_char_at(data,pos) != "]")
					{
						pos ++
				
						while(string_char_at(data,pos) != "," && string_char_at(data,pos) != "]")
						{
							curr += string_char_at(data,pos) 
							pos ++
						}
				
						var result = curr
				
						switch typ
						{
							case 0 : sprite_index	= asset_get_index(result)	break
							case 1 : x				= real(result)				break
							case 2 : y				= real(result)				break
							case 3 : object			= asset_get_index(result)	break
							case 4 : image_xscale	= real(result)				break
							case 5 : image_yscale	= real(result)				break
						}
				
						typ ++
						curr = ""
					}
				}
			}
			
			#endregion
				
			#region slope
			
			else if curr = "slope["
			{
				with instance_create_depth(x,y,0,obj_ledit_slope)
				{
					var typ = 0
					curr = ""
					while(string_char_at(data,pos) != "]")
					{
						pos ++
				
						while(string_char_at(data,pos) != "," && string_char_at(data,pos) != "]")
						{
							curr += string_char_at(data,pos) 
							pos ++
						}
				
						var result = curr
				
						switch typ
						{
							case 0 : sprite_index	= asset_get_index(curr) break
							case 1 : x				= real(result) break
							case 2 : y				= real(result) break
							case 3 : object			= asset_get_index(curr) break
							case 4 : image_xscale	= real(result) break
						}
				
						typ ++
						curr = ""
					}
				}
			}
			
			#endregion
			
			#region platform
			
			else if curr = "platform["
			{
				with instance_create_depth(x,y,0,obj_ledit_platform)
				{
					var typ = 0
					curr = ""
					while(string_char_at(data,pos) != "]")
					{
						pos ++
				
						while(string_char_at(data,pos) != "," && string_char_at(data,pos) != "]")
						{
							curr += string_char_at(data,pos) 
							pos ++
						}
				
						var result = curr
				
						switch typ
						{
							case 0 : sprite_index	= asset_get_index(curr) break
							case 1 : x				= real(result) break
							case 2 : y				= real(result) break
							case 3 : object			= asset_get_index(curr) break
							case 4 : image_xscale	= real(result) break
						}
				
						typ ++
						curr = ""
					}
				}
			}
			
			#endregion
			
			#region element
			
			else if curr = "element["
			{
				with instance_create_depth(x,y,0,obj_ledit_element)
				{
					var typ = 0
					curr = ""
					while(string_char_at(data,pos) != "]")
					{
						pos ++
				
						while(string_char_at(data,pos) != "," && string_char_at(data,pos) != "]")
						{
							curr += string_char_at(data,pos) 
							pos ++
						}
					
						var result = curr
				
						switch typ
						{
							case 0 : sprite_index	= asset_get_index(curr) break
							case 1 : x				= real(result) break
							case 2 : y				= real(result) break
							case 3 : object			= asset_get_index(curr) break
							case 4 : image_xscale	= real(result) break
						}
				
						xstart = x
						ystart = y
				
						typ ++
						curr = ""
					}
				}
			}
			
			#endregion
			
			#region tilesetground
			
			else if curr = "tilesetground["
			{
				var base_ts_			= layer_get_id("TileSet")
				var base_ts_tilemap_	= layer_tilemap_get_id(base_ts_)
				var base_ts_w_			= tilemap_get_width(base_ts_tilemap_)
				
				var x_ = 0 var y_ = 0
		
				var typ		= 0
				var typ_	= 0
				var t_ind	= 0
				
				curr = ""
				while(string_char_at(data,pos) != "]")
				{
					pos ++
					var char_at = string_char_at(data,pos)
					
					while(char_at != "," && char_at != "]")
					{
						curr += char_at
						pos ++
						
						char_at = string_char_at(data,pos)
					}
					
					var result = curr

					if typ = 0
					{}
					else if typ = 1
					{}
					else if result = "-"
					{
						var base_tile_ = tilemap_get(base_ts_tilemap_,x_,y_)
						cur_tile_ = tile_set_empty(base_tile_)
						
						if cur_tile_ != base_tile_
							tilemap_set(base_ts_tilemap_,cur_tile_,x_,y_)
						
						typ_ = 0 x_ ++
					
						if x_ >= base_ts_w_
						{x_ = 0 y_++}
					}
					else
					{
						t_ind= real(result)	
					
						var base_tile_ = tilemap_get(base_ts_tilemap_,x_,y_)
						cur_tile_ = tile_set_index(	base_tile_,t_ind)
						
						if cur_tile_ != base_tile_
							tilemap_set(base_ts_tilemap_,cur_tile_,x_,y_)	
							
						x_ ++
						if x_ >= base_ts_w_
						{x_ = 0 y_++}
					}

					typ ++
					curr = ""
				}
			}
			
			#endregion
			
			#region tilesetwall
			
			else if curr = "tilesetwall["
			{
				var base_ts_			= layer_get_id("TileSetBack")
				var base_ts_tilemap_	= layer_tilemap_get_id(base_ts_)
				var base_ts_w_			= tilemap_get_width(base_ts_tilemap_)
				
				var x_ = 0 var y_ = 0
		
				var typ		= 0
				var typ_	= 0
				var t_ind	= 0
				
				curr = ""
				while(string_char_at(data,pos) != "]")
				{
					pos ++
					var char_at = string_char_at(data,pos)
					
					while(char_at != "," && char_at != "]")
					{
						curr += char_at
						pos ++
						
						char_at = string_char_at(data,pos)
					}
					
					var result = curr

					if typ = 0
					{}
					else if typ = 1
					{}
					else if result = "-"
					{
						var base_tile_ = tilemap_get(base_ts_tilemap_,x_,y_)
						cur_tile_ = tile_set_empty(base_tile_)
						
						if cur_tile_ != base_tile_
							tilemap_set(base_ts_tilemap_,cur_tile_,x_,y_)
						
						typ_ = 0 x_ ++
					
						if x_ >= base_ts_w_
						{x_ = 0 y_++}
					}
					else
					{
						t_ind= real(result)	
					
						var base_tile_ = tilemap_get(base_ts_tilemap_,x_,y_)
						cur_tile_ = tile_set_index(	base_tile_,t_ind)
						
						if cur_tile_ != base_tile_
							tilemap_set(base_ts_tilemap_,cur_tile_,x_,y_)	
							
						x_ ++
						if x_ >= base_ts_w_
						{x_ = 0 y_++}
					}

					typ ++
					curr = ""
				}
			}
			
			#endregion
			
			#region exit
			
			if curr = "exit["
			{
				with instance_create_depth(x,y,0,obj_ledit_exit)
				{
					var typ = 0
					curr = ""
					while(string_char_at(data,pos) != "]")
					{
						pos ++
				
						while(string_char_at(data,pos) != "," && string_char_at(data,pos) != "]")
						{
							curr += string_char_at(data,pos) 
							pos ++
						}
				
						var result = curr
				
						switch typ
						{
							case 0 : x				= real(result)				break
							case 1 : y				= real(result)				break
							case 2 : image_xscale	= real(result)				break
							case 3 : image_yscale	= real(result)				break
							case 4 : image_angle	= real(result)				break
						}
				
						typ ++
						curr = ""
					}
				}
			}
			
			#endregion
			
			#region data
			
			else if curr = "data["
			{
				global.editor_mode = 0
				instance_create_depth(0,0,0,obj_zero_spawn)
				
				var typ = 0
				curr = ""
				while(string_char_at(data,pos) != "]")
				{
					pos ++
				
					while(string_char_at(data,pos) != "," && string_char_at(data,pos) != "]")
					{
						curr += string_char_at(data,pos) 
						pos ++
					}
				
					var result = curr
			
					switch typ
					{
						case 0 : room_width						= real(result)	break
						case 1 : room_height					= real(result)	break
						case 2 : level_name 					= result		break
						case 3 : var x_  						= real(result)	break
						case 4 : var y_			 				= real(result)	break
						case 5 : global.level_editor_ts_ground	= result		break
						case 6 : global.level_editor_ts_wall	= result		break
						case 7 : global.level_editor_music		= result		break
						case 8 : global.level_editor_background	= result		break
						case 9 : global.level_editor_timer		= real(result)	break
						case 10: global.level_editor_col_visi	= real(result)	break
						case 11: global.editor_mode				= real(result)	break
					}
				
					typ ++
					curr = ""
				}
				
				if global.editor_mode = 1
				{instance_destroy(obj_zero_spawn)}
				with obj_zero_spawn
				{
					x = x_
					y = y_
				}
			
				level_editor_set_tileset_ground(global.level_editor_ts_ground)
				level_editor_set_tileset_wall(global.level_editor_ts_wall)
				if room = rm_level_editor 
					level_editor_set_music(global.level_editor_music)
				level_editor_set_background(global.level_editor_background)
				
				var w_ = floor(room_width/16)
				if w_ != room_width/16
				{w_ ++}
				
				var h_ = floor(room_height/16)
				if h_ != room_height/16
				{h_ ++}
				
				var lay_id = layer_get_id("TileSet")
				var tile_id = layer_tilemap_get_id(lay_id)
				tilemap_set_width(tile_id,w_)
				tilemap_set_height(tile_id,h_)
	
				var lay_id = layer_get_id("TileSetBack")
				var tile_id = layer_tilemap_get_id(lay_id)
				tilemap_set_width(tile_id,w_)
				tilemap_set_height(tile_id,h_)
			}
			
			#endregion
			
			pos++
		}
		
		load_ = true
		file_text_close(file)
	}
	else
	{
		level_editor_create_message("The level is not existing")
	}
	
	return load_
} #endregion

function level_editor_play(){ #region

	with obj_ledit_exit
	{
		with instance_create_depth(x,y-2,depth,obj_exit)
		{
			image_xscale = other.image_xscale
			image_yscale = other.image_yscale
			image_angle = other.image_angle
		}
		instance_destroy()
	}
	
	with obj_zero_spawn
	{
		instance_create_depth(x,y-2,depth,obj_player)
		if x < room_width/2
		{global.cutscene_id = "PLAYERstart"}
		else
		{global.cutscene_id = "PLAYERstart_right"}

		instance_destroy()
	}

	with obj_ledit_element
	{
		with instance_create_depth(x,y,depth,object)
		{
			image_xscale = other.image_xscale
		}
		instance_destroy()
	}

	with obj_ledit_col
	{
		//with instance_create_depth(x,y,depth,par_collision)
		//{
		//	image_xscale = other.image_xscale
		//	image_yscale = other.image_yscale
		//}
		//instance_destroy()
	}
	
	with obj_level_control
	{
		event_user(0)
		global.level_timer		= global.level_editor_timer*60
		global.level_timer_max	= global.level_timer
	}
} #endregion

#region TILESET LIST

global.tileset_ground_list[ 0]="Global"
global.tileset_ground_list[ 1]="Motel"
global.tileset_ground_list[ 2]="Club"
global.tileset_ground_list[ 3]="Outside"
global.tileset_ground_list[ 4]="Bunker"
global.tileset_ground_list[ 5]="Chinatown"
global.tileset_ground_list[ 6]="Government"
global.tileset_ground_list[ 7]="Factory"

global.tileset_wall_list[ 0]="Global"
global.tileset_wall_list[ 1]="Motel"
global.tileset_wall_list[ 2]="Club"
global.tileset_wall_list[ 3]="Bunker"
global.tileset_wall_list[ 4]="Government"
global.tileset_wall_list[ 5]="Factory"

#endregion

function level_editor_set_tileset_ground(name){ #region
	var val0 = ts_factory var val1 = spr_tile_factory
	switch(name)
	{
		case "Global"		: val0 = ts_ground_global val1 = spr_ts_ground_global break
		case "Motel"		: val0 = ts_motel val1 = spr_tile_motel break
		case "Club"			: val0 = ts_club val1 = spr_tile_club break
		case "Outside"		: val0 = ts_outside val1 = spr_tile_outside break
		case "Bunker"		: val0 = ts_bunker val1 = spr_tile_bunker break
		case "Chinatown"	: val0 = ts_chinatown val1 = spr_tile_chinatown break
		case "Government"	: val0 = ts_government val1 = spr_tile_government break
		case "Factory"		: val0 = ts_factory val1 = spr_tile_factory break
	}
	
	with obj_level_editor
	{
		tilset_ground = val0
		tilset_ground_spr = val1
	}
	
	var lay_id = layer_get_id("TileSet");
	var tile_id = layer_tilemap_get_id(lay_id);
	tilemap_tileset(tile_id, val0)
	
} #endregion
function level_editor_set_tileset_wall(name){ #region
	var val0 = ts_factory_wall var val1 = spr_tile_factory_wall
	switch(name)
	{
		case "Global"		: val0 = ts_wall_global val1 = spr_ts_wall_global break
		case "Motel"		: val0 = ts_motel_wall val1 = spr_tile_motel_wall break
		case "Club"			: val0 = ts_club_wall val1 = spr_tile_club_wall break
		case "Bunker"		: val0 = ts_bunker_wall val1 = spr_tile_bunker_wall break
		case "Government"	: val0 = ts_government_wall val1 = spr_tile_government_wall break
		case "Factory"		: val0 = ts_factory_wall val1 = spr_tile_factory_wall break
	}
	
	with obj_level_editor
	{
		tilset_wall = val0
		tilset_wall_spr = val1
	}
	
	var lay_id = layer_get_id("TileSetBack");
	var tile_id = layer_tilemap_get_id(lay_id);
	tilemap_tileset(tile_id, val0);
} #endregion

#region BACKGROUND LIST

global.background_list[ 0]="Skyline"
global.background_list[ 1]="City"
global.background_list[ 2]="Chinatown"
global.background_list[ 3]="Roof"
global.background_list[ 4]="Beach"

#endregion
function level_editor_set_background(name){ #region
	
	global.level_editor_background = name
	
} #endregion

#region OST LIST

global.level_editor_music_intro = -1
global.level_editor_music_loop = mus_levelselect

global.ost_list[ 0]="Infinity"
global.ost_list[ 1]="Katana ZERO"
global.ost_list[ 2]="Sneaky Driver"
global.ost_list[ 3]="Disturbed Lines"
global.ost_list[ 4]="You Will Never Know"
global.ost_list[ 5]="Third District"
global.ost_list[ 6]="Meat Grinder"
global.ost_list[ 7]="All For Now"
global.ost_list[ 8]="Overdose"
global.ost_list[ 9]="Neon Fog"
global.ost_list[10]="Chinatown"
global.ost_list[11]="Breath Of A Serpent"
global.ost_list[12]="Delusive Bunker"
global.ost_list[13]="Full Confession"
global.ost_list[14]="Rain On Brick"
global.ost_list[15]="Silhouette"
global.ost_list[16]="The Sandman 1"
global.ost_list[17]="Nocturne"
global.ost_list[18]="Volition"
global.ost_list[19]="Coming Down"
global.ost_list[20]="A Fine Red Mist"
global.ost_list[21]="Panoramic Feelings"
global.ost_list[22]="Psychotherapy"
global.ost_list[23]="Prison Air 1"
global.ost_list[24]="Prison Air 2"
global.ost_list[25]="Hit The Floor"
global.ost_list[26]="Kill Your TV"
global.ost_list[27]="Tied Up The Moment"
global.ost_list[28]="A Tense Moment"
global.ost_list[29]="Snow"
global.ost_list[30]="End Of The Road"
global.ost_list[31]="Come and See"
global.ost_list[32]="The Sandman 2"
global.ost_list[33]="Blue Room"
global.ost_list[34]="At Home"
global.ost_list[35]="V Limo"
global.ost_list[36]="Worst Neighbors Ever"
global.ost_list[37]="Boss Boss Boss"
global.ost_list[38]="Brick on Rain Cover"
global.ost_list[39]="Dispersal Mission"
global.ost_list[40]="Underground Mission"
global.ost_list[41]="Tryharder 27"
global.ost_list[42]="Meeting with my PSY"

#endregion
function level_editor_set_music(music_name){ #region
	
	var val0 = -1 var val1 = -1
	switch(music_name)
	{
		case "Infinity"				: val0 = -1 val1 = mus_level_editor break
		case "Katana ZERO"			: val0 = -1 val1 = mus_katanazero break
		case "Sneaky Driver"		: val0 = -1 val1 = mus_sneaky_driver break
		case "Disturbed Lines"		: val0 = -1 val1 = mus_v_theme break
		case "You Will Never Know"	: val0 = -1 val1 = mus_youwillneverknow break
		case "Third District"		: val0 = -1 val1 = mus_thirddistrict break
		case "Meat Grinder"			: val0 = -1 val1 = mus_slaughterhouse break
		case "All For Now"			: val0 = -1 val1 = mus_bossbattle break
		case "Overdose"				: val0 = -1 val1 = mus_bunker_1 break
		case "Neon Fog"				: val0 = -1 val1 = mus_drivingforce break
		case "Chinatown"			: val0 = -1 val1 = mus_chinatown break
		case "Breath Of A Serpent"	: val0 = -1 val1 = mus_dragon break
		case "Delusive Bunker"		: val0 = -1 val1 = mus_bunker_2 break
		case "Full Confession"		: val0 = -1 val1 = mus_fullconfession break
		case "Rain On Brick"		: val0 = -1 val1 = mus_rainonbrick break
		case "Silhouette"			: val0 = -1 val1 = mus_silhouette break
		case "The Sandman 1"		: val0 = -1 val1 = mus_dreambounce break
		case "Nocturne"				: val0 = -1 val1 = mus_nocturne break
		case "Volition"				: val0 = -1 val1 = mus_volition break
		case "Coming Down"			: val0 = -1 val1 = mus_comingdown break
		case "A Fine Red Mist"		: val0 = -1 val1 = mus_redmist break
		case "Panoramic Feelings"	: val0 = -1 val1 = mus_rooftop break
		case "Psychotherapy"		: val0 = -1 val1 = mus_mindgames break
		case "Prison Air 1"			: val0 = -1 val1 = mus_graveyard break
		case "Prison Air 2"			: val0 = -1 val1 = mus_graveyard_2 break
		case "Hit The Floor"		: val0 = -1 val1 = mus_edm break
		case "Kill Your TV"			: val0 = -1 val1 = mus_killyourtv break
		case "Tied Up The Moment"	: val0 = -1 val1 = mus_tiedupatthemoment break
		case "A Tense Moment"		: val0 = -1 val1 = mus_tensemoment break
		case "Snow"					: val0 = -1 val1 = mus_snow break
		case "End Of The Road"		: val0 = -1 val1 = mus_end_of_the_road break
		case "Come and See"			: val0 = mus_ending val1 = mus_ending_2 break
		case "The Sandman 2"		: val0 = -1 val1 = mus_nightmare break
		case "Blue Room"			: val0 = mus_precathedral val1 = mus_cathedral break
		case "At Home"				: val0 = -1 val1 = mus_levelselect break
		case "V Limo"				: val0 = -1 val1 = mus_limo break
		case "Worst Neighbors Ever"	: val0 = -1 val1 = mus_neighbormusic break
		case "Boss Boss Boss"		: val0 = -1 val1 = mus_monster break
		case "Brick on Rain Cover"	: val0 = mus_rainonbrick_cover_intro val1 = mus_rainonbrick_cover_loop break
		case "Dispersal Mission"	: val0 = mus_dispersal_mission_intro val1 = mus_dispersal_mission_theme break
		case "Underground Mission"	: val0 = mus_underground_mission_intro val1 = mus_underground_mission_theme break
		case "Tryharder 27"			: val0 = -1 val1 = mus_together break
		case "Meeting with my PSY"	: val0 = mus_katanaback_intro val1 = mus_katanaback_loop break
	}
	
	global.level_editor_music_intro = val0
	global.level_editor_music_loop = val1
} #endregion

function delete_temp_level_files() { #region
	var file_name = file_find_first("LevelEditor/*.txt", fa_directory);

	while (file_name != "")
	{
		if string_char_at(file_name,1)="_"
		{
			file_delete("LevelEditor/"+file_name)
		}
		file_name = file_find_next()
	}

	file_find_close();
} #endregion

//switch typ_ //OLD TILESET LOAD+
//{
//	case 0 : t_ind= real(result)	typ_++ break
//	case 1 : t_mir= real(result)	typ_++ break
//	case 2 : t_fli= real(result)	typ_++ break
//	case 3 : t_rot= real(result)	
										
//			 var cur_tile_ = tilemap_get(base_ts_tilemap_,x_,y_)

//			 cur_tile_ = tile_set_index(	cur_tile_,t_ind)
//			 cur_tile_ = tile_set_mirror(	cur_tile_,t_mir)
//			 cur_tile_ = tile_set_flip(		cur_tile_,t_fli)
//			 cur_tile_ = tile_set_rotate(	cur_tile_,t_rot)
									 
//			 tilemap_set(base_ts_tilemap_,cur_tile_,x_,y_)
									
//			 typ_ = 0 x_ ++
//			 if x_ >= base_ts_w_
//			 {x_ = 0 y_++}
//	break
//}