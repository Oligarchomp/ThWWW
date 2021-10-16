function boss_movement_random(argument0,argument1,argument2) {
	//random_boss_movement(spd,x_dist_around,y_dist_around)
	///@param spd real
	///@param x_dist_around real
	///@param y_dist_around real

	var spd = argument0;
	var x_dist = argument1;
	var y_dist = argument2;

	// The boss has a greater chance to return to the center of the screen

	//var x_referen = (room_width / 2) - obj_boss.x;
	if(obj_boss.x > 120) and (obj_boss.x < 280)
	{
		var x_rand_sign = -sign(obj_boss.x - obj_player.x)//sign(rng(room_width,true,1) - room_width / 2 + x_referen);
		if(x_rand_sign == 0)
		{
			x_rand_sign = rng(2,true,5) * 2 - 1;
		}
	}
	else
	{
		var x_rand_sign = -sign(obj_boss.x - room_width / 2)//sign(rng(room_width,true,1) - room_width / 2 + x_referen);
	}
	var x_rand = (x_dist + rng(40,true,2)) * x_rand_sign;
	var new_x_pos = round(obj_boss.x_to + x_rand);


	var y_referen = obj_boss.y_dis_max - obj_boss.x;
	var y_rand_sign = sign(rng(obj_boss.y_dis_max,true,4) - obj_boss.y_dis_max / 2 + y_referen);
	var y_rand = (y_dist  + rng(25,true,3)) * y_rand_sign;
	var new_y_pos = round(obj_boss.y_to + y_rand);
	
	
	with(obj_boss)
	{
		if (new_x_pos < x_disjoint)
		{
			x_to = x_disjoint;
		}
		else if (new_x_pos > room_width - x_disjoint)
		{
			x_to = room_width - x_disjoint;
		}
		else
		{
			x_to = new_x_pos;
		}
				
		if (new_y_pos < y_disjoint)
		{
			y_to = y_disjoint;	
		}
		else if (new_y_pos > y_dis_max )
		{
			y_to = y_dis_max ;
		}
		else
		{
			y_to = new_y_pos;
		}
				
		spd_max = spd;
	}
}
