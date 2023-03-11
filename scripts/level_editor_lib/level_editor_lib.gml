global.editor_mode = 0
global.editor_cutscene_move = true

function level_editor_add_object(folder_id_,name_) { #region
	folder_id_[0,0] = folder_id_[0,0]+1
	folder_id_[folder_id_[0,0]]=name_
}
#endregion

function level_editor_draw_folder(folder_id,folder_name,color) { #region
	var mouse_gui_x = device_mouse_x_to_gui(0)
	var mouse_gui_y = device_mouse_y_to_gui(0)
	
	var i = 0
	repeat folder_id[0,0]+1
	{
		draw_set_halign(fa_left)
		var x0 = object_menu_x+26
		var y0 = object_menu_y-object_menu_y_scroll
		var x1 = GAME_WIDTH-2
		var y1 = object_menu_y-object_menu_y_scroll+16
		
		if y0 >= object_menu_y_start && y0 <= GAME_HEIGHT-16
		{
			if i = 0
			{
				#region
				draw_set_color(color)
				draw_set_alpha(0.6)
				draw_rectangle(x0,y0,x1,y1,false)
				draw_set_color(c_white)
				draw_set_alpha(1)
						
				if mouse_gui_x > x0 && mouse_gui_x < x1
				&& mouse_gui_y > y0 && mouse_gui_y < y1
				&& !instance_exists(obj_ledit_message)
				{
					draw_set_color(c_white)
					draw_set_alpha(0.25)
					draw_rectangle(x0,y0,x1,y1,false)
					draw_set_alpha(1)
					if MBT_PRS(mb_left)
					{
						folder_id[0,1]=!folder_id[0,1]
						if folder_id[0,1] = 1 audio_play_sound(sound_menubeep_2,999,0)
						if folder_id[0,1] = 0 audio_play_sound(sound_menubeep_1,999,0)
					}
				}
				#endregion
				
				draw_text(x0,y0,"° "+folder_name)
			}
			else
			{
				#region
				
				draw_set_color(color)
				draw_set_alpha(0.25)
				draw_rectangle(x0,y0,x1,y1,false)
				draw_set_color(c_white)
				draw_set_alpha(1)
			
				if selected_object = folder_id[i]
				{
					draw_set_color(c_white)
					draw_set_alpha(0.25)
					draw_rectangle(x0,y0,x1,y1,false)
					draw_set_alpha(1)
				}
			
				if mouse_gui_x > x0 && mouse_gui_x < x1
				&& mouse_gui_y > y0 && mouse_gui_y < y1
				&& !instance_exists(obj_ledit_message)
				{
					draw_set_color(c_white)
					draw_set_alpha(0.25)
					draw_rectangle(x0,y0,x1,y1,false)
					draw_set_alpha(1)
					if MBT_PRS(mb_left)
					{
						audio_play_sound(sound_menubeep_2,999,0)
						selected_object = folder_id[i]
						current_object	= level_editor_get_object_info(selected_object)
						placing_ele		= 0
					}
				}
			
				draw_text(x0+16,y0,folder_id[i])
				
				#endregion
			}		
		}
		
		object_menu_y += 16
		i++
		
		
		if !folder_id[0,1] exit
	}
}
#endregion

function level_editor_add_tilset_folder(layer_name,color,folder_name,sprite,selected_tile,zoom) { #region
	tilset_folder[0]++
	
	tilset_folder[tilset_folder[0],0]=layer_name
	tilset_folder[tilset_folder[0],1]=true
	tilset_folder[tilset_folder[0],2]=color
	tilset_folder[tilset_folder[0],3]=folder_name
	tilset_folder[tilset_folder[0],4]=sprite
	tilset_folder[tilset_folder[0],5]=selected_tile
	tilset_folder[tilset_folder[0],6]=zoom
	tilset_folder[tilset_folder[0],7]=0 //x dec
	tilset_folder[tilset_folder[0],8]=0 //y dec
	tilset_folder[tilset_folder[0],9]=0 //xsize selec
	tilset_folder[tilset_folder[0],10]=0//ysize selec
}
#endregion

function level_editor_draw_tileset_folders() { #region
	var mouse_gui_x = device_mouse_x_to_gui(0)
	var mouse_gui_y = device_mouse_y_to_gui(0)
	
	var i = 1
	repeat(tilset_folder[0])
	{
		var col = tilset_folder[i,2]
		var x0 = 0
		var y0 = tilset_menu_y-tilset_menu_y_scroll
		var x1 = tilset_menu_x-26
		var y1 = tilset_menu_y-tilset_menu_y_scroll+16
	
		draw_set_color(col)
		draw_set_alpha(0.6)
		draw_rectangle(x0,y0,x1,y1,false)
		draw_set_color(c_white)
		draw_set_alpha(1)
		draw_set_halign(fa_right)
						
		if mouse_gui_x > x0 && mouse_gui_x < x1
		&& mouse_gui_y > y0 && mouse_gui_y < y1
		{
			draw_set_color(c_white)
			draw_set_alpha(0.25)
			draw_rectangle(x0,y0,x1,y1,false)
			draw_set_alpha(1)
			if MBT_PRS(mb_left)
			{
				tilset_folder[i,1]=!tilset_folder[i,1]
			}
		}	
	
		draw_text(x1,y0,tilset_folder[i,3]+" °")
		
		if tilset_folder[i,1]
		{
			switch(tilset_folder[i,4])
			{
				case 0 : 
					var spr = tilset_ground_spr
				break
				case 1 : 
					var spr = tilset_wall_spr
				break
			}
			
			var spr_w = sprite_get_width(spr)
			var spr_h = sprite_get_height(spr)
			draw_sprite_part_ext(spr,0,
			tilset_folder[i,7],tilset_folder[i,8],(x1-x0)*tilset_folder[i,6],200*tilset_folder[i,6],x0,y0+16,
			1/tilset_folder[i,6],1/tilset_folder[i,6],c_white,1)
			draw_set_color(c_white)
			
			var tile_w = spr_w/16
			var tile_h = spr_h/16
			
			var stile_id = tilset_folder[i,5]
			
			var stile_x = stile_id
			while stile_x >= tile_w
			{stile_x -= tile_w}
			stile_x *= 16
			var stile_y = floor(stile_id/tile_w)*16
			
			var siz = tilset_folder[i,6]
			
			draw_rectangle(
			x0-tilset_folder[i,7]/siz+1/siz+stile_x/siz-(200-tilset_menu_x)/siz,
			y0+16-tilset_folder[i,8]/siz+1/siz+stile_y/siz,
			x0-tilset_folder[i,7]/siz+16*tilset_folder[i,9]/siz+stile_x/siz-(200-tilset_menu_x)/siz,
			y0+16-tilset_folder[i,8]/siz+16*tilset_folder[i,10]/siz+stile_y/siz,1)
			
			tilset_menu_y += 16+200
			
			if mouse_gui_x < x1 && mouse_gui_x > x0
			&& mouse_gui_y < y0+16+200 &&mouse_gui_y > y0+16
			&& !instance_exists(obj_ledit_message)
			{
				var m_wheel = mouse_wheel_down()-mouse_wheel_up()
				//if KEY_PRS(vk_control) 
				//	tilset_folder[tilset_folder[0],6]+=m_wheel*.1
				//else 
				if KEY(vk_control) 
					tilset_folder[i,6]+=m_wheel*.35
				else if KEY(vk_shift) 
					tilset_folder[i,7]+=m_wheel*32*tilset_folder[i,6]
				else
					tilset_folder[i,8]+=m_wheel*32*tilset_folder[i,6]
				
				if tilset_folder[i,7] > spr_w-174*siz
				{tilset_folder[i,7] = spr_w-174*siz}
				if tilset_folder[i,8] > spr_h-200*siz
				{tilset_folder[i,8] = spr_h-200*siz}
				
				if tilset_folder[i,7] < 0
				{tilset_folder[i,7] = 0}
				if tilset_folder[i,8] < 0
				{tilset_folder[i,8] = 0}
				
				tilset_menu_sc_lock = true
				
				if MBT_PRS(mb_left)
				{
					tilset_folder[i,5]	= floor(((mouse_gui_x+tilset_folder[i,7]/siz)*siz)/16)
										+(floor(((mouse_gui_y+tilset_folder[i,8]/siz)-(y0+16))*siz/16)*tile_w)
					tilset_edit			= tilset_folder[i,0]
					tilset_index		= tilset_folder[i,5]
					placing_ele			= 1
					
					tilset_mouse_x_last = mouse_gui_x
					tilset_mouse_y_last = mouse_gui_y
					
					tilset_mouse_x_last_ = floor(mouse_gui_x/16/siz)*16*siz
					tilset_mouse_y_last_ = floor(mouse_gui_y/16/siz)*16*siz
					
					tilset_xselect = 1
					tilset_yselect = 1
					
					tilset_width = tile_w
				}
				
				if MBT(mb_left)
				{
					var x_val_ = floor(((tilset_mouse_x_last+tilset_folder[i,7]/siz)*siz)/16)
					var y_val_ = (floor(((tilset_mouse_y_last+tilset_folder[i,8]/siz)-(y0+16))*siz/16)*tile_w)
					
					if mouse_gui_x >= tilset_mouse_x_last
					{
						tilset_folder[i,9]	= clamp(floor((mouse_gui_x-tilset_mouse_x_last)*siz/16)+1, 0,99)
					}
					else
					{
						tilset_folder[i,9]	= clamp(floor((tilset_mouse_x_last_-1/siz-mouse_gui_x)*siz/16)+2, 0,99)
						x_val_				= floor(((mouse_gui_x+tilset_folder[i,7]/siz)*siz)/16)
					}
					
					if mouse_gui_y >= tilset_mouse_y_last
					{
						tilset_folder[i,10] = clamp(floor((mouse_gui_y-tilset_mouse_y_last)*siz/16)+1, 0,99)
					}
					else
					{
						tilset_folder[i,10] = clamp(floor((tilset_mouse_y_last_+1/siz-mouse_gui_y)*siz/16)+2, 0,99)
						y_val_				= (floor(((mouse_gui_y+tilset_folder[i,8]/siz)-(y0+16))*siz/16)*tile_w)
					}
					
					tilset_folder[i,5]	= x_val_+y_val_
					
					tilset_edit			= tilset_folder[i,0]
					tilset_index		= tilset_folder[i,5]
					
					tilset_xselect = tilset_folder[i,9]
					tilset_yselect = tilset_folder[i,10]
				}
			}
		}
		else
		{
			tilset_menu_y += 16
		}
		i++
	}
}
#endregion

#macro ledit_obj_info_ledit_index	0
#macro ledit_obj_info_object_index	1
#macro ledit_obj_info_sprite		2
#macro ledit_obj_info_offx			3
#macro ledit_obj_info_offy			4
#macro ledit_obj_info_animated		5
#macro ledit_obj_info_gridx			6
#macro ledit_obj_info_gridy			7

function level_editor_set_object_info(obj_ld_index,obj_index,spr,offx,offy,anim=false,grid_xsize=16,grid_ysize=16) { #region
	return [obj_ld_index,obj_index,spr,offx,offy,anim,grid_xsize,grid_ysize]
} #endregion

function level_editor_get_object_info(object_name) { #region
	
	var info
	switch object_name
	{
		case "Ground"			: info = level_editor_set_object_info(obj_ledit_col,par_collision,spr_ledit_col,0,0) break
		case "Slope"			: info = level_editor_set_object_info(obj_ledit_slope,par_slope,spr_ledit_slope,0,0) break
		case "Platform"			: info = level_editor_set_object_info(obj_ledit_platform,par_platform,spr_ledit_platform,0,0) break
		
		case "C-Tile Wood"		: info = level_editor_set_object_info(obj_ledit_element,obj_ceilling_tile0,spr_ceiling_tile0,8,0) break
		case "C-Tile Wood 2"	: info = level_editor_set_object_info(obj_ledit_element,obj_ceilling_tile1,spr_ceiling_tile1,8,0) break
		case "C-Tile Stone"		: info = level_editor_set_object_info(obj_ledit_element,obj_ceilling_tile2,spr_ceiling_tile2,8,0) break
		
		case "Door Wood"		: info = level_editor_set_object_info(obj_ledit_element,obj_door0,spr_door,0,0) break
		case "Door Club"		: info = level_editor_set_object_info(obj_ledit_element,obj_door1,spr_door1,0,0) break
		case "Door Metal"		: info = level_editor_set_object_info(obj_ledit_element,obj_door2,spr_door2,0,0) break
		case "Door Mansion"		: info = level_editor_set_object_info(obj_ledit_element,obj_door3,spr_door3,0,0) break
		
		case "Terry"			: info = level_editor_set_object_info(obj_ledit_element,obj_enemy_terry,spr_grunt_idle,0,-2,true,8,8) break
		case "Pomp"				: info = level_editor_set_object_info(obj_ledit_element,obj_enemy_pomp,spr_pomp_idle,0,-8,true,8,8) break
		case "Cop"				: info = level_editor_set_object_info(obj_ledit_element,obj_enemy_cop,spr_cop_idle,0,-8,true,8,8) break
		case "Shiel Cop"		: info = level_editor_set_object_info(obj_ledit_element,obj_enemy_shielcop,spr_shieldcop_idle,0,-3,true,8,8) break
		case "Shot Gun"			: info = level_editor_set_object_info(obj_ledit_element,obj_enemy_shotgun,spr_shotgun_idle,0,-9,true,8,8) break
		case "Scientist"		: info = level_editor_set_object_info(obj_ledit_element,obj_enemy_sci,spr_sci_idle,0,0,true,8,8) break
		case "Red Pomp"			: info = level_editor_set_object_info(obj_ledit_element,obj_enemy_redpomp,spr_redpomp_idle,0,-4,true,8,8) break
		case "Machine Gun"		: info = level_editor_set_object_info(obj_ledit_element,obj_enemy_machinegun,spr_machinegun_idle,0,0,true,8,8) break
		case "Blue Pomp"		: info = level_editor_set_object_info(obj_ledit_element,obj_enemy_bluepomp,spr_bluepomp_idle,0,-4,true,8,8) break
		
		case "Turret"			: info = level_editor_set_object_info(obj_ledit_element,obj_turret,spr_floor_turret_edit,0,-1,false,8,8) break
		case "Drone"			: info = level_editor_set_object_info(obj_ledit_element,obj_drone,spr_drone,0,0,false,8,8) break
		
		case "Lazer (On)"		: info = level_editor_set_object_info(obj_ledit_element,obj_ceiling_laser,spr_ceiling_laser_on,0,0) break
		case "Lazer (Off)"		: info = level_editor_set_object_info(obj_ledit_element,obj_ceiling_laser_off,spr_ceiling_laser_off,0,0) break
		case "Ceiling Gun"		: info = level_editor_set_object_info(obj_ledit_element,obj_ceiling_gun,spr_ceiling_gun,0,0) break
		case "Panic Switch"		: info = level_editor_set_object_info(obj_ledit_element,obj_panic_switch,spr_panic_switch,0,0) break
		case "Stair"			: info = level_editor_set_object_info(obj_ledit_element,obj_enemy_door,spr_enemy_door,0,8) break
		case "Sliding Door"		: info = level_editor_set_object_info(obj_ledit_element,obj_sliding_door_door,spr_sliding_door,0,0) break
		case "Prison Alarm"		: info = level_editor_set_object_info(obj_ledit_element,obj_prison_alarm,spr_prison_alarm,0,0) break
		case "Oil Drum"			: info = level_editor_set_object_info(obj_ledit_element,obj_oild_drum,spr_oil_drum,0,0) break
		case "Stomper"			: info = level_editor_set_object_info(obj_ledit_element,obj_stomper,spr_stomper_top,0,0) break
		
		case "Bottle"			: info = level_editor_set_object_info(obj_ledit_element,obj_pickable_bottle1,spr_beer_bottle1,0,8) break
		case "Bottle 2"			: info = level_editor_set_object_info(obj_ledit_element,obj_pickable_bottle2,spr_beer_bottle2,0,8) break
		case "Bottle 3"			: info = level_editor_set_object_info(obj_ledit_element,obj_pickable_bottle3,spr_beer_bottle3,0,8) break
		case "Bottle 4"			: info = level_editor_set_object_info(obj_ledit_element,obj_pickable_bottle4,spr_beer_bottle4,0,8) break
		case "Bust"				: info = level_editor_set_object_info(obj_ledit_element,obj_pickable_bust,spr_bust,0,2) break
		case "Lamp"				: info = level_editor_set_object_info(obj_ledit_element,obj_pickable_lamp,spr_lamp,0,7) break
		case "Potted Plant"		: info = level_editor_set_object_info(obj_ledit_element,obj_pickable_potted_plant,spr_potted_plant,0,6) break
		case "Knife"			: info = level_editor_set_object_info(obj_ledit_element,obj_pickable_knife,spr_knife,0,14) break
		case "Butcher Knife"	: info = level_editor_set_object_info(obj_ledit_element,obj_pickable_butcher_knife,spr_butcher_knife,0,7) break
		case "Smoke Vial"		: info = level_editor_set_object_info(obj_ledit_element,obj_pickable_smoke_vial,spr_smoke_vial,0,7) break
		case "Flame Thrower"	: info = level_editor_set_object_info(obj_ledit_element,obj_pickable_flamethrower,spr_flamethrower,0,6) break
		case "Mine & Remote"	: info = level_editor_set_object_info(obj_ledit_element,obj_pickable_remote_mine_and_remote,spr_remote_mine_and_remote,0,7) break
		case "Explosive Vial"	: info = level_editor_set_object_info(obj_ledit_element,obj_pickable_explosive_vial,spr_explosive_vial,0,6) break
		
		case "Club Dancer"		: info = level_editor_set_object_info(obj_ledit_element,obj_random_club_human,spr_clubgirl_1,0,16) break
		case "Club Light"		: info = level_editor_set_object_info(obj_ledit_element,obj_light_night_club,spr_lantern,0,0,,1,1) break
		case "Light Hotel"		: info = level_editor_set_object_info(obj_ledit_element,obj_light_hotel,spr_light_hotel,0,9) break
		case "Light Lab"		: info = level_editor_set_object_info(obj_ledit_element,obj_light_lab,spr_light_lab,0,8) break
		case "Neon Light 1"		: info = level_editor_set_object_info(obj_ledit_element,obj_neon_factory,spr_lantern,0,0,,1,1) break
		case "Neon Light 2"		: info = level_editor_set_object_info(obj_ledit_element,obj_neon_outside,spr_lantern,0,0) break
		case "Neon Light 3"		: info = level_editor_set_object_info(obj_ledit_element,obj_neon_psychentrance,spr_lantern,0,0,,1,1) break
		case "Spotlight"		: info = level_editor_set_object_info(obj_ledit_element,obj_spotlight,spr_spotlight_limelight,0,0,,1,1) break
		
		case "Zero"				: info = level_editor_set_object_info(obj_ledit_element,obj_zero_playable_cutscene,spr_pl_casual_idle,0,-2) break
		case "Zero No Sword"	: info = level_editor_set_object_info(obj_ledit_element,obj_zero_playable_cutscene,spr_dragon_casual_idle,0,-2) break
		case "Fifteen"			: info = level_editor_set_object_info(obj_ledit_element,obj_zero_playable_cutscene,spr_dragon_casual_idle,0,-2) break
		case "Infinity"			: info = level_editor_set_object_info(obj_ledit_element,obj_zero_playable_cutscene,spr_pl_casual_idle_infinity,0,-2) break
		case "Murasama"			: info = level_editor_set_object_info(obj_ledit_element,obj_zero_playable_cutscene,spr_murasama_idle,0,-2) break
	}
	return info
}
#endregion

function level_editor_element_init() { #region
	globalgrab = false
	x_dec = 0
	y_dec = 0
} #endregion

function level_editor_grab_object(col_exit=true) { #region
	
	if instance_exists(obj_level_editor)
	{	
		if globalgrab
		{
			if MBT(mb_left)
			{
				if KEY(vk_control)
				{
					x = mouse_x+x_dec
					y = mouse_y+y_dec
				}
				else
				{
					x = floor(mouse_x/16)*16+x_dec
					y = floor(mouse_y/16)*16+y_dec
				}
			}
		}
		else if position_meeting(mouse_x,mouse_y,id) && MBT_PRS(mb_left) && !obj_level_editor.mouse_on_gui
		&& obj_level_editor.placing_ele < 1
		&& obj_level_editor.selection_state = 0
		{
			obj_level_editor.grab = id
			x_dec = x-mouse_x
			y_dec = y-mouse_y
			with obj_level_editor level_editor_quick_save()
		}
		else 
		if obj_level_editor.grab = id
		{
			x = mouse_x+x_dec
			y = mouse_y+y_dec
			
			if KEY_PRS(ord("X"))
			{image_xscale *= -1}
			
			if col_exit collision_free()
			
			if MBT_RLS(mb_left)
			{
				obj_level_editor.grab = -1
			}
		}
	}
} #endregion

#macro ledit_message_type_write		0
#macro ledit_message_type_yes_no	1
#macro ledit_message_type_array		2

function level_editor_create_message(text_,type_=0,func_=-1) { #region
	var inst = instance_create_depth(0,0,0,obj_ledit_message)
	with inst
	{
		text = text_
		func = func_
	}
	return inst
} #endregion