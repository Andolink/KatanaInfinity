function image_speed_init(){
	animation_speed = 1
}

function image_speed_get(){
	return animation_speed
}

function image_speed_set(val){
	animation_speed = val
}

function image_speed_update(){
	image_speed = animation_speed*global.game_spd
}