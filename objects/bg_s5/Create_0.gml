/// @description Insert description here
// You can write your code in this editor

x = room_width / 2;
y = 0;
depth = global.bg_depth;

width = sprite_get_width(sprite_index);
height = sprite_get_height(sprite_index);
vsp = 2;

wall_plus = 0;

ceiling = -250;

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
	vertex_add_wall(dark_buff,x_pos,far + 70,zz,x_pos2,far + 70,zz + ceiling,c_black,0.5);
	vertex_add_wall(dark_buff,x_pos,far + 150,zz,x_pos2,far + 150,zz + ceiling,c_black,0.4);
	vertex_add_wall(dark_buff,x_pos,far + 200,zz,x_pos2,far + 200,zz + ceiling,c_black,0.2);
vertex_end(dark_buff);

beam_dist = 210; // have to be a multiple of vsp
beam_size = 30;
beam_plus = 0;
beam_nbr = 4;
//Beams
beam_buff = vertex_create_buffer();
vertex_begin(beam_buff,vForm)
	for(var b = 0; b < beam_nbr; b += 1)
	{
		for(var i = 0; i < wall_x_ref * 2; i += beam_size)
		{
			vertex_add_wall(beam_buff,x_pos + i,far + b * beam_dist + beam_plus,zz + ceiling + beam_size,x_pos + i + beam_size,far + b * beam_dist + beam_plus,zz + ceiling,c_white,1);
		}
	}
vertex_end(beam_buff);


y_beam = far;
while(y_beam < 500)
{
	var inst = instance_create_depth(room_width / 2,y_beam,zz + ceiling + beam_size,obj_beam);
	inst.vsp = vsp;
	
	y_beam += beam_dist;
}



x_lookat_ref = room_width / 2;
y_lookat_ref = -160;
obj_camera_3d.x_lookat = x_lookat_ref;
obj_camera_3d.y_lookat = y_lookat_ref;
obj_camera_3d.depth_lookat = global.bg_depth + 125;

x_cam_ref = room_width / 2;
y_cam_ref = room_height;
obj_camera_3d.x = x_cam_ref;
obj_camera_3d.y = y_cam_ref;
obj_camera_3d.depth = global.bg_depth - 200;

obj_camera_3d.FOV = 65;

step = 0;

gpu_set_ztestenable(true);