if wait_control 
{
	with obj_global_control input_update()	
	wait_control = false
}

var gui_w = display_get_gui_width()
var gui_h = display_get_gui_height()

if PAUSE_HAS_GOT_IMAGE
{

	if surface_exists(pause_surface)
	{
		bktglitch_activate(GAME_WIDTH,GAME_HEIGHT)
		BktGlitch_set_intensity(1.000000);BktGlitch_set_line_shift(0.001000);BktGlitch_set_line_speed(0.500000);BktGlitch_set_line_resolution(3.000000);BktGlitch_set_line_drift(0.526667);BktGlitch_set_line_vertical_shift(0.506667);BktGlitch_set_noise_level(0.000000);BktGlitch_set_jumbleness(0.000000);BktGlitch_set_jumble_speed(0.000000);BktGlitch_set_jumble_resolution(0.000000);BktGlitch_set_jumble_shift(0.000000);BktGlitch_set_channel_shift(0.000000);BktGlitch_set_channel_dispersion(0.002500);BktGlitch_set_shakiness(0.000000);BktGlitch_set_rng_seed(0.000000);//////Alternatively:BktGlitch_config(0.001000, 0.500000, 3.000000, 0.526667, 0.506667, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.000000, 0.002500, 0.000000, 1.000000, 0.000000);
		draw_surface(pause_surface, 0,0)
		shader_reset()
	}
	else
	{
		pause_surface = surface_create(GAME_WIDTH,GAME_HEIGHT)
		buffer_set_surface(pause_surface_buffer,pause_surface,0)
	}
}