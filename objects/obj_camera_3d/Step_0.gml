/// @description Insert description here
/*
if(global.gp_active)
{

	var x_final = x + x_shake * power(-1, abs(x_shake));


	if (x_shake != 0) and ( step % 3 == 0)
	{
		x_shake -= 1 * sign(x_shake);	
	}

	var y_final = y + y_shake * power(-1, abs(y_shake));


	if (y_shake != 0) and ( step % 3 == 0)
	{
		y_shake -= 1 * sign(y_shake);	
	}



	//setting the camera
	var vm = matrix_build_lookat(x_final,y_final,-10,x_final,y_final,0,0,1,0);
	camera_set_view_mat(camera,vm);

	step += 1;
}