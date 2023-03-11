speedrun_option_reset()

instance_create_depth(0,0,0,obj_ledit_background)

placing_ele	= -1
placing_col = -1
grab = -1
placing_platform = -1

selection_state = 0

object_menu_x = GAME_WIDTH-16
object_menu_y_start	= 100
object_menu_y = object_menu_y_start
object_menu_y_scroll = 0
object_xscale = -1

tilset_folder[0]=0
level_editor_add_tilset_folder("TileSet",c_aqua,"Ground",0,0,1)
level_editor_add_tilset_folder("TileSetBack",c_navy,"Wall",1,0,1)

cursor_x	= 0
cursor_y	= 0

cursor_x_visual		= cursor_x
cursor_y_visual		= cursor_y
cursor_xsc			= -1
tilset_menu_y_scroll_tar = 0
object_menu_y_scroll_tar = 0

tilset_ground		= ts_ground_global
tilset_ground_spr	= spr_ts_ground_global

tilset_wall			= ts_wall_global
tilset_wall_spr		= spr_ts_wall_global

tilset_menu_sc_lock = false

tilset_mouse_x_last = 0
tilset_mouse_y_last = 0

tilset_xselect	= 0
tilset_yselect	= 0

tilset_edit		= "TileSet"

tilset_menu_x = 16
tilset_menu_y_start	= 100
tilset_menu_y = object_menu_y_start
tilset_menu_y_scroll = 0

tilset_index	= 0
tilset_mirror	= false
tilset_flip		= false
tilset_rotate	= 0
tilset_xselect	= 0
tilset_yselect	= 0
tilset_width	= 0

cursor_image = 0

mouse_on_gui = false
selected_object = "Ground"
current_object = level_editor_get_object_info(selected_object)
grid_x_size	= current_object[ledit_obj_info_gridx]
grid_y_size	= current_object[ledit_obj_info_gridy]

cursor_x = 0
cursor_y = 0

level_name = ""
quick_save_pos = 0

global.level_editor_timer		= 90
global.level_editor_light_color = c_yellow
global.level_editor_col_visi	= true

global.level_editor_ts_ground	= "Global"
global.level_editor_ts_wall		= "Global"
global.level_editor_music		= "At Home"
global.level_editor_background	= "Skyline"

global.level_editor_music_intro = -1
global.level_editor_music_loop  = mus_levelselect

event_user(6)
if global.editor_mode = 1
	instance_destroy(obj_zero_spawn)

if global.level_load_name != ""
{
	level_editor_load("LevelEditor/"+global.level_load_name)
	global.level_load_name = ""
}