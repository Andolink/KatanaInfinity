if collision_line(xprevious,yprevious,x,y,par_collision,0,0)
|| collision_line(xprevious,yprevious,x,y,obj_door,0,0)
{
	//audio_play_sound(sound_bulletdie,999,0)
	instance_destroy()
}