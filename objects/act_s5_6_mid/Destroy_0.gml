/// @description Insert description here
// You can write your code in this editor
obj_boss.state = 1;
boss_movement_goto(-100, -100, 11);

if(time_left != 0)
{
	create_item(ITEM_LIFE,obj_boss.x,obj_boss.y);	
}
// Inherit the parent event
event_inherited();

