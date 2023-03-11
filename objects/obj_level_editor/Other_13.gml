/// @description NEW

level_editor_create_message("This will erase everything not saved\nAre you sure?",ledit_message_type_yes_no,
function(){
	audio_play_sound(sound_ui_dialogue_emphasis_01,999,0)
	room_restart()
})