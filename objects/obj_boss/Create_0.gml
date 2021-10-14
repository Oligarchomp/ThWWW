/// @description Insert description here
// You can write your code in this editor
image_speed = 0;

depth = global.boss_depth;
instance_create_depth(x,y,depth + 1,obj_boss_indicator);


state = 0;
// 0 = normal
// 1 = leaving
// 2 = death
last_state = -1;
state_time = 0;


// animation
idle_spd = 0.1;
dir = 0; //goes from - dir_max to dir_max, idle when 0
dir_max = 2;
dir_spd = 0.2;

movement_type = 0;
// 0 = one moving animation, changing spr_dir
// 1 = Spins when moving
// 2 = two moving animation, for asymetrical character.
// 3 = only idle

//global.boss = BOSS_PALE;
boss_id = global.boss;
// 0 = Wakasagihime
// 1 = Apple
// 2 = Serinu
//etc

switch(boss_id)
{
	case BOSS_APPLE:
		idle_spr = spr_apple_idle;
		attack_spr = spr_apple_attack;
		move_spr = spr_apple_move;
	break;
	case BOSS_SERENE:
		idle_spr = spr_serene_idle;
		attack_spr = spr_apple_attack;
		move_spr = spr_serene_move;
		x = 520;
		y = 90;
	break;
	case BOSS_PALE:
		idle_spr = spr_pale_idle;
		move_spr = spr_pale_move;
		dir_max = 4;
		movement_type = 1;
	break;
	case BOSS_IKU:
		idle_spr = spr_iku_idle;
		move_spr = spr_iku_move;
	break;
	case BOSS_YUUTO:
		idle_spr = spr_yuuto_idle;
		move_spr = spr_yuuto_move;
	break;
	case BOSS_DOVE:
		idle_spr = spr_dove_idle;
		movement_type = 3;
		x = 500;
		y = -90;
	break;
	case BOSS_FEZA:
		idle_spr = spr_feza_idle;
		move_left_spr = spr_feza_move_left;
		move_right_spr = spr_feza_move_right;
		movement_type = 2;
	break;
	case BOSS_NUA:
		idle_spr = spr_nua_idle;
		move_spr = spr_nua_move;
		x = 500;
	break;
}
	

pos_type = POS_SP;


rot = 0;

spr_dir = 1;

hsp = 0;
vsp = 0;

spd = 0;

x_to = 0;
y_to = 0;
spd_max = 0;

in_position = false;

grazed = true; //please don't graze the boss

boss_movement_goto(room_width / 2,100,7);



// To stay on screen

x_disjoint = 86;
x_disjoint_ref = x_disjoint;
y_disjoint = 78;
y_disjoint_ref = y_disjoint;
y_dis_max = 135; // from the top of the screen
y_dis_max_ref = y_dis_max;
// Hitbox

my_hitbox = instance_create_depth(x,y,depth - 1, obj_hitbox);
my_hitbox.owner = self;
my_hitbox.owner_type = 1;
