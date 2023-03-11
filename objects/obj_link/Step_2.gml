if !instance_exists(inst0)
|| !instance_exists(inst1)
{instance_destroy() exit}

x = inst0.x
y = inst0.y

image_angle = point_direction(x,y,inst1.x,inst1.y)
image_xscale = point_distance(x,y,inst1.x,inst1.y)