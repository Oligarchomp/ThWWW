/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s4_3",BOSS_YUUTO,24000000)
spell_set_name("spell_s4_3a","spell_s4_3a","spell_s4_3b","spell_s4_3b")
spell_set_life(1200,170);
spell_set_time(45,false,95);

boss_movement_goto(room_width / 2, 100,5);


id_list = [];
time_list = [];


var time = 12;

switch(global.difficulty)
{
	case 3:
	case 2:
		array_push(id_list,6,7);
		array_push(time_list,5 * time,6 * time);
	case 1:
	case 0:
		array_push(id_list,1,2,3,4);
		array_push(time_list,time,2* time,3 * time,4 * time);
	break;
}



familiar_wait_death = 200;
//familiar giving info in obj_enemy detsroy event