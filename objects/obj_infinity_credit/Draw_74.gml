if scrool_y > -450
{scrool_y -= 0.4 back_back = lerp(back_back,0.25,.1)}
else
{
	scrool_y -= 0.4
	back_back = lerp(back_back,3,.001)
	if back_back > 2.9 && !trans
	{
		trans = 1
		with instance_create_depth(x,y,depth,obj_hud_transition)
		{
			func_transition = function()
			{game_restart()}
		}
	}
}

draw_set_alpha(back_back)
draw_set_color(c_black)
draw_rectangle(-1,-1,1000,1000,false)
draw_set_alpha(1)

draw_set_color(c_white)
draw_set_halign(fa_middle)
draw_set_valign(fa_middle)
draw_set_font(font_xirod)

var y_ = y

draw_text(x,y+scrool_y,"KATANA INFINITY V.2") y_ += 50

draw_set_font(global.font_text)

draw_text_transformed(x,y_+scrool_y,"-Infinity Team-",1.2,1.2,0) y_ += 20

draw_text(x,y_+scrool_y,"Andolink") y_ += 10
draw_text(x,y_+scrool_y,"Code - PixelArt - GameDesign") y_ += 20
draw_text(x,y_+scrool_y,"SeiferSJ") y_ += 10
draw_text(x,y_+scrool_y,"Music - Scriptwriter") y_ += 20
draw_text(x,y_+scrool_y,"GauloisesBSF") y_ += 10
draw_text(x,y_+scrool_y,"Music - Story Concept") y_ += 20
draw_text(x,y_+scrool_y,"Panthere") y_ += 10
draw_text(x,y_+scrool_y,"Translation") y_ += 40

draw_text_transformed(x,y_+scrool_y,"-Additionnal credits-",1.2,1.2,0) y_ += 20

draw_text(x,y_+scrool_y,"Pham") y_ += 10
draw_text(x,y_+scrool_y,"Game's Logo") y_ += 20
draw_text(x,y_+scrool_y,"Murasama mod's Team") y_ += 10
draw_text(x,y_+scrool_y,"Murasama's sprites & concept") y_ += 40

draw_text_transformed(x,y_+scrool_y,"-Assets used-",1.2,1.2,0) y_ += 20

draw_text(x,y_+scrool_y,"Game Maker Studio - Yoyo Game") y_ += 20
draw_text(x,y_+scrool_y,"UndertaleModToolKit") y_ += 20
draw_text(x,y_+scrool_y,"BktGlitch by Jan Vorisek") y_ += 20
draw_text(x,y_+scrool_y,"Scribble by Juju Adams") y_ += 20
draw_text(x,y_+scrool_y,"RimLight Shader by The Reverend") y_ += 40

draw_text_transformed(x,y_+scrool_y,"-An Huge Thanks to-",1.2,1.2,0) y_ += 20
draw_text(x,y_+scrool_y,"Askiisoft and all the guys behind Katana ZERO") y_ += 10
draw_text(x,y_+scrool_y,"For making one of our favorite game!") y_ += 10
draw_text(x,y_+scrool_y,"(And also because we've used a lot of their assets)") y_ += 50

draw_set_alpha(back_back-0.25)
draw_set_color(c_black)
draw_rectangle(-1,-1,1000,1000,false)
draw_set_alpha(1)
draw_set_color(c_white)

draw_set_font(font_xirod)
draw_text(x,clamp(y_+scrool_y,GAME_HEIGHT/2,1000),"Thank you for playing!!")  y_ += 20

var text_ = "- Have more fun with the Speedrun mode -"
if global.speedrun_mode 
	text_ = "SPEEDRUN : "+string(global.speedrun_timergl_min)+":"+string(global.speedrun_timergl_sec)+"."+string(global.speedrun_timergl_msec)
draw_text(x,clamp(y_+scrool_y,GAME_HEIGHT/2+20,1000),text_)