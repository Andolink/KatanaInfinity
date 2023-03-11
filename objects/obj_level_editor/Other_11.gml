/// @description SAVE

if KEY(vk_shift) || level_name = ""
{
	with level_editor_create_message("Give a name to you level :",ledit_message_type_write,
	function(){
		audio_play_sound(sound_ui_dialogue_positive_01,999,0)
		obj_level_editor.level_name = obj_ledit_message.typed_text
		level_editor_save(level_name)
	})
	{
		keyboard_string = other.level_name
	}
}
else
{
	audio_play_sound(sound_ui_dialogue_positive_01,999,0)
	level_editor_save(level_name)
}