/// @description Insert description here
// You can write your code in this editor
if(time_left == 0)
{
	obj_boss.state = 1;
	boss_movement_goto(-100,-100, 7);
}
else
{
	obj_boss.state = 2;
	create_item(ITEM_BOMB,obj_boss.x,obj_boss.y);
}
// Inherit the parent event
event_inherited();

