/// @description PLAY

level_editor_save("_autosave")

instance_deactivate_object(id)

instance_destroy(obj_camera)
instance_create_depth(0,0,0,obj_camera)
global.cutscene_id = ""

level_editor_play()