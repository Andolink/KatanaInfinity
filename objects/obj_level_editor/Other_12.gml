/// @description LOAD

with level_editor_create_message("Which level you want to load :",ledit_message_type_write,
function(){
	with obj_level_editor
	{
		var load_ = level_editor_load("LevelEditor/"+obj_ledit_message.typed_text)
		if load_
		{
			event_user(6)
			audio_play_sound(sound_ui_dialogue_positive_01,999,0)
		}
		else
		{audio_play_sound(sound_ui_dialogue_emphasis_01,999,0)}
	}
})
{
	keyboard_string = other.level_name
}