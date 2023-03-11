var tp_sound_ = sprite_index!=spr_psychboss_disappear

state()

if sprite_index = spr_psychboss_disappear && tp_sound_
{
	audio_play_sound(choose(sound_boss_therapist_glitchdeath_01,sound_boss_therapist_glitchdeath_02,sound_boss_therapist_glitchdeath_03),999,0)
}

x = lerp(x,x_target,.1*global.game_spd)
y = lerp(y,y_target,.1*global.game_spd)

if irandom(30)=10
{
	particule_create(x,y,depth-1,spr_psychboss_sparkfx,0,random_range(0.9,1.1))
}

echo_create(x,y,depth+1,sprite_index,image_index,image_xscale,image_yscale,
image_angle,.5,c_red,16,true,1.5)

image_speed_update()

switch state_id
{
	case 7 : case 16 : case 26 : case 35 : case 46 :
		global.boss_state=state_id
	break
}