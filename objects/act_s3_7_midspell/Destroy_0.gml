/// @description Insert description here
// You can write your code in this editor
obj_boss.pos_type = POS_SP;
obj_boss.state = 1;
boss_movement_goto(room_width + 100, -100, 10);

if(time_left != 0) and (global.game_type != GAME_SPELL)
{
	create_item(ITEM_LIFE,obj_boss.x,obj_boss.y);
}

event_inherited();