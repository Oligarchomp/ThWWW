/// @description Insert description here
// You can write your code in this editor
depth = global.bg_depth  ;

x = 0;
y = 0;

vsp = 14;


height = sprite_get_height(sprite_index);
width = sprite_get_width(sprite_index);

instance_create_depth(0,0,global.spell_bg_depth + 10,obj_rain);
var inst = instance_create_depth(0,0,global.spell_bg_depth + 20,obj_rain);
inst.vsp *= 0.6;
inst.hsp *= 0.6;


y_flower = -300;

while(y_flower < room_height + 300)
{
	var x_pos = -240 + rng(room_width + 240 * 2,false,1);
	var inst = instance_create_depth(x_pos,y_flower,depth - 12,obj_agra_flower);
	inst.vsp = vsp;
	y_flower += vsp;
}



x_lookat_ref = room_width / 2;
y_lookat_ref = 160;
obj_camera_3d.x_lookat = x_lookat_ref;
obj_camera_3d.y_lookat = y_lookat_ref;
obj_camera_3d.depth_lookat = 0;

x_cam_ref = room_width / 2;
y_cam_ref = room_height;
obj_camera_3d.x = x_cam_ref;
obj_camera_3d.y = y_cam_ref;
obj_camera_3d.depth = -800;

step = 0;

gpu_set_ztestenable(false);