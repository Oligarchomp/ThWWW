/// @description Insert description here
// You can write your code in this editor
//is for bot spellcards and non, they are the same objec for convinience

x = global.game_x_offset;
y = global.game_y_offset;


user_id = 0;
// 1 = apple;
// 2 = serene etc
// CREATING BOSS OBJECT
if (!instance_exists(obj_boss))
{
	switch(global.stage)
	{
		case 1:
			global.boss = BOSS_APPLE;
		break;
		case 2:
			global.boss = BOSS_SERENE;
		break;
	}
	instance_create_depth(0,0,0,obj_boss);
}

data_name = "s1_mid";//default, each spell should set it too
cap_history = 0;
try_history = 0;



state = 0;
old_state = 0;
state_time = 0;


is_spell = false;
spell_initialize = false;

// Spell name
text_state = 0;
// 0 = appearing
// 1 = sliding



spell_name = "Memory Sign - [Makes-You-Forget-To-Set-A-Name Devil Sword]"
text_x = 0;
text_x_final = room_width;
text_y = 400;
text_y_final = 21;


text_alpha = 0;

text_appearing_spd = 9;
text_sliding_spd = 8;

text_col_top = c_white//$ffffff;
text_col_bottom = c_white// $8d8dff;


spell_info_alpha = 0;
spell_info_y = text_y_final + 41;


life_bar_size = 330;
life_uncover = global.game_x_offset - 5;


life = 1000;
life_left = life;


life_almost = 220; //when the damage sfx changes

is_timeout = false;

time = 10 * 60;
time_left = time;

time_ticking_low = 16 * 60 // if time above this value, clock starts ticking at 10, else at 5

bonus = 0;
bonus_max = bonus;


invincibility = 60;

spell_wait = 60;

is_capturing = false;

item_nbr = 0;
item_nbr_spell = 15 + 5 * global.stage;
item_dist = 70;

non_only = false;

need_cancel_bonus = false;

//fairy revenge
x_death_list = ds_list_create();
y_death_list = ds_list_create();


step = 0;