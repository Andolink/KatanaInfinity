draw_sprite_part_ext(sprite_index,image_index,
0,effect,sprite_width*image_xscale,sprite_height*image_yscale,
x-sprite_xoffset,y-sprite_yoffset+effect,image_xscale,image_yscale,c_yellow,image_alpha)

gpu_set_blendmode(bm_add)

draw_sprite_part_ext(sprite_index,image_index,
0,effect,sprite_width*image_xscale,sprite_height*image_yscale,
x-sprite_xoffset,y-sprite_yoffset+effect,image_xscale,image_yscale,c_yellow,image_alpha)

gpu_set_blendmode(bm_normal)