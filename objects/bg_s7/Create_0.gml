/// @description Insert description here
// You can write your code in this editor


depth = global.bg_depth - 40;
x = room_width / 2;
y = 0;

height = sprite_get_height(sprite_index);
width = sprite_get_width(sprite_index)

spd = 7;



vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_color();
vertex_format_add_texcoord();
vForm = vertex_format_end();



roof_plus = 0;

y_ref = -700;
roof_size = 380;
x_rooffset = 360;
z_roofset1 = 40;
z_roofset2 = 90;

//roof 
roof_buff = vertex_create_buffer();
vertex_begin(roof_buff,vForm)
//left
	var x_ref = x - width / 2;
	vertex_add_custom(roof_buff,x_ref,y_ref + roof_plus,depth + z_roofset1,x_ref,y_ref + roof_size + roof_plus,depth + z_roofset1,x_ref - x_rooffset,y_ref + roof_size + roof_plus,depth + z_roofset2,x_ref - x_rooffset,y_ref + roof_plus,depth + z_roofset2,c_white,1);
	vertex_add_custom(roof_buff,x_ref,y_ref + roof_size + roof_plus,depth + z_roofset1,x_ref,y_ref + roof_size * 2 + roof_plus,depth + z_roofset1,x_ref - x_rooffset,y_ref + roof_size * 2 + roof_plus,depth + z_roofset2,x_ref - x_rooffset,y_ref + roof_size + roof_plus,depth + z_roofset2,c_white,1);
	vertex_add_custom(roof_buff,x_ref,y_ref + roof_size * 2 + roof_plus,depth + z_roofset1,x_ref,y_ref + roof_size * 3 + roof_plus,depth + z_roofset1,x_ref - x_rooffset,y_ref + roof_size * 3 + roof_plus,depth + z_roofset2,x_ref - x_rooffset,y_ref + roof_size * 2 + roof_plus,depth + z_roofset2,c_white,1);
//right
	var x_ref = x + width / 2;
	vertex_add_custom(roof_buff,x_ref,y_ref + roof_plus,depth + z_roofset1,x_ref,y_ref + roof_size + roof_plus,depth + z_roofset1,x_ref + x_rooffset,y_ref + roof_size + roof_plus,depth + z_roofset2,x_ref + x_rooffset,y_ref + roof_plus,depth + z_roofset2,c_white,1);
	vertex_add_custom(roof_buff,x_ref,y_ref + roof_size + roof_plus,depth + z_roofset1,x_ref,y_ref + roof_size * 2 + roof_plus,depth + z_roofset1,x_ref + x_rooffset,y_ref + roof_size * 2 + roof_plus,depth + z_roofset2,x_ref + x_rooffset,y_ref + roof_size + roof_plus,depth + z_roofset2,c_white,1);
	vertex_add_custom(roof_buff,x_ref,y_ref + roof_size * 2 + roof_plus,depth + z_roofset1,x_ref,y_ref + roof_size * 3 + roof_plus,depth + z_roofset1,x_ref + x_rooffset,y_ref + roof_size * 3 + roof_plus,depth + z_roofset2,x_ref + x_rooffset,y_ref + roof_size * 2 + roof_plus,depth + z_roofset2,c_white,1);
vertex_end(roof_buff);




x_lookat_ref = room_width / 2;
y_lookat_ref = 90;
obj_camera_3d.x_lookat = x_lookat_ref;
obj_camera_3d.y_lookat = y_lookat_ref;
obj_camera_3d.depth_lookat = 0;

x_cam_ref = room_width / 2;
y_cam_ref = room_height - 110;
obj_camera_3d.x = x_cam_ref;
obj_camera_3d.y = y_cam_ref;
obj_camera_3d.depth = -600;

step = 0;


gpu_set_ztestenable(true);