/// @description Insert description here
// You can write your code in this editor
depth = global.bg_depth + 100 ;

x = room_width / 2 + 150;
y = 0;


hsp = 0.1;
vsp = 0.55;
alpha = 1;

width = sprite_get_width(sprite_index);
height = sprite_get_height(sprite_index);

for(var i = 1; i < 4; i += 1)
{
	var inst = instance_create_depth(x,y,depth - i * 80, obj_water)
	inst.image_index = i;
	inst.alpha = 0.7 - i * 0.11;
}




x_lookat_ref = room_width / 2;
y_lookat_ref = 320;
obj_camera_3d.x_lookat = x_lookat_ref;
obj_camera_3d.y_lookat = y_lookat_ref;
obj_camera_3d.depth_lookat = 0;

x_cam_ref = room_width / 2;
y_cam_ref = room_height;
obj_camera_3d.x = x_cam_ref;
obj_camera_3d.y = y_cam_ref;
obj_camera_3d.depth = -500;

step = 0;

gpu_set_ztestenable(false);