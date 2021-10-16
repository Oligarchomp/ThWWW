/// @description Insert description here
// You can write your code in this editor
obj_boss.state = 1;

if(time_left != 0)
{
	create_item(ITEM_BOMB,obj_boss.x,obj_boss.y);
}

boss_movement_goto(-200, obj_boss.y, 10);
event_inherited();