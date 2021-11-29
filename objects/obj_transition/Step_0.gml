/// @description Insert description here
// You can write your code in this editor


if (old_state != state)
{
	old_state = state;
	state_time = 0;
}
else
{
	state_time += 1;
}
	
switch(state)
{
	case 0:
		if(scale == 0)
		{
			state = 1;
			room_goto(room_to);
		}
		
		scale = goto_value(scale,0,spd);
	break;
	case 1:
		if(state_time == 2)
		{
			state = 2;
		}
	break;
	case 2:
		scale = goto_value(scale,scale_max,spd);
		if(scale == scale_max)
		{
			instance_destroy();	
		}
	break;
}
	
