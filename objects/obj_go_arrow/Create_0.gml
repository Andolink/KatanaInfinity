exit_x = -64
exit_y = -64

exit_x = 0
exit_y = 0
arrow_ang = 180
go_side = -1

if instance_exists(obj_exit)
{
	if obj_exit.image_angle = 90
	|| obj_exit.image_angle = 270
	{
		if obj_exit.y < room_height/2
		{
			exit_y = obj_exit.y+48
			arrow_ang = 90
			go_side = -1
		}
		else
		{
			exit_y = obj_exit.y-48
			arrow_ang = 270
			go_side = 1
		}
		
		exit_x = lerp(obj_exit.bbox_left,obj_exit.bbox_right,.5)
	}
	else
	{
		if obj_exit.x < room_width/2
		{
			exit_x = obj_exit.x+48
			arrow_ang = 180
			go_side = -1
		}
		else
		{
			exit_x = obj_exit.x-48
			arrow_ang = 0
			go_side = 1
		}
		
		exit_y = obj_exit.bbox_bottom-32
	}
}

text_move = 1