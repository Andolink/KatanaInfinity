if bm_add_mode
	gpu_set_blendmode(bm_add)

//if 

var x_ = x 
var y_ = y
if shake 
{x += random_range(-shake,shake) y += random_range(-shake,shake)}
draw_self()
x = x_ y = y_

if bm_add_mode
	gpu_set_blendmode(bm_normal)