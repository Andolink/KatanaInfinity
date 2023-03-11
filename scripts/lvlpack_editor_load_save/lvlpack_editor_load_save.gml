function lvlpack_editor_save(file_,file_true_name=-1){ #region
	
	var file = file_text_open_write("LevelPack/"+file_+"/levelpack_main.txt")
	if file_true_name = -1
	{file_true_name = file_}
	var data = ""
	
	with obj_lvlpack_level {
		data += "lvl["
		data += name
		data += ","
		data += string(id_)
		data += ","
		data += string(x)
		data += ","
		data += string(y)
		data += "]"
		file_copy("LevelEditor/"+name+".txt","LevelPack/"+file_+"/"+name+".txt")
	}
	with obj_lvlpack_modify {
		data += "mod["
		data += string(id_)
		data += ","
		data += string(x)
		data += ","
		data += string(y)
		data += ","
		data += string(music)
		data += ","
		data += string(rule)
		data += ","
		data += string(chronos)
		data += ","
		data += string(char)
		data += "]"
	}
	with obj_lvlpack_add {
		data += "add["
		data += string(id_)
		data += ","
		data += string(x)
		data += ","
		data += string(y)
		data += "]"
	}


	file_text_write_string(file,data)
	file_text_close(file)
} #endregion

function lvlpack_editor_load(file_,mode_=0){ #region

	var load_	= false
	var file__	= "LevelPack/"+file_+"/levelpack_main.txt"

	if file_exists(file__)
	{
		var file = file_text_open_read(file__)
		var data = file_text_read_string(file)
		var pos	 = 1
		var curr = ""
		
		instance_destroy(obj_lvlpack_level)
		instance_destroy(obj_lvlpack_modify)
		instance_destroy(obj_lvlpack_add)
		
		repeat(string_length(data))
		{
			curr += string_char_at(data,pos)
			
			#region lvl
			
			if curr = "lvl["
			{
				with instance_create_depth(x,y,0,obj_lvlpack_level)
				{
					var typ = 0
					curr = ""
					while(string_char_at(data,pos) != "]")
					{
						pos ++
				
						while(string_char_at(data,pos) != "," && string_char_at(data,pos) != "]")
						{
							curr += string_char_at(data,pos) 
							pos ++
						}
				
						var result = curr
						
						if mode_ = 0
						{
							switch typ
							{
								case 0 : name			= result					break
								case 1 : id_			= real(result)				break
								case 2 : x				= real(result)				break
								case 3 : y				= real(result)				break
							}
						}
						else
						{
							switch typ
							{
								case 0 : name			= result					break
								case 1 : id_			= real(result)				
										
										 global.lvlpack_level[id_,0]=name
								break
							}
						}
				
						typ ++
						curr = ""
					}
				}
			}
			
			#endregion
			#region mod
			
			if curr = "mod["
			{
				with instance_create_depth(x,y,0,obj_lvlpack_modify)
				{
					var typ = 0
					curr = ""
					while(string_char_at(data,pos) != "]")
					{
						pos ++
				
						while(string_char_at(data,pos) != "," && string_char_at(data,pos) != "]")
						{
							curr += string_char_at(data,pos) 
							pos ++
						}
				
						var result = curr

						if mode_ = 0
						{
							switch typ
							{
								case 0 : id_			= real(result)				break
								case 1 : x				= real(result)				break
								case 2 : y				= real(result)				break
								case 3 : music			= result					break
								case 4 : rule			= real(result)				break
								case 5 : chronos		= real(result)				break
								case 6 : char			= real(result)				break
							}
						}
						else
						{
							switch typ
							{
								case 0 : id_			= real(result)				break
								case 1 : x				= real(result)				break
								case 2 : y				= real(result)				break
								case 3 : music			= result					break
								case 4 : rule			= real(result)				break
								case 5 : chronos		= real(result)				break
								case 6 : char			= real(result)				
										 
										 global.lvlpack_modify[id_,0]=music
										 global.lvlpack_modify[id_,1]=rule
										 global.lvlpack_modify[id_,2]=chronos
										 global.lvlpack_modify[id_,3]=char
								break
							}
						}
				
						typ ++
						curr = ""
					}
				}
			}
			
			#endregion
			#region add
			
			if curr = "add["
			{
				with instance_create_depth(x,y,0,obj_lvlpack_add)
				{
					var typ = 0
					curr = ""
					while(string_char_at(data,pos) != "]")
					{
						pos ++
				
						while(string_char_at(data,pos) != "," && string_char_at(data,pos) != "]")
						{
							curr += string_char_at(data,pos) 
							pos ++
						}
				
						var result = curr
				
						switch typ
						{
							case 0 : id_= real(result)				break
							case 1 : x	= real(result)				break
							case 2 : y	= real(result)				break
						}
				
						typ ++
						curr = ""
					}
				}
			}
			
			#endregion
			
			pos++
		}
		
		with(obj_lvlpack_modify)
		{
			var i_=id
			with instance_create_depth(0,0,0,obj_link)
			{
				inst0 = i_
				
				var inst = other.id
				with obj_lvlpack_level
				{
					if id_ = i_.id_
					{inst = id}
				}
				inst1 = inst
			}
		}
		
		with(obj_lvlpack_level)
		{
			var i_=id
			with instance_create_depth(0,0,0,obj_link)
			{
				inst0 = i_
				var inst = -1
				var linked = false
				with obj_lvlpack_modify
				{
					if id_-1 = i_.id_
					{inst = id linked = true}
				}
				
				if !linked
				{
					with obj_lvlpack_add
					{
						if id_ = i_.id_
						{inst = id}
					}
				}
				
				if inst = -1
				{instance_destroy()}
				else
				{inst1 = inst}
			}
		}
		
		load_ = true
		
		if mode_ = 1
		{
			instance_destroy(obj_lvlpack_level)
			instance_destroy(obj_lvlpack_modify)
			instance_destroy(obj_lvlpack_add)
		}
		
		file_text_close(file)
	}
	else
	{
		level_editor_create_message("The level is not existing")
	}
	
	return load_
} #endregion