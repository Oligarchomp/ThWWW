/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spell_set_spell("s5_3",BOSS_FEZA,28000000)
spell_set_name("spell_s5_3a","spell_s5_3a","spell_s5_3b","spell_s5_3b")
spell_set_life(1000,170);
spell_set_time(45,false,85);

boss_movement_goto(room_width / 2,100,6);

dir_act = 1;

x_list = []; // relative to room_witdh / 2
y_list = [];

pos_step = 0;


switch(global.difficulty)
{
	case 0:
		array_push(x_list,-100,-30,60,150,135,-75,-140,-90,50)
		array_push(y_list,90,190,140,170,290,270,210,360,330)
	break;
	case 1:
		array_push(x_list,-100,-30,60,150,135,-75,-140,-90,50)
		array_push(y_list,100,200,150,180,300,280,220,370,340)
	break;
	case 2:
		array_push(x_list,-100,-30,60,150,135,-75,-140,-120,0,120)
		array_push(y_list,100,200,150,180,300,280,220,370,340,370)
	break;
	case 3:
		array_push(x_list,-100,-30,60,150,135,-75,-140,-120,0,120)
		array_push(y_list,100,200,150,180,300,280,220,420,340,420)
	break;
}

