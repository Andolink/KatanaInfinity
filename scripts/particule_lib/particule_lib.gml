#macro particule part_particles_create

function particule_create(x_,y_,depth_,spr_,ind_=0,imgspd_=1,draw_end_=false){
	var inst = instance_create_depth(x_,y_,depth_,obj_particule)
	inst.sprite_index = spr_
	inst.image_index = ind_
	with inst image_speed_set(imgspd_)
	inst.draw_end = draw_end_
	
	return inst
}