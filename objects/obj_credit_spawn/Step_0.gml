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

angle += recursiv(angle,0,8,0.1);

switch(state)
{
	case 0:
		scale = goto_value(scale,1,(scale_ref - 1) / 40);
		alpha = goto_value(alpha,1,1 / 60);
		if(scale == 1)
		{
			state += 1;	
			var inst = instance_create_depth(x,y,depth - 1,obj_credit_effect);
			inst.str = str;
			
			alpha = 1;
		}
	break;
	case 1:
		if(state_time = wait)
		{
			state += 1;	
		}
	break;
	case 2:
		x += accel;
		accel += 0.05;
		alpha = goto_value(alpha,0,0.02);
		if(alpha == 0)
		{
			instance_destroy();
		}
	break;
}
