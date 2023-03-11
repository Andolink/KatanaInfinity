global.sleep_var = 0

function sleep_update(){
	if global.sleep_var > 0 
		global.sleep_var -= 1/global.hitpause_lvl
	else
		global.sleep_var = 0
}

function sleep(val){
	global.sleep_var = val
}