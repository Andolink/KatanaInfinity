if sprite_index = spr_receptionist_lookdown
{sprite_index = spr_receptionist_read image_speed = 0}
else
if sprite_index = spr_receptionist_angry
{sprite_index = spr_receptionist_angry_loop}
else
if sprite_index = spr_receptionist_stand
{image_speed = 0 image_index = image_number-0.5}
else
if sprite_index = spr_receptionist_lookup
{image_speed = 0 image_index = image_number-0.5}
else
if cutsc != 1
{sprite_index = spr_receptionist_read image_speed = 0}


