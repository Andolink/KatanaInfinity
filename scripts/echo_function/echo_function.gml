function echo_create(x_,y_,depth_,spr_,img_,xsc_,ysc_,ang_,alp_,col_,life_,add_=false,shake_=0,shd=false){
	with instance_create_depth(x_,y_,depth_,obj_echo)
	{
		sprite_index = spr_
		image_index = img_
		image_alpha = alp_ alp_max = alp_
		image_blend = col_
		image_xscale = xsc_
		image_yscale = ysc_
		image_angle = ang_
		bm_add_mode = add_
		life_max = life_
		life = life_
		shake= shake_
		shader=shd
	}
}