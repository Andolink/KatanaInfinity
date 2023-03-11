textbox = instance_create_depth(0,0,0,obj_talk)

with textbox
{
	dialogue_init()
	text_x = other.x text_y = other.y-30
	
	dialogue_add_line("You really think ...[delay,120] that you could escape from me?",function()
	{obj_cuts_final_zero.state = 1})
	dialogue_add_line("Any last word?",function(){
		instance_create_depth(0,0,0,obj_glitch_feedback)
		var ang = 0
		repeat(36)
		{
			var x_ = obj_cuts_final_zero.x+lengthdir_x(150,ang)
			var y_ = obj_cuts_final_zero.y+lengthdir_y(150,ang)
			var dir_ = point_direction(x_,y_,obj_cuts_final_zero.x,obj_cuts_final_zero.y)
			create_psych_bullet(x_,y_,depth,dir_,20,false,60)
			ang += 10
		}
	}
	,,,function(){
		dialogue_add_quick_choice("Fuck you!")
		dialogue_add_choice("I'll never work for you.")
		dialogue_add_choice("...")
	})
}