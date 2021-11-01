/// @description Insert description here
// You can write your code in this editor

name = "Oligarchomp (You are dead)";
spell_nbr = 69;

switch(global.stage)
{
	case 1:
		name = get_text("boss_apple");
		spell_nbr = 1;
	break;
	case 2:
		name = get_text("boss_serene");
		spell_nbr = 2;
	break;
	case 3:
		name = get_text("boss_pale");
		spell_nbr = 2;
	break;
	case 4:
		name = get_text("boss_yuuto");
		spell_nbr = 3;
	break;
	case 5:
		name = get_text("boss_feza");
		spell_nbr = 3;
	break;
	case 6:
		name = get_text("boss_nua");
		spell_nbr = 4;
	break;
	case 7:
		name = get_text("boss_reverence");
		spell_nbr = 9;
	break;
}

x = global.game_x_offset - 30;
y = 20;

x_to = global.game_x_offset + 2;