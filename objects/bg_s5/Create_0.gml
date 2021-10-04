/// @description Insert description here
// You can write your code in this editor

x_lookat_ref = room_width / 2;
y_lookat_ref = -20000;
obj_camera_3d.x_lookat = x_lookat_ref;
obj_camera_3d.y_lookat = y_lookat_ref;
obj_camera_3d.depth_lookat = 0;

x_cam_ref = room_width / 2;
y_cam_ref = room_height;
obj_camera_3d.x = x_cam_ref;
obj_camera_3d.y = y_cam_ref;
obj_camera_3d.depth = global.bg_depth;

step = 0;



vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_color();
vertex_format_add_texcoord();
vForm = vertex_format_end();


model = vertex_create_buffer();
vertex_begin(model,vForm)
vertex_add_wall(model,0,0,0,room_width, 0, - room_width,c_white,1);
vertex_end(model);