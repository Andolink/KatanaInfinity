/// @description Quick Menu Exit

with obj_title_screen {start=false start_timer = 0} 
with obj_pause {instance_create_depth(0,0,depth-1,obj_pause_menu)}
instance_destroy()