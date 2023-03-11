menu_draw()

//FULLSCREEN CODE

if window_get_fullscreen() != global.fullscreen
	window_set_fullscreen(global.fullscreen)
	
//SOUND CODE

audio_group_set_gain(Music,1*global.music_vol*global.global_vol,0)
audio_group_set_gain(Sfx,.6*global.sfx_volume*global.global_vol,0)