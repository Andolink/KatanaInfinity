col = choose(0,1,2,3)

base_col[0] = base_col0
base_col[1] = base_col1
base_col[2] = base_col2
base_col[3] = base_col3

image_blend = base_col[col]
col = image_blend

len = random_range(5,10)
dir = random(360)
spd = random_range(-5,5)

image_alpha	 = .5
sprite_index = spr_lightsphere
image_xscale = .4
image_yscale = .4