/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
step = 0;


scale = 1;


player_id = obj_player.player_id;
// 0 = Reimu
// 1 = Marisa
// 2 = Sanae
// 3 = Suika

x_pos[1] = 0;
y_pos[1] = 0;

x_pos[2] = 0;
y_pos[2] = 0;

x_pos[3] = 0;
y_pos[3] = 0;

x_pos[4] = 0;
y_pos[4] = 0;

// Position

switch(player_id)
{
	case 1: //Marisa
	
		shot_wait = 1;
		
		option_spr = spr_option_marisa;
		secondary_shot = obj_shot_secondary_marisa;
		
		orb_x[1] = -45;
		orb_y[1] = -30;

		forb_x[1] = 0;
		forb_y[1] = -30;


		orb_x[2] = -15;
		orb_y[2] = -30;

		forb_x[2] = forb_x[1];
		forb_y[2] = forb_y[1];


		orb_x[3] = -orb_x[2];
		orb_y[3] = orb_y[2];

		forb_x[3] = forb_x[1];
		forb_y[3] = forb_y[1];


		orb_x[4] = -orb_x[1];
		orb_y[4] = orb_y[1];

		forb_x[4] = forb_x[1];
		forb_y[4] = forb_y[1];
	break;
	case 2: // Sanae:
	
		shot_wait = 30;
	
		option_spr = spr_option_sanae;
		
		secondary_shot = obj_shot_secondary_sanae;
		
		
		orb_x[1] = -36;
		orb_y[1] = -25;

		forb_x[1] = -20;
		forb_y[1] = -35;


		orb_x[2] = -16;
		orb_y[2] = -31;

		forb_x[2] = -7;
		forb_y[2] = -27;


		orb_x[3] = -orb_x[2];
		orb_y[3] = orb_y[2];

		forb_x[3] = -forb_x[2];
		forb_y[3] = forb_y[2];


		orb_x[4] = -orb_x[1];
		orb_y[4] = orb_y[1];

		forb_x[4] = -forb_x[1];
		forb_y[4] = forb_y[1];
	break;
	/*
	case 3: //suika
	
	break;
	*/
	default: //REIMU
	
	shot_wait = 10;
	
	yy_rot_spd = 0.2;
	option_spr = spr_option_reimu;
	secondary_shot = obj_shot_secondary_reimu;

	
	orb_x[1] = -40;
	orb_y[1] = -10;

	forb_x[1] = -20;
	forb_y[1] = 20;


	orb_x[2] = -26;
	orb_y[2] = 16;

	forb_x[2] = -7;
	forb_y[2] = 32;


	orb_x[3] = -orb_x[2];
	orb_y[3] = orb_y[2];

	forb_x[3] = -forb_x[2];
	forb_y[3] = forb_y[2];


	orb_x[4] = -orb_x[1];
	orb_y[4] = orb_y[1];

	forb_x[4] = -forb_x[1];
	forb_y[4] = forb_y[1];
	break;
}

