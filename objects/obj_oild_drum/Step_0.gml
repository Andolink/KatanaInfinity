if !must_explode must_explode = place_meeting(x,y,obj_explosion)

if must_explode
&& global.game_spd > 0
{
	has_explode = true
}