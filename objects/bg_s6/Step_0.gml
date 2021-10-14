/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	x += hsp;
	x %= width * x_scale;
	
	
	obj_camera_3d.y += max(-4,recursiv(obj_camera_3d.y,room_height / 2, 16,0.1));
	obj_camera_3d.y_lookat = obj_camera_3d.y-1;
}