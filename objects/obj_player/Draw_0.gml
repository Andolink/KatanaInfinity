if switch_char_effect > 0
{
	BktGlitch_activate(sprite_width,sprite_height)
	BktGlitch_set_intensity(0.15*switch_char_effect);BktGlitch_set_line_shift(0.008667);BktGlitch_set_line_speed(0.056667);BktGlitch_set_line_resolution(3.000000);BktGlitch_set_line_drift(1.000000);BktGlitch_set_line_vertical_shift(0.173333);BktGlitch_set_noise_level(0.246667);BktGlitch_set_jumbleness(0.033333);BktGlitch_set_jumble_speed(4.166667);BktGlitch_set_jumble_resolution(0.073333);BktGlitch_set_jumble_shift(0.000000);BktGlitch_set_channel_shift(0.009000);BktGlitch_set_channel_dispersion(0.013333);BktGlitch_set_shakiness(4.533333);BktGlitch_set_rng_seed(random(1));//////Alternatively:BktGlitch_config(0.008667, 0.056667, 3.000000, 1.000000, 0.173333, 0.033333, 4.166667, 0.073333, 0.000000, 0.246667, 0.009000, 0.013333, 4.533333, 0.066667, 0.180000);
	
	draw_sprite_part_ext(switch_char_old_sprite,switch_char_old_img_index,0,0+sprite_height*(1-switch_char_effect),
	switch_char_old_w*image_xscale,switch_char_old_h*switch_char_effect,x-switch_char_old_xoff,y-switch_char_old_yoff+sprite_height*(1-switch_char_effect),
	image_xscale,image_yscale,image_blend,image_alpha)
	draw_sprite_part_ext(sprite_index,image_index,0,0,
	sprite_width*image_xscale,sprite_height*switch_char_effect,x-sprite_xoffset,y-sprite_yoffset,
	image_xscale,image_yscale,image_blend,image_alpha)
	shader_reset()
}
else
{
	if (sprite_index = player_get_sprite(spr_idle,3) || sprite_index = player_get_sprite(spr_attack,3))
	{
		var dir_ = point_direction(x,y-6,global.input_aim_x,global.input_aim_y)
		draw_sprite_ext(spr_player_pistol_arm,0,x,y-6,1,image_xscale,dir_,image_blend,1)
		gpu_set_blendmode(bm_add)
		apply_light_effect(spr_player_pistol_arm,0,x,y-6,1,image_xscale,dir_,image_blend,1)	
		gpu_set_blendmode(bm_normal)
	}
	
	draw_self_light()
	
	if (sprite_index = player_get_sprite(spr_idle,3) || sprite_index = player_get_sprite(spr_attack,3))
	{
		var dir_ = point_direction(x,y-6,global.input_aim_x,global.input_aim_y)
		draw_sprite_ext(spr_player_pistol_arm,1,x,y-6,1,image_xscale,dir_,image_blend,1)
		gpu_set_blendmode(bm_add)
		apply_light_effect(spr_player_pistol_arm,1,x,y-6,1,image_xscale,dir_,image_blend,1)	
		gpu_set_blendmode(bm_normal)
	}
}

if attack_timer > 0
	draw_healthbar(x-8,y-24,x+8,y-22,(attack_timer/attack_timer_max)*100,c_black,c_aqua,c_aqua,0,true,true)

if dragon_slash_timer > 0
	draw_healthbar(x-8,y-24,x+8,y-22,(dragon_slash_timer/dragon_slash_timer_max)*100,c_black,c_orange,c_orange,0,true,true)

if murasama_slash_timer > 0
	draw_healthbar(x-8,y-24,x+8,y-22,(murasama_slash_timer/murasama_slash_timer_max)*100,c_black,c_red,c_red,0,true,true)

if bullet_reload != bullet_reload_max
	draw_healthbar(x-8,y-24,x+8,y-22,(bullet_reload/bullet_reload_max)*100,c_black,c_yellow,c_yellow,0,true,true)

if global.slow_motion > 0
{
	var im_b = image_blend
	var im_a = image_alpha
	
	image_blend = c_aqua
	image_alpha = 1-global.slow_motion
	
	gpu_set_blendmode(bm_add)
	if (sprite_index = player_get_sprite(spr_idle,3) || sprite_index = player_get_sprite(spr_attack,3))
	{
		var dir_ = point_direction(x,y-6,global.input_aim_x,global.input_aim_y)
		draw_sprite_ext(spr_player_pistol_arm,0,x,y-6,1,image_xscale,dir_,image_blend,image_alpha)
	}
	draw_self()
	if (sprite_index = player_get_sprite(spr_idle,3) || sprite_index = player_get_sprite(spr_attack,3))
	{
		var dir_ = point_direction(x,y-6,global.input_aim_x,global.input_aim_y)
		draw_sprite_ext(spr_player_pistol_arm,1,x,y-6,1,image_xscale,dir_,image_blend,image_alpha)
	}
	gpu_set_blendmode(bm_normal)
	
	image_blend = im_b
	image_alpha = im_a
}