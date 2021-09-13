///find_angle(x,y,x_to,y_to)
///@param x real
///@param y real
///@param x_to real
///@param y_to real
function find_angle(argument0, argument1, argument2, argument3) {



	xd = argument2 - argument0;
	yd = argument3 - argument1;
	//hyp = sqrt(sqr(xd) + sqr(yd));

	//xf = (1 / hyp) * xd 
	//yf = (1 / hyp) * yd
	/*
	xa = darccos(xf);
	ya = darcsin(yf);
	*/

	if (sign(xd) == sign(yd))
	{
		if (yd != 0)
		{
			var angle = darctan(xd / yd) - 90 + (yd < 0) * 180;
		}
		else
		{
			var angle = 0;
		}
	
	}
	else
	{
		if (yd != 0)
		{
		
			var angle = darctan(xd / yd) + 270 + 180 * (yd < 0)
		}
		else
		{
			var angle = 180 * (xd < 0);
		}
	
	}

	return angle;

}
