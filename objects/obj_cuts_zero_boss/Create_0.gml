textbox = instance_create_depth(x,y,depth,obj_talk)

with obj_camera
{
	x =other.x+32
	y =other.y
	camera_size = .6
}

instance_destroy(obj_player_ball) //fix the funny bug

with textbox
{
	dialogue_init()
	text_x = obj_cuts_infinity_boss.x text_y = obj_cuts_infinity_boss.y-32
	
	if global.zero_infinity_relation < 0
	{
		#region
		dialogue_add_line("[shake][scale,0.8]Here we are.")
		dialogue_add_line("[shake]Doc [c_yellow]LECTER[/c] was right.")
		dialogue_add_line("[shake]You'd do anything for some [c_aqua]CHRONOS[/c].",,,,function(){
			dialogue_add_choice("...")})
		dialogue_add_line("[c_red][pulse]Me[/pulse][/c], I've a [c_yellow]nice place[/c] the [c_red]army,[/c]\nsheltered in this [wave][c_yellow]marvelous world of battlefields[/c][/wave].",,,,function(){	
			dialogue_add_choice("...")})
		dialogue_add_line("[shake]This life [c_red]wasn't[/c] for me [c_fuchsia]ZERO[/c].",,,,function(){
			dialogue_add_choice("...")})
		dialogue_add_line("It's nothing personal,[delay,60][shake][c_red] but you have to [pulse]die[/pulse].",function()
		{
			obj_cuts_zero_boss.sprite_index = spr_cuts_player_pisto
			text_break = 120 
			obj_cuts_psy.state=  1
			with obj_cuts_zero_boss
			{create_bullet(x,y,depth-1,0,15,,true)}
		})
	
		dialogue_add_line("[c_yellow]Marvelous.")
		dialogue_add_line("That [c_red]pawn[/c] had a use after all.")
		dialogue_add_line("Your skills are above all my expectations.",,,,function(){
			dialogue_add_choice("LECTER?")})
		dialogue_add_line("This name has no significance.")
		dialogue_add_line("If you do not join me... [delay,60][shake][c_red]I'll force you to!",function(){ #region
			with obj_psybossinfinity_manager
			{
				instance_create_depth(0,0,0,obj_glitch_feedback).time = 10
				sleep(10)
				instance_create_depth(obj_cuts_zero_boss.x,obj_cuts_zero_boss.y,obj_cuts_zero_boss.depth,obj_player)
				instance_create_depth(1072,304,depth,obj_psybossinfinity)
				instance_destroy(obj_cuts_zero_boss)
				instance_destroy(obj_cuts_psy)
				global.boss_state = 1
				boss_create = true
				obj_camera.free_mode = true
				obj_camera.camera_size = 1
			}
		})#endregion
		#endregion
	}
	else
	{
		#region
		dialogue_add_line("[wave][c_yellow]Here we are.",function(){obj_cuts_infinity_boss.state = 1})
		dialogue_add_line("The [c_aqua]CHRONOS[/c] is just in front-",function()
		{text_break = 75 obj_cuts_psy.state=  1},1.2,.75,function(){
			dialogue_add_choice("BEWARE!")
		})
		dialogue_add_line("Your skills are above all my expectations.",,,,function(){
			dialogue_add_choice("LECTER?")})
		dialogue_add_line("This name has no significance")
		dialogue_add_line("If you do not join me... [delay,60][shake][c_red]I'll force you to!",function(){
			obj_cuts_psy.state = 2
			text_x = obj_cuts_infinity_boss.x-12 text_y = obj_cuts_infinity_boss.y-22
		})
		dialogue_add_line("[shake][c_fuchsia]ZERO[/c]...[delay,60] take my...[delay,60]take [c_yellow]my katana[/c].")
		dialogue_add_line("[shake]kill....[delay,100][c_red][pulse] KILL that bastard.",function(){
			with obj_psybossinfinity_manager
			{
				instance_create_depth(0,0,0,obj_glitch_feedback).time = 10
				sleep(10)
				instance_create_depth(obj_cuts_zero_boss.x,obj_cuts_zero_boss.y,obj_cuts_zero_boss.depth,obj_player)
				instance_destroy(obj_cuts_zero_boss)
				instance_destroy(obj_cuts_psy)
				global.boss_state = 1
				boss_create = true
				obj_camera.free_mode = true
				instance_create_depth(1072,304,depth,obj_psybossinfinity)
				obj_camera.camera_size = 1
			}
		})
		#endregion
	}
}