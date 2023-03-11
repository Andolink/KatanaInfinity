if (music_loop != new_music_loop || music_intro != new_music_intro)
{
	gain = lerp(gain,0,0.05)
	
	if gain <= 0.05
	{
		if music_intro != -1	
		{
			audio_stop_sound(music_intro_id)
		}
		if music_loop != -1		
		{
			audio_stop_sound(music_loop_id)
		}
	}
}
else
{
	gain = lerp(gain,1,0.05)
	if instance_exists(obj_pause)
	{gain = lerp(gain,.5,0.05)}
}

if (music_intro != new_music_intro || music_loop != new_music_loop) 
&& !audio_is_playing(music_intro_id)
&& !audio_is_playing(music_loop_id)
{
	music_intro = new_music_intro
	music_loop	= new_music_loop
	gain		= 1
	
	if music_intro != -1
	{
		music_state		= 0
		music_intro_id	= audio_play_sound(music_intro,999,0)
	}
	
	if music_intro = -1 && music_loop != -1
	{
		music_state		= 1
		music_loop_id	= audio_play_sound(music_loop,999,1)
	}
}
else if !audio_is_playing(new_music_intro)
&& !(music_intro != new_music_intro || music_loop != new_music_loop) 
&& music_state = 0
&& music_loop != -1
{
	music_loop_id	= audio_play_sound(music_loop,999,1)
	music_state		= 1
}

if instance_exists(obj_level_editor)
{level_editor_pitch = lerp(level_editor_pitch,.8,.05)}
else
{level_editor_pitch = lerp(level_editor_pitch,1,.05)}

if audio_is_playing(music_intro_id)
{
	audio_sound_pitch(music_intro_id,(1-(1-global.slow_motion)*.2)*level_editor_pitch)
	audio_sound_gain(music_intro_id,gain,0)
}

if audio_is_playing(music_loop_id)
{
	audio_sound_pitch(music_loop_id,(1-(1-global.slow_motion)*.2)*level_editor_pitch)
	audio_sound_gain(music_loop_id,gain,0)
}

audio_get_listener_count()