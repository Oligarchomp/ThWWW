/// @description Insert description here
// You can write your code in this editor
obj_boss.state = 2;

if(time_left != 0)
{
	create_item(ITEM_LIFE,obj_boss.x,obj_boss.y);
}

event_inherited();