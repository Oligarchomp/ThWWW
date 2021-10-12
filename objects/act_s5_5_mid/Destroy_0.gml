/// @description Insert description here
// You can write your code in this editor
if(time_left == 0)
{
	obj_boss.state = 1;
	boss_movement_goto(-100,-100, 7);
	event_next();
}
// Inherit the parent event
event_inherited();

