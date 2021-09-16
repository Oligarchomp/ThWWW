/// @description Insert description here
// You can write your code in this editor


depth =global.bg_depth;
x = room_width / 2;
y = -50;


spd = 7;

/*
for(var i = 0; i < 3; i += 1)
{
	var inst = instance_create_depth(room_width / 2,0, depth - i * 20 - 200, obj_tower)
	inst.image_index = i;
}
*/
y_cloud = -300;

while(y_cloud < room_height + 500)
{
	instance_create_depth(-250 + rng(room_width + 500,false,5),y_cloud,global.bg_depth - rng(100,true,3),obj_cloud);
	y_cloud += spd;
}


x_lookat_ref = room_width / 2;
y_lookat_ref = 200;
obj_camera_3d.x_lookat = x_lookat_ref;
obj_camera_3d.y_lookat = y_lookat_ref;
obj_camera_3d.depth_lookat = 0;

x_cam_ref = room_width / 2;
y_cam_ref = room_height - 100;
obj_camera_3d.x = x_cam_ref;
obj_camera_3d.y = y_cam_ref;
obj_camera_3d.depth = -800;

step = 0;