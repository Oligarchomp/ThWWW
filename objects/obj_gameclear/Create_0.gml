/// @description Insert description here
// You can write your code in this editor


alpha = 0;


state = 0;
old_state = -1;
state_time = 0;

bonus_life = 20000000
life_nbr = global.life;

bonus_bomb = 5000000;
bomb_nbr = global.bomb;

bonus = bonus_life * life_nbr + bonus_bomb * bomb_nbr;

add_score(bonus);