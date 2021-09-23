/// @description Insert description here
// You can write your code in this editor

name = "Oligarchomp (You are dead)";
spell_nbr = 50;

switch(global.stage)
{
	case 1:
		name = "Apple Girlington";
		spell_nbr = 2;
	break;
	case 2:
		name = "Serene Heikegani";
		spell_nbr = 3;
	break;
	case 3:
		name = "Pale Fanhead";
		spell_nbr = 3;
	break;
	case 4:
		name = "Yuuto Ichika";
		spell_nbr = 4;
	break;
}

x = global.game_x_offset - 30;
y = 20;

x_to = global.game_x_offset + 2;