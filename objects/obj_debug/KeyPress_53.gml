/// @description Insert description here
// You can write your code in this editor

if(global.debug) or (global.hb_mode)
{
	if(room != room_end)
	{
		room_goto(room_end);
	}
	else
	{
		room_goto(room_end);
		if(global.continues == global.continues_max)
		{
			global.continues = 0;
		}
		else
		{
			global.continues = global.continues_max;
		}
	}
}
