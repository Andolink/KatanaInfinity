if state = state_hit
	enemy_ai_init()
else
	enemy_ai_update()

enemy_update()

dommage_system()
state()

collision_system(hspd,vspd)
entity_blood_spawn()

image_speed_update()