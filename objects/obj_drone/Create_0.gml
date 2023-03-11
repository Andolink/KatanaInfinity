if layer_get_name(layer)="InstancesHardMode"
&& global.difficulty != 2
{instance_destroy() exit}

hspd = 0 
vspd = 0
spd = 1.2
turning = 0
attack = false
wait_return_idle = 0
enemy_ai_saw_player = false
attack_dir = 0

aim_time_max = 20
aim_time = aim_time_max

image_speed_init()
image_speed_set(0)
image_index = 0