/// @description Insert description here
// You can write your code in this editor

x = room_width / 2;
y = 0;
depth = global.bg_depth;

width = sprite_get_width(sprite_index);
height = sprite_get_height(sprite_index);
vsp = 2;

wall_plus = 0;

ceiling = -290;

instance_create_depth(0,0,global.bg_depth + ceiling,obj_ceiling);


wall_size = 800;

far = -400;
var zz = global.bg_depth;

var wall_x_ref = width / 2;
var x_pos = room_width / 2 - wall_x_ref
var x_pos2 = room_width / 2 + wall_x_ref

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_color();
vertex_format_add_texcoord();
vForm = vertex_format_end();


//wall 
wall_buff = vertex_create_buffer();
vertex_begin(wall_buff,vForm)
//left
	vertex_add_wall(wall_buff,x_pos,wall_size + wall_plus,zz,x_pos,wall_plus,zz + ceiling,c_white,1);
	vertex_add_wall(wall_buff,x_pos,wall_plus,zz,x_pos,-wall_size + wall_plus,zz + ceiling,c_white,1);
	vertex_add_wall(wall_buff,x_pos,-wall_size + wall_plus,zz,x_pos,-wall_size * 2 + wall_plus,zz + ceiling,c_white,1);
//right
	vertex_add_wall(wall_buff,x_pos2,wall_size + wall_plus,zz,x_pos2,wall_plus,zz + ceiling,c_white,1);
	vertex_add_wall(wall_buff,x_pos2,wall_plus,zz,x_pos2,-wall_size + wall_plus,zz + ceiling,c_white,1);
	vertex_add_wall(wall_buff,x_pos2,-wall_size + wall_plus,zz,x_pos2,-wall_size * 2 + wall_plus,zz + ceiling,c_white,1);
vertex_end(wall_buff);

//dark
dark_buff = vertex_create_buffer();
vertex_begin(dark_buff,vForm)
	vertex_add_wall(dark_buff,x_pos,far,zz,x_pos2,far,zz + ceiling,c_black,1);
	vertex_add_wall(dark_buff,x_pos,far + 30,zz,x_pos2,far + 30,zz + ceiling,c_black,0.75);
	vertex_add_wall(dark_buff,x_pos,far + 100,zz,x_pos2,far + 100,zz + ceiling,c_black,0.5);
	vertex_add_wall(dark_buff,x_pos,far + 210,zz,x_pos2,far + 210,zz + ceiling,c_black,0.2);
vertex_end(dark_buff);

//Beams
beams_buff = vertex_create_buffer();


x_lookat_ref = room_width / 2;
y_lookat_ref = -160;
obj_camera_3d.x_lookat = x_lookat_ref;
obj_camera_3d.y_lookat = y_lookat_ref;
obj_camera_3d.depth_lookat = global.bg_depth - 160;

x_cam_ref = room_width / 2;
y_cam_ref = room_height;
obj_camera_3d.x = x_cam_ref;
obj_camera_3d.y = y_cam_ref;
obj_camera_3d.depth = global.bg_depth - 160;

step = 0;

