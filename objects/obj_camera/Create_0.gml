/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor



window_width = 960;
window_height = 540;

x_offset = room == room_gp ? 156 : 0;
y_offset = room == room_gp ? 20 : 0;

camera = camera_create();
//cam_width= 960 - x_offset;
//cam_height = 540 - y_offset;

x = window_width / 2;
y = window_height / 2;


var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);

var pm = matrix_build_projection_ortho(window_width,window_height,1,10000);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[1] = camera;

view_xport[1] = x_offset;
view_yport[1] = y_offset;




x_shake = 0;
y_shake = 0;

step = 0;