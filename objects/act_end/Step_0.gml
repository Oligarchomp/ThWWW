/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	alpha = goto_value(alpha,1,0.005);
	
	if(alpha == 1)
	{
		room_goto(room_end);
	}

}


