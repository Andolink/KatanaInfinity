textbox = instance_create_depth(x,y,depth,obj_talk)

init_camera = false

obj_music_control.new_music_intro = -1
obj_music_control.new_music_loop = -1

state = 0
trans = 0

cam_x_spd = 0

with textbox
{
	dialogue_init()
	text_x = obj_cuts_infinity_chronodeal1.x text_y = obj_cuts_infinity_chronodeal1.y-32
	dialogue_add_line("[c_red][shake]Shit![/shake][/c] That [c_yellow]idiot[/c] got caught...")
	dialogue_add_line("What about the [c_aqua]CHRONOS[/c]?\n[c_red]"+text_angry_effect+"EVERY"+text_angry_effect+"THING is over...",function(){ obj_cuts_zero_tv_chronodeal1.sprite_index = spr_cuts_zero_find_paper
				obj_cuts_zero_tv_chronodeal1.image_index = 0})
	dialogue_add_line("What the [c_red][shake]"+text_angry_effect+"HELL[/shake][/c] are you doing?!",,,,function(){
		dialogue_add_choice("(Read the message)",function(){
			dialogue_init()
			global.zero_infinity_relation -= 1
			text_x = obj_cuts_infinity_chronodeal1.x text_y = obj_cuts_infinity_chronodeal1.y-32
			dialogue_add_line(text_angry_effect+"[c_red][shake]GIVE "+text_angry_effect+"ME "+text_angry_effect+"THAT!!",text_chrono_deal_main)
		})
		dialogue_add_choice("(Give the message to INFINITY)",function(){
			dialogue_init()
			global.zero_infinity_relation += 1
			text_x = obj_cuts_infinity_chronodeal1.x text_y = obj_cuts_infinity_chronodeal1.y-32
			dialogue_add_line("A message for [c_yellow]us[/c]?",text_chrono_deal_main)
		})
	})
}