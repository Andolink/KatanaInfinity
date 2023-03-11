/// @description wrap(value, min, max)
/// @function wrap
/// @param value The value to wrap into the bounds
/// @param min Minimum bound, inclusive
/// @param max Maximum bound, inclusive
// Returns the value wrapped to the range [min, max] (min and max can be swapped).
// Calls floor() on reals, but GML's modulo is doing something weird and original_wrap just hangs indefinitely on some values anyways so oh well.

function wrap(value__,min__,max__) {
	var value = floor(value__);
	var _min = floor(min(min__, max__));
	var _max = floor(max(min__, max__));
	var range = _max - _min + 1; // + 1 is because max bound is inclusive

	return (((value - _min) % range) + range) % range + _min;
}

function place_mouse()
{
	return mouse_x > bbox_left && mouse_x < bbox_right
		&& mouse_y > bbox_top && mouse_y < bbox_bottom
}