/// @description LOAD

with level_editor_create_message("Which level you want to load :",ledit_message_type_write,
function(){
	lvlpack_editor_load(obj_ledit_message.typed_text,0)
	pack_name = obj_ledit_message.typed_text
})
{
	keyboard_string = other.pack_name
}