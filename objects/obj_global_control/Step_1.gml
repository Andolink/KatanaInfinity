input_update()
sleep_update()

if KEY_PRS(vk_f2)
{room_goto_next()}

if KEY_PRS(vk_f3)
{room_goto_previous()}

if KEY_PRS(vk_f11)
{room_goto(rm_part_edit)}

if KEY_PRS(vk_f12)
{room_goto(rm_level_editor)}


if input_get(global.input_pause,PRESSED)
&& !instance_exists(obj_pause)
&& room != rm_main_menu
{
	instance_create_depth(0,0,0,obj_pause)
}

global.game_spd = global.slow_motion*(global.sleep_var=0)*global.speedrun_gamespeed

if room != rm_cuts_ending1 && !instance_exists(obj_pause)
{
	global.speedrun_timer_msec++
	if global.speedrun_timer_msec = 60
	{global.speedrun_timer_sec ++ global.speedrun_timer_msec = 0}
	if global.speedrun_timer_sec = 60
	{global.speedrun_timer_min ++ global.speedrun_timer_sec = 0}

	global.speedrun_timergl_msec++
	if global.speedrun_timergl_msec = 60
	{global.speedrun_timergl_sec ++ global.speedrun_timergl_msec = 0}
	if global.speedrun_timergl_sec = 60
	{global.speedrun_timergl_min ++ global.speedrun_timergl_sec = 0}
}