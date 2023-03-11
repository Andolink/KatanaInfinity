var mouse_gui_x = device_mouse_x_to_gui(0)
var mouse_gui_y = device_mouse_y_to_gui(0)

#region OBJECT MENU

object_menu_x = lerp(object_menu_x,GAME_WIDTH-150,.2)

if mouse_gui_x > object_menu_x && !placing_col
&& !instance_exists(obj_ledit_message)
{
	object_menu_y_scroll_tar += (mouse_wheel_down()-mouse_wheel_up())*16
}
else
{
	//object_menu_x = lerp(object_menu_x,GAME_WIDTH-16,.1)
}

object_menu_y_scroll = lerp(object_menu_y_scroll,object_menu_y_scroll_tar,.4)

draw_sprite(spr_ledit_object_menu,0,object_menu_x,0)

#region EVENT MENU

var i = 0

var x_ = object_menu_x+35
var y_ = 10

repeat(17)
{
	if (i = 6) || (i = 12)  || (i = 15)
	{y_ += 18 x_ = object_menu_x+35}
		
	draw_sprite(spr_ledit_icons,i+1,x_,y_)
	
	if mouse_gui_x > x_-8 && mouse_gui_x <= x_+20-8
	&& mouse_gui_y > y_-8 && mouse_gui_y <= y_+8
	&& !instance_exists(obj_ledit_message)
	{
		draw_sprite(spr_ledit_icons,0,x_,y_)
		if MBT_PRS(mb_left)
		{
			switch i 
			{
				case 0 : #region //NEW
				event_user(3)
				break #endregion
				case 1 : #region //LOAD
				event_user(2)
				break #endregion
				case 2 : #region //SAVE
				event_user(1)
				break #endregion
				case 3 : #region //PLAY
				event_user(0)
				break #endregion
				case 4 : #region //UNDO
				event_user(4)
				break #endregion
				case 5 : #region //REDO
				event_user(5)
				break #endregion
				
				case 6 : #region //RESIZE X ROOM
					
				with level_editor_create_message("Set the room width (720 or more) :",ledit_message_type_write,function(){
					level_editor_quick_save()
					
					room_width	= real(string_digits(obj_ledit_message.typed_text))
					room_width = clamp(room_width,720,99999999999)
					
					var w_ = floor(room_width/16)
					if w_ != room_width/16
					{w_ ++}
					
					var lay_id = layer_get_id("TileSet")
					var tile_id = layer_tilemap_get_id(lay_id)
					tilemap_set_width(tile_id,w_)
					
					var lay_id = layer_get_id("TileSetBack")
					var tile_id = layer_tilemap_get_id(lay_id)
	
					tilemap_set_width(tile_id,w_)
				})
				{keyboard_string = string(room_width)}
					
				break #endregion
				case 7 : #region //RESIZE Y ROOM
			
				with level_editor_create_message("Set the room height (405 or more) :",ledit_message_type_write,function(){
					level_editor_quick_save()
					
					room_height	= real(string_digits(obj_ledit_message.typed_text))
					room_height = clamp(room_height,405,99999999999)
					
					var h_ = floor(room_height/16)
					if h_ != room_height/16
					{h_ ++}
					
					var lay_id = layer_get_id("TileSet")
					var tile_id = layer_tilemap_get_id(lay_id)
					tilemap_set_height(tile_id,h_)
	
					var lay_id = layer_get_id("TileSetBack")
					var tile_id = layer_tilemap_get_id(lay_id)
	
					tilemap_set_height(tile_id,h_)
					
				})
				{keyboard_string = string(room_height)}
				
				break #endregion
				case 8 : #region //BACKGROUND
				
				var _text = "Choose a Background : [scale,.5]\n\n"
				var i = 0
				repeat(array_length(global.background_list))
				{
					if i != 0
					{
						_text += " | "
					}
					_text += global.background_list[i]
					i++
				}
				
				with level_editor_create_message(_text,ledit_message_type_write,function(){
					level_editor_set_background(obj_ledit_message.typed_text)
				})
				{keyboard_string = global.level_editor_background}
				
				break #endregion
				case 9 : #region //GROUND
				
				var _text = "Choose a Ground TileSet : [scale,.5]\n\n"
				var i = 0
				repeat(array_length(global.tileset_ground_list))
				{
					if i != 0
					{
						_text += " | "
					}
					_text += global.tileset_ground_list[i]
					i++
				}
				
				
				with level_editor_create_message(_text,ledit_message_type_write,function(){
					level_editor_set_tileset_ground(obj_ledit_message.typed_text)
					global.level_editor_ts_ground = obj_ledit_message.typed_text
				})
				{keyboard_string = global.level_editor_ts_ground}
				
				break #endregion
				case 10: #region //WALL
				
				var _text = "Choose a Wall Tileset : [scale,.5]\n\n"
				var i = 0
				repeat(array_length(global.tileset_wall_list))
				{
					if i != 0
					{
						_text += " | "
					}
					_text += global.tileset_wall_list[i]
					i++
				}
				
				with level_editor_create_message(_text,ledit_message_type_write,function(){
					level_editor_set_tileset_wall(obj_ledit_message.typed_text)
					global.level_editor_ts_wall = obj_ledit_message.typed_text
				})
				{keyboard_string = global.level_editor_ts_wall}
				
				break #endregion
				case 11: #region //LIGHTING
					
				with level_editor_create_message("Set the Global Lighting Color[scale,.5]"
												+"\n\n"+"Format used : ([c_red]R[/c],[c_green]G[/c],[c_blue]B[/c])"
												+"\n"+"Values must be between : 0-255",ledit_message_type_write,function(){
					global.level_editor_light_color = obj_ledit_message.typed_text
					var colr = "0" var colg = "0" var colb = "0"
					var i = 1
					var col = 0
					while col < 3
					{
						var st = string_char_at(global.level_editor_light_color,i)
						
						if st="," || st=""
						{col++}
						else
						{
							switch col 
							{
								case 0 : colr += st break
								case 1 : colg += st break
								case 2 : colb += st break
							}
						}
						i++
					}
					
					colr = real(string_digits(colr))
					colg = real(string_digits(colg))
					colb = real(string_digits(colb))
					
					global.level_editor_light_color = make_color_rgb(colr,colg,colb)
				})
				{
					keyboard_string = string(color_get_red	(global.level_editor_light_color))+","
									+ string(color_get_green(global.level_editor_light_color))+","
									+ string(color_get_blue	(global.level_editor_light_color))
				}
				
				break #endregion
				
				case 12: #region //MUSIC
				
				var _text = "Choose an OST : [scale,.5]\n\n"
				var i = 0
				repeat(array_length(global.ost_list))
				{
					if i != 0
					{
						_text += " | "
					}
					_text += global.ost_list[i]
					i++
				}
				
				
				with level_editor_create_message(_text,ledit_message_type_write,function(){
					level_editor_set_music(obj_ledit_message.typed_text)
					global.level_editor_music = obj_ledit_message.typed_text
				})
				{keyboard_string = global.level_editor_music}
				
				break #endregion
				case 13: #region //TIMER
					
				with level_editor_create_message("Set the Timer (in seconds) : ",ledit_message_type_write,function(){
					global.level_editor_timer = real(string_digits(obj_ledit_message.typed_text))
				})
				{keyboard_string = string(global.level_editor_timer)}
				
				break #endregion
				case 14: #region //COLLISION VISIBLE
					
				global.level_editor_col_visi = !global.level_editor_col_visi
				if global.level_editor_col_visi = 1 audio_play_sound(sound_menubeep_2,999,0)
				if global.level_editor_col_visi = 0 audio_play_sound(sound_menubeep_1,999,0)
				
				break #endregion
				
				case 15: #region //PLACE
					
				placing_ele	= 0
				placing_col = -1
				grab = -1
				placing_platform = -1
				selection_state = 0
				
				break #endregion
				
				case 16: #region //SELECT
					
				placing_ele	= -1
				placing_col = -1
				grab = -1
				placing_platform = -1
				selection_state = 0
				
				break #endregion
				
				//Music normale
			}
		}
	}
	i++
	x_+=20
}

#endregion

object_menu_y = object_menu_y_start

draw_set_font(global.font_text)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
level_editor_draw_folder(folder_terrain		,"Collisions"	,c_red)
level_editor_draw_folder(folder_door		,"Doors"		,c_red)
level_editor_draw_folder(folder_ceillingtile,"Ceiling Tiles",c_red)
if global.editor_mode = 0
{
	level_editor_draw_folder(folder_obstacle	,"Obstacles"	,c_orange)
	level_editor_draw_folder(folder_enemy		,"Enemies"		,c_lime)
	level_editor_draw_folder(folder_pickable	,"Pickables"	,c_navy)
}
else
{
	level_editor_draw_folder(folder_actors		,"Actors"		,c_fuchsia)
}
level_editor_draw_folder(folder_decoration	,"Decorations"	,c_white)

#endregion

#region TILSET MENU

if mouse_gui_x < tilset_menu_x && !placing_col
&& !instance_exists(obj_ledit_message)
{
	tilset_menu_x = lerp(tilset_menu_x,200,.2)
	if !tilset_menu_sc_lock 
		tilset_menu_y_scroll_tar += (mouse_wheel_down()-mouse_wheel_up())*16
}
else
{
	tilset_menu_x = lerp(tilset_menu_x,16,.1)
}

tilset_menu_y_scroll = lerp(tilset_menu_y_scroll,tilset_menu_y_scroll_tar,.4)

draw_sprite_ext(spr_ledit_object_menu,0,tilset_menu_x,0,-1,1,0,c_white,1)

tilset_menu_y = tilset_menu_y_start

tilset_menu_sc_lock = false
level_editor_draw_tileset_folders()

#endregion

