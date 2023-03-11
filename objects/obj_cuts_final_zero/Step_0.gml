if state = 1
{
	image_alpha = lerp(image_alpha,1,0.15)
}

if place_meeting(x,y,obj_psych_bullet)
{
	instance_create_depth(0,0,0,obj_glitch_feedback).time = 10
	sprite_index = spr_pl_hurt_ground
	alarm[1]=4
	audio_play_sound(sound_playerdie,999,0)
	instance_destroy(obj_psych_bullet)
}

obj_music_control.new_music_intro = -1
obj_music_control.new_music_loop = -1