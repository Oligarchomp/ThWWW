/// @description Insert description here
// You can write your code in this editor

y = 145;
depth = global.bg_depth;
hsp = -3;

x_scale = 1.2;

width = sprite_get_width(sprite_index);
height = sprite_get_height(sprite_index);



for(var i = 0; i < 4; i += 1)
{
	var inst = instance_create_depth(room_width / 2,y,global.bg_depth + 25 + i,obj_backdrop);
	inst.im = i;
	inst.hsp = hsp * 0.4 / (i + 1);
}

instance_create_depth(0,0,global.bg_depth + 20,obj_rain);
var inst = instance_create_depth(0,0,global.bg_depth + 21,obj_rain);
inst.vsp *= 0.6;
inst.hsp *= 0.6;


x_lookat_ref = room_width / 2;
y_lookat_ref = room_height / 2;
obj_camera_3d.x_lookat = x_lookat_ref;
obj_camera_3d.y_lookat = y_lookat_ref;
obj_camera_3d.depth_lookat = global.bg_depth - 200;

x_cam_ref = room_width / 2;
y_cam_ref = room_height / 2 + 1;
obj_camera_3d.x = x_cam_ref;
obj_camera_3d.y = y_cam_ref;
obj_camera_3d.depth = global.bg_depth - 400;

obj_camera_3d.FOV = 60;
