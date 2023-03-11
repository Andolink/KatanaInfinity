if life <= 0
{instance_destroy()}
else
{life-= global.slow_motion image_alpha = life/life_max*alp_max}