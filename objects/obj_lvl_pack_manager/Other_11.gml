/// @description SAVE

if KEY(vk_shift) || pack_name = ""
{
	with level_editor_create_message("Give a name to you level pack :",ledit_message_type_write,
	function(){
		pack_name = obj_ledit_message.typed_text
		lvlpack_editor_save(pack_name)
	})
	{
		keyboard_string = other.pack_name
	}
}
else
{
	lvlpack_editor_save(pack_name)
}