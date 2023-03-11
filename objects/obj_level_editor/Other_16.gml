/// @description DEFINE FOLDERS

global.editor_mode = 0

folder_terrain		[0]	=[0,false] #region
level_editor_add_object(folder_terrain,"Ground")
level_editor_add_object(folder_terrain,"Slope")
level_editor_add_object(folder_terrain,"Platform")
#endregion

folder_door			[0]	=[0,false] #region
level_editor_add_object(folder_door,"Door Wood")
level_editor_add_object(folder_door,"Door Club")
level_editor_add_object(folder_door,"Door Metal")
level_editor_add_object(folder_door,"Door Mansion")
#endregion

folder_ceillingtile	[0]	=[0,false] #region
level_editor_add_object(folder_ceillingtile,"C-Tile Wood")
level_editor_add_object(folder_ceillingtile,"C-Tile Wood 2")
level_editor_add_object(folder_ceillingtile,"C-Tile Stone")
#endregion

if global.editor_mode = 0
{
	#region LEVEL
	
	folder_enemy		[0]	=[0,false] #region
		level_editor_add_object(folder_enemy,"Terry")
		level_editor_add_object(folder_enemy,"Pomp")
		level_editor_add_object(folder_enemy,"Cop")
		level_editor_add_object(folder_enemy,"Shiel Cop")
		level_editor_add_object(folder_enemy,"Shot Gun")
		level_editor_add_object(folder_enemy,"Scientist")
		level_editor_add_object(folder_enemy,"Red Pomp")
		level_editor_add_object(folder_enemy,"Machine Gun")
		level_editor_add_object(folder_enemy,"Blue Pomp")
	#endregion

	folder_obstacle		[0]	=[0,false] #region
		level_editor_add_object(folder_obstacle,"Lazer (On)")
		level_editor_add_object(folder_obstacle,"Lazer (Off)")
		level_editor_add_object(folder_obstacle,"Ceiling Gun")
		level_editor_add_object(folder_obstacle,"Panic Switch")
		level_editor_add_object(folder_obstacle,"Sliding Door")
		level_editor_add_object(folder_obstacle,"Stomper")
		level_editor_add_object(folder_obstacle,"Oil Drum")
		level_editor_add_object(folder_obstacle,"Stair")
		level_editor_add_object(folder_obstacle,"Turret")
		level_editor_add_object(folder_obstacle,"Drone")
		level_editor_add_object(folder_obstacle,"Prison Alarm")
	#endregion

	folder_pickable		[0]	=[0,false] #region
		level_editor_add_object(folder_pickable,"Bottle")
		level_editor_add_object(folder_pickable,"Bottle 2")
		level_editor_add_object(folder_pickable,"Bottle 3")
		level_editor_add_object(folder_pickable,"Bottle 4")
		level_editor_add_object(folder_pickable,"Bust")
		level_editor_add_object(folder_pickable,"Lamp")
		level_editor_add_object(folder_pickable,"Potted Plant")
		level_editor_add_object(folder_pickable,"Knife")
		level_editor_add_object(folder_pickable,"Butcher Knife")
		//level_editor_add_object(folder_pickable,"Smoke Vial")
		//level_editor_add_object(folder_pickable,"Flame Thrower")
		//level_editor_add_object(folder_pickable,"Mine & Remote")
		level_editor_add_object(folder_pickable,"Explosive Vial")
	
	#endregion

	
	#endregion
}
else
{
	#region CUTSCENE
	
	folder_actors	[0]	=[0,false] #region
	level_editor_add_object(folder_actors,"Zero")
	level_editor_add_object(folder_actors,"Zero No Sword")
	level_editor_add_object(folder_actors,"Fifteen")
	level_editor_add_object(folder_actors,"Infinity")
	level_editor_add_object(folder_actors,"Murasama")
	#endregion
	
	#endregion
}

folder_decoration	[0]	=[0,false] #region
	level_editor_add_object(folder_decoration,"Club Dancer")
	level_editor_add_object(folder_decoration,"Club Light")
	level_editor_add_object(folder_decoration,"Light Hotel")
	level_editor_add_object(folder_decoration,"Light Lab")
	level_editor_add_object(folder_decoration,"Neon Light 1")
	level_editor_add_object(folder_decoration,"Neon Light 2")
	level_editor_add_object(folder_decoration,"Neon Light 3")
	//level_editor_add_object(folder_decoration,"Spotlight")
	
#endregion