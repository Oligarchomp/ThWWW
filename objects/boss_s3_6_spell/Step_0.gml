/// @description Insert description here
// You can write your code in this editor
if(global.gp_active) and (spell_wait == 0)
{
	switch(global.difficulty)
	{
		case 0:
			var fan_spd_max = 0.35;
		
			var bubble_nbr = 5;
			var bubble_spd = 1;
			var bubble_dist = -20;
			var bubble_wait = 100;
		break;
		case 1:
			var fan_spd_max = 0.6;
		
			var bubble_nbr = 8;
			var bubble_spd = 1;
			var bubble_dist = -12;
			var bubble_wait = 82;
		break;
		case 2:
			var fan_spd_max = 0.7;
		
			var bubble_nbr = 10;
			var bubble_spd = 1;
			var bubble_dist = -10;
			var bubble_wait = 75;
		break;
		case 3:
			var fan_spd_max = 0.9;
		
			var bubble_nbr = 14;
			var bubble_spd = 1;
			var bubble_dist = -10;
			var bubble_wait = 70;
		break;
	}
	
	var spin_spd = 6;
	var fan_bubble_spd = 9;
	
	
	if(angle_charge > -270)
	{
		repeat(15)
		{
			angle_charge = goto_value(angle_charge, -270,1);
		
			var dist = 190;
			var inst = instance_create_depth(x_ref + lengthdir_x(dist,angle_charge),y_ref + lengthdir_y(dist,angle_charge),global.boss_depth,obj_spincharge);
			inst.angle = angle_charge;
		}
	}
	
	switch(state)
	{
		case 0:
			switch(state_time)
			{
				case 0:
					var inst = boss_charge(obj_boss.x,obj_boss.y);
					inst.owner = obj_boss;
					boss_movement_goto(room_width / 2, y_ref + lengthdir_y(dist_pale,angle_pale),6);
				break;
				case 30:
					boss_charge(obj_boss.x,obj_boss.y);
				break;
				case 60:
					state = 1;
					obj_boss.pos_type = POS_MANUAL;
				break;
			}
		break;
		case 1:
			
			var ang = find_angle(obj_boss.x,obj_boss.y,x_ref,y_ref) +180;
			shoot_row(DAN_BUBBLE,7,4,obj_boss.x,obj_boss.y,ang,0,16,sfx_redirect1,1);
			
			var dest = 90 + 360 * dir_pale
			angle_pale = goto_value(angle_pale,dest,spin_spd);
			obj_boss.x = x_ref + lengthdir_x(dist_pale,angle_pale);
			obj_boss.y = y_ref + lengthdir_y(dist_pale,angle_pale);
			obj_boss.dir = obj_boss.dir_max;
				
			
			if(angle_pale == dest)
			{
				state = 2;
				angle_pale = 90;
				obj_boss.pos_type = POS_SP;
				boss_movement_goto(room_width / 2, room_height / 2,8);
				var inst = boss_charge(obj_boss.x,obj_boss.y);
				inst.owner = obj_boss;
			}
		break;
		case 2:
			if(obj_boss.in_position)
			{
				boss_charge(obj_boss.x,obj_boss.y);
				state = 3;
			}
		break;
		case 3:
			if(state_time == 30)
			{
				state = 4;
			}
		break;
		case 4:
			if(state_time == 0)
			{
				boss_release(obj_boss.x,obj_boss.y,sfx_boss_release);
			}
			
			
			for(var i = 0; i < 360; i += 360 / 3)
			{
				shoot_arc(DAN_BUBBLE,7,2,obj_boss.x,obj_boss.y,fan_angle + i,10,fan_bubble_spd,sfx_shot3,3);
			}
			
			fan_angle += fan_spd;
			fan_spd = goto_value(fan_spd,fan_spd_max,fan_accel);
			
			if(state_time % bubble_wait == 0)
			{
				shoot_ring(DAN_BUBBLE,3,bubble_nbr,obj_boss.x,obj_boss.y,angle_bubble,bubble_spd,sfx_shot2,2);
				angle_bubble += bubble_dist;
			}
			
		break;

	}
	
	if(state > 2)
	{
		obj_boss.in_position = false; //making pale spin	
	}
	
	//walls around
	with(obj_danmaku1)
	{
		spd += recursiv(spd,0,10,0.1);
		is_cancelable = false;
	}
	
	
}
// Inherit the parent event
event_inherited();

