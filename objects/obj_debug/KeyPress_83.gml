/// @description Insert description here
// You can write your code in this editor
if(global.debug)
{
	global.difficulty -= 1;
	if(global.difficulty < 0)
	{
		global.difficulty = 3;
	}
}