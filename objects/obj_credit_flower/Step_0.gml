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




y += flower_vsp;

y %= height;



switch(state)
{
	case 0:
		x += max(flower_spd,recursiv(x, room_width / 2,20,0.5));
		
		flower_spd -= flower_accel;
		
		if(x == room_width / 2)
		{
			state += 1;	
			flower_spd = 0;
		}
	break;
	case 1:
		if(state_time == 10)
		{
			state += 1;	
		}
	break;
	case 2:
		x += min(flower_spd,recursiv(x, room_width / 2 + width / 2,20,0.5));
		
		flower_spd += flower_accel;
		
		if(x == room_width / 2 + width / 2)
		{
			state += 1;
			flower_spd = 0;
		}
	break;
	case 3:
		if(state_time == 10)
		{
			state = 0;	
		}
	break;
}

