part_system = part_system_create()
part_system_depth(part_system,layer_get_depth(layer_get_id("TileSet"))+1)

part_ceiling_lazer_kill = part_type_create() #region
part_type_shape(part_ceiling_lazer_kill,0)
part_type_scale(part_ceiling_lazer_kill,1,1)
part_type_size(part_ceiling_lazer_kill,1.5,2,0,0.10)
part_type_color3(part_ceiling_lazer_kill,16777215,65535,65535)
part_type_alpha3(part_ceiling_lazer_kill,1,1,0)
part_type_speed(part_ceiling_lazer_kill,1,4,-0.01,0.10)
part_type_direction(part_ceiling_lazer_kill,0,360,0,0)
part_type_gravity(part_ceiling_lazer_kill,0.05,-90)
part_type_orientation(part_ceiling_lazer_kill,0,0,0,0,+true)
part_type_life(part_ceiling_lazer_kill,50,100)
part_type_blend(part_ceiling_lazer_kill,0) #endregion