pos = 0
title_plant_img = 0
title_glow = 0
title_img = 0

visible_text = 0
start = false
start_timer = 0

menu_index = 0
text_y_dec = 200
text_glow = 0
text_select_y = 0

wait_to_avoid_miss_click = 4

randomize()
load()

global.editor_mode = 0

audio_group_load(Sfx)
audio_group_load(Music)
audio_group_set_gain(Music,1*global.music_vol*global.global_vol,0)
audio_group_set_gain(Sfx,.6*global.sfx_volume*global.global_vol,0)

audio_master_gain(.25)

sfx			= audio_play_sound(sound_ui_neonbuzz_titlescreen_01,999,0)
ambiance	= audio_play_sound(sound_ambience_rain_title_01,999,1)