effect += 0.5*global.game_spd

particule(obj_part_systeme.part_system,x,y-sprite_yoffset+effect,obj_part_systeme.part_ceiling_lazer_kill,1)

if effect > sprite_height
{instance_destroy()}