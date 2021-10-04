/// @description Insert description here
// You can write your code in this editor

/// @description Insert description here
// You can write your code in this editor



window_width = 500;
window_height = 400;

x_offset = global.game_x_offset;
y_offset = global.game_y_offset;

camera = camera_create();
//cam_width= 960 - x_offset;
//cam_height = 540 - y_offset;

x = room_width ;
y = room_height;
depth = 0;

x_lookat = 0;
y_lookat = 0;
depth_lookat = 0;

xup = 0;
yup = 0;
zup = 1;


var vm = matrix_build_lookat(room_width / 2,room_height,-1000,room_width / 2,0,0,0,0,1)

var pm = matrix_build_projection_perspective_fov(60,window_get_width()/window_get_width(),1,32000);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

view_camera[0] = camera;

view_xport[0] = x_offset;
view_yport[0] = y_offset;


x_shake = 0;
y_shake = 0;

step = 0;