var siz_ = 1.125

//BACKGROUND

draw_sprite_ext(spr_title_background,0,
lerp(GAME_WIDTH/2,GAME_WIDTH/2,pos),
lerp(GAME_HEIGHT/2+200,GAME_HEIGHT/2,pos),
siz_,siz_,0,c_white,1)

//TITLE

var title_x = GAME_WIDTH/2-50
var title_y = GAME_HEIGHT/2-20

#region
//draw_sprite_ext(spr_titlegraphic,0,
//lerp(title_x,title_x,pos),
//lerp(title_y+200,title_y,pos),
//1,1,0,c_white,1)

//draw_sprite_ext(spr_titlegraphic2,0,
//lerp(title_x+143,title_x+143,pos),
//lerp(title_y+200-1,title_y-1,pos),
//1,1,0,c_white,1)

//draw_sprite_ext(spr_titlegraphic3,0,
//lerp(title_x+41,title_x+41,pos),
//lerp(title_y+200-41,title_y-41,pos),
//1,1,0,c_white,1)



#endregion

//bktglitch_activate(300,127)
//BktGlitch_set_intensity(1.000000);BktGlitch_set_line_shift(0.004000);BktGlitch_set_line_speed(0.010000);BktGlitch_set_line_resolution(1.000000);BktGlitch_set_line_drift(0.100000);BktGlitch_set_line_vertical_shift(0.000000);BktGlitch_set_noise_level(0.500000);BktGlitch_set_jumbleness(0.200000);BktGlitch_set_jumble_speed(1.000000);BktGlitch_set_jumble_resolution(0.200000);BktGlitch_set_jumble_shift(0.150000);BktGlitch_set_channel_shift(0.004000);BktGlitch_set_channel_dispersion(0.002500);BktGlitch_set_shakiness(0.500000);BktGlitch_set_rng_seed(0.000000);//////Alternatively:BktGlitch_config(0.004000, 0.010000, 1.000000, 0.100000, 0.000000, 0.200000, 1.000000, 0.200000, 0.150000, 0.500000, 0.004000, 0.002500, 0.500000, 1.000000, 0.000000);
//BktGlitch_set_intensity(1.000000);BktGlitch_set_line_shift(0.001000);BktGlitch_set_line_speed(0.500000);BktGlitch_set_line_resolution(3.000000);BktGlitch_set_line_drift(0.526667);BktGlitch_set_line_vertical_shift(0.506667);BktGlitch_set_noise_level(0.000000);BktGlitch_set_jumbleness(0.000000);BktGlitch_set_jumble_speed(0.000000);BktGlitch_set_jumble_resolution(0.000000);BktGlitch_set_jumble_shift(0.000000);BktGlitch_set_channel_shift(0.000000);BktGlitch_set_channel_dispersion(0.002500);BktGlitch_set_shakiness(0.000000);BktGlitch_set_rng_seed(0.000000);//////Alternatively:BktGlitch_config(0.001000, 0.500000, 3.000000, 0.526667, 0.506667, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.002500, 0.000000, 1.000000, 0.000000);

var dec_x = 18

draw_sprite_ext(spr_titlegraphic393,title_img,
lerp(title_x+dec_x-4,title_x+dec_x-4,pos),
lerp(title_y+200,title_y,pos),
1,1,0,c_white,1)
//shader_reset()

draw_sprite_ext(smr_title_infinity,title_img,
lerp(title_x+41+dec_x,title_x+41+dec_x,pos),
lerp(title_y+200+7,title_y+7,pos),
1,1,0,c_white,1)

title_img += 0.25

draw_sprite_ext(spr_titlegraphic3,0,
lerp(title_x+46+dec_x,title_x+46+dec_x,pos),
lerp(title_y+200-55,title_y-55,pos),
1,1,0,c_white,1)

gpu_set_blendmode(bm_add)
draw_sprite_ext(spr_titlegraphic3,0,
lerp(title_x+46+dec_x,title_x+46+dec_x,pos),
lerp(title_y+200-55,title_y-55-1,pos),
1,1,0,c_white,lengthdir_x(0.8,title_glow))
gpu_set_blendmode(bm_normal)

//draw_set_color(c_white)
//draw_set_halign(fa_middle)
//draw_set_valign(fa_middle)
//draw_set_font(font_title)

//gpu_set_blendmode(bm_add) draw_set_alpha(lengthdir_x(0.8,title_glow))
//draw_sprite_ext(spr_titlegraphic_glow_title,0,GAME_WIDTH/2,lerp(title_y+200,title_y-1,pos),
//5+lengthdir_x(2,title_glow),.5,0,c_white,.5+draw_get_alpha()*.25)
//draw_text(GAME_WIDTH/2,lerp(title_y+200,title_y-1,pos),"Infinity")
//gpu_set_blendmode(bm_normal) draw_set_alpha(1)
//draw_text(GAME_WIDTH/2,lerp(title_y+200,title_y,pos),"Infinity")

//FOREGROUND

draw_sprite_ext(spr_title_fence,0,
lerp(GAME_WIDTH/2,GAME_WIDTH/2,pos),
lerp(GAME_HEIGHT/2+250,GAME_HEIGHT/2,pos),
siz_,siz_,0,c_white,1)
draw_sprite_ext(spr_title_grass,0,
lerp(GAME_WIDTH/2,GAME_WIDTH/2,pos),
lerp(GAME_HEIGHT/2+300,GAME_HEIGHT/2+150,pos),
siz_,siz_,0,c_white,1)
draw_sprite_ext(spr_title_plants,title_plant_img,
lerp(GAME_WIDTH/2,GAME_WIDTH/2,pos),
lerp(GAME_HEIGHT/2+200,GAME_HEIGHT/2+50,pos),
siz_,siz_,0,c_white,1)