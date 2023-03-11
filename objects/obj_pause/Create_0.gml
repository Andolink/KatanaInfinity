#region BACKGROUND

PAUSE_HAS_GOT_IMAGE = false

pause_surface = -1
pause_surface_buffer = -1

#endregion

wait_control = true

audio_play_sound(sound_ambience_radio_glitch_01,999,0)
instance_create_depth(0,0,depth-1,obj_pause_menu)