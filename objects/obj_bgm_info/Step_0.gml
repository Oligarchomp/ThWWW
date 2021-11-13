/// @description Insert description here
// You can write your code in this editor

if(global.gp_active)
{
	if (old_state != state)
	{
		old_state = state;
		state_time = 0;
	}
	else
	{
		state_time += 1;
	}
	
	draw_set_font(font_spell);
	var x_to = room_width - string_width(bgm_name) - 4;
	switch(state)
	{
		case 0:
			x += recursiv(x,x_to,15,0.1);
			if(x == x_to)
			{
				state = 1;
			}
		break;
		case 1:
			if(state_time == 70)
			{
				state = 2;
			}
		break;
		case 2:
			x += recursiv(x,room_width + 100,15,0.1);
			if(x == room_width)
			{
				instance_destroy();	
			}
		break;
	}
	
	
	
	
}