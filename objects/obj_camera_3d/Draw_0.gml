var x_pos = x + x_shake;
var y_pos = y + y_shake;
var x_look = x_lookat + x_shake;
var y_look = y_lookat + y_shake;
camera_set_view_mat(camera,matrix_build_lookat(x_pos,y_pos,depth,x_look,y_look,depth_lookat,xup,yup,zup));
camera_set_proj_mat(camera,matrix_build_projection_perspective_fov(FOV,window_get_width()/window_get_width(),1,32000));
view_camera[0] = camera;

