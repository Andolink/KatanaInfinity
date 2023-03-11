draw_sprite(spr_psychboss_aurafx,img,x,y)
img += global.game_spd/2
if img > sprite_get_number(spr_psychboss_aurafx)
{img -= sprite_get_number(spr_psychboss_aurafx)}

draw_self_light()