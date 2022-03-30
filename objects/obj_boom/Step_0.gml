/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	image_index += 0.25;
	if(image_index >= image_number - 1)
	{
		instance_destroy();
	}
}