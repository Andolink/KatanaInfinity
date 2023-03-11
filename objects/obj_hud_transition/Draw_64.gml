var i = 0
repeat(floor(GAME_WIDTH/16)+1)
{
	if img_index-i > 0 && img_index-i < sprite_get_number(spr_hud_transition)
		draw_sprite_ext(spr_hud_transition,img_index-i,8+16*i,GAME_HEIGHT/2,1,26,0,c_white,1)
	i++
}