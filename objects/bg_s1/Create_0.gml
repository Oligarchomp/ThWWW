/// @description Insert description here
// You can write your code in this editor

depth = global.bg_depth ;



x = room_width / 2;
y = 0;

vsp = 0.5;

width = sprite_get_width(sprite_index);
height = sprite_get_height(sprite_index);


wait_tree = 360;


step = 0;

depth_dif = 35;
depth_plus = 40;
	
x_pos_min = 190
x_var = 50;
	
	
y_pos = -120;

var y_tree = -150;
while(y_tree < room_height + 100)
{
	
	var x_pos = room_width / 2 + x_pos_min + rng(x_var,true,1);
	for(var i = 0; i < 3; i += 1)
	{
		var inst = instance_create_depth(x_pos,y_tree,depth - depth_dif * i - depth_plus,obj_tree);
		inst.vsp = vsp;
		inst.image_index = i;
	}

	var x_pos = room_width / 2 - x_pos_min - rng(x_var,true,1);
	for(var i = 0; i < 3; i += 1)
	{
		var inst = instance_create_depth(x_pos,y_tree,depth - depth_dif * i - depth_plus,obj_tree);
		inst.vsp = vsp;
		inst.image_index = i;
	}


	y_tree += wait_tree * vsp;
}



x_lookat_ref = room_width / 2;
y_lookat_ref = 210;
obj_camera_3d.x_lookat = x_lookat_ref;
obj_camera_3d.y_lookat = y_lookat_ref;
obj_camera_3d.depth_lookat = 0;

x_cam_ref = room_width / 2;
y_cam_ref = room_height;
obj_camera_3d.x = x_cam_ref;
obj_camera_3d.y = y_cam_ref;
obj_camera_3d.depth = -500;







