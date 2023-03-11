global.starting_room = rm_cutscene_intro

function save() { #region

	ini_open("save.ini")

	ini_write_real("SAVE","stroom",room)
	ini_write_real("SAVE","zeinfr",global.zero_infinity_relation)
	
	ini_close()
	
} #endregion

function load() { #region

	ini_open("save.ini")
	
	global.starting_room			= ini_read_real("SAVE","stroom",global.starting_room)
	global.zero_infinity_relation	= ini_read_real("SAVE","zeinfr",global.zero_infinity_relation)
	
	ini_close()
	
} #endregion