textbox = instance_create_depth(x,y,depth,obj_talk)

with textbox
{
	dialogue_init()
	text_x = obj_cuts_infinity_together.x+4 text_y = obj_cuts_infinity_together.y-25
	
	if global.zero_infinity_relation < 0
	{
		#region
		dialogue_add_line("AH! [c_yellow][wave]That smell of powder, sweat and blood[/c][/wave].")
		dialogue_add_line("[c_yellow]6 fucking years[/c] I've been waiting for [c_yellow]this[/c] moment...")
		dialogue_add_line("And you were telling me that [c_yellow]you[/c] do not miss this..",,,,function(){
			dialogue_add_choice("I just want some chronos, I don't care about the, rest.")
		})
		dialogue_add_line("Do as you wish. After this mission ... [c_red]our roads must split.[/c]",function()
		{obj_cuts_infinity_together.camera_state = 1})
		#endregion
	}
	else
	{
		#region
		dialogue_add_line("AH! [c_yellow][wave]That smell of powder, sweat and blood[/c][/wave].")
		dialogue_add_line("[c_yellow]6 fucking years[/c] I've been waiting for [c_yellow]this[/c] moment...")
		dialogue_add_line("And you were telling me that [c_yellow]you[/c] do not miss this..",,,,function(){
			dialogue_add_choice("The mission is not over yet.")
		})
		dialogue_add_line("Yeah, the [c_yellow]LAB[/c] is just in front.")
		dialogue_add_line("Let's do this,[delay,60] [c_yellow][pulse]partner[/pulse][/c]!",function()
		{obj_cuts_infinity_together.camera_state = 1})
		#endregion
	}
}