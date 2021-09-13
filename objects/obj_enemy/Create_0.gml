/// @description Insert description here
// You can write your code in this editor
image_speed = 0;

depth = global.boss_depth;

life = 15;

life_low = 15;//when starting to use the low life sfx

en_type = global.enemy_type;

pos_type = POS_ANGLE;
//POS_SP 
// POS_MANUAL 

move_type = 0;
// 0 = idle + move
// 1 = just idle;

idle_spd = 0.2;
switch(en_type)
{
	case EN_RED:
		idle_spr = spr_fairy_red_idle;
		move_spr = spr_fairy_red_move;
	break;
	case EN_BLUE:
		idle_spr = spr_fairy_blue_idle;
		move_spr = spr_fairy_blue_move;
	break;
	case EN_GREEN:
		idle_spr = spr_fairy_green_idle;
		move_spr = spr_fairy_green_move;
	break;
	case EN_CRAB:
		idle_spr = spr_enemy_crab;
		move_spr = spr_enemy_crab;
		move_type = 1;
		idle_spd = 0.1;
	break;
	case EN_CIRNO://
		idle_spr = spr_cirno;
		move_spr = spr_fairy_blue_move;
	break;
}

sprite_index = idle_spr;


dir = 0;
dir_max = 2;
dir_spd = 0.1;

spr_dir = 1;

hsp = 0;
vsp = 0;

angle = 0;

spd = 0;

state = 0;
last_state = -1;
// for custom behavior
state_time = 0;

offscreen = 50;

can_revenge = true;// if can revenge when dying

item_nbr = 3;//how much point item they drop
item_dist = 20;

step = 0;