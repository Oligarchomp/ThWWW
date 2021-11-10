/// @description Insert description here
// You can write your code in this editor

global.boss = BOSS_PALE;
// Inherit the parent event
event_inherited();


spell_set_spell("s7_mid3",BOSS_PALE,12014080)
spell_set_name("spell_s7_mid3","spell_s7_mid3","spell_s7_mid3","spell_s7_mid3")
switch(global.player_chosen)
{
	case P_REIMU:
		var life = 250;
	break;
	case P_MARISA:
		var life = 175;
	break;
	case P_SANAE:
		var life = 280;
	break;
}
spell_set_life(life,250);
spell_set_time(30,false,90);

boss_movement_goto(room_width / 2, 100,7);

angle_pale = 90;
dist_pale = 200;
dir_pale = 1;

x_ref = room_width / 2;
y_ref = room_height / 2;

angle_start = 90;