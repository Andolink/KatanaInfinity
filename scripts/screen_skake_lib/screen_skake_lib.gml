global.screen_shake = 0
global.screen_shake_intensity = 0
global.screen_shake_intensity_add = 0

function screen_shake_set(time,int,int_add=0){
	global.screen_shake = time
	global.screen_shake_intensity = int
	global.screen_shake_intensity_add = int_add
}