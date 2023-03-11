random_set_seed(1)

global.level_timer = 3600*1.5
global.level_timer_max = global.level_timer

#region CREATE TILE ALPHA

#region GROUND

if layer_exists(layer_get_id("TileSet")) {
	var base_ts_			= layer_get_id("TileSet")
	var base_ts_tilemap_	= layer_tilemap_get_id(base_ts_)
	var base_ts_name		= tileset_get_name(tilemap_get_tileset(base_ts_tilemap_))
	var base_ts_w_			= tilemap_get_width(base_ts_tilemap_)
	var base_ts_h_			= tilemap_get_height(base_ts_tilemap_)

	var new_ts_				= layer_create(layer_get_depth(base_ts_)-1,"TileSetAlpha");
	var new_ts_tilemap_		= layer_tilemap_create(new_ts_, 0, 0, asset_get_index(base_ts_name+"_alpha"), base_ts_w_, base_ts_h_);

	var x_ = 0 var y_ = 0

	repeat(base_ts_h_)
	{
		repeat(base_ts_w_)
		{
			tilemap_set(new_ts_tilemap_,tilemap_get(base_ts_tilemap_,x_,y_),x_,y_)
			x_ ++
		}
		x_ = 0
		y_ ++
	}
}
#endregion
#region BACKGROUND

if layer_exists(layer_get_id("TileSetBack")) {
	var base_ts_			= layer_get_id("TileSetBack")
	var base_ts_tilemap_	= layer_tilemap_get_id(base_ts_)
	var base_ts_name		= tileset_get_name(tilemap_get_tileset(base_ts_tilemap_))
	var base_ts_w_			= tilemap_get_width(base_ts_tilemap_)
	var base_ts_h_			= tilemap_get_height(base_ts_tilemap_)

	var new_ts_				= layer_create(layer_get_depth(base_ts_)-1,"TileSetBackAlpha");
	var new_ts_tilemap_		= layer_tilemap_create(new_ts_, 0, 0, asset_get_index(base_ts_name+"_alpha"), base_ts_w_, base_ts_h_);

	var x_ = 0 var y_ = 0

	repeat(base_ts_h_)
	{
		repeat(base_ts_w_)
		{
			tilemap_set(new_ts_tilemap_,tilemap_get(base_ts_tilemap_,x_,y_),x_,y_)
			x_ ++
		}
		x_ = 0
		y_ ++
	}
}
#endregion

#endregion

instance_create_depth(0,0,0,obj_blood_draw)

with par_enemy
{
	if layer_get_name(layer)="InstancesHardMode"
	&& global.difficulty != 2
	{instance_destroy()}
}

global.enemy_count			= instance_number(par_enemy)
global.enemy_count_start	= global.enemy_count
global.light_count			= instance_number(obj_light_hotel)

if instance_exists(obj_player) && !global.speedrun_mode && room != rm_level_editor && room != rm_level_editor_play
{
	save()
}