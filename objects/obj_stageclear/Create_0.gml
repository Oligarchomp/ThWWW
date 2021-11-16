/// @description Insert description here
// You can write your code in this editor


alpha = 0;


state = 0;
old_state = -1;
state_time = 0;

switch(global.stage)
{
	case 1:
		bonus = 10000000;
	break;
	case 2:
		bonus = 15000000;
	break;
	case 3:
		bonus = 20000000;
	break;
	case 4:
		bonus = 25000000;
	break;
	case 5:
		bonus = 30000000;
	break;
	case 6:
		bonus = 35000000;
	break;
}

add_score(bonus);