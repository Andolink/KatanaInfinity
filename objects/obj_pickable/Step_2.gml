can_be_pick = distance_to_object(obj_player)<24

image_index = can_be_pick

if can_be_pick
&& (input_get(global.input_object,PRESSED,obj_player.cutscene) 
|| input_get(global.input_down,PRESSED,obj_player.cutscene)
|| obj_player.state = obj_player.state_roll)
&& obj_player.object = noone
{
	audio_play_sound(sound_player_pickup,999,0)
	with obj_player
	{		
		object_buffer = true
		object = other.object_index
		object_sprite = other.sprite_index
	}
	instance_create_depth(x,y,depth,obj_pickable_top_player).sprite_index = sprite_index
	instance_destroy()
}

arrow_img += .2
if arrow_img >= sprite_get_number(spr_pick_up_arrow)-1
{arrow_img = 0}

arrow_ang_y += 4
if arrow_ang_y > 360
{arrow_ang_y -= 360}

arrow_y = lengthdir_y(2,arrow_ang_y)

