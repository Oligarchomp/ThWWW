/// @description Insert description here
// You can write your code in this editor
with(obj_laser)
{
	instance_destroy();	
}

with(obj_item) // for the anchor point cancel item
{
	y = max(y,-30);	
}
// Inherit the parent event
event_inherited();

