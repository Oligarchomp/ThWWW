/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	y += vsp
	y %= height;


	var zz = global.bg_depth;

	var wall_x_ref = width / 2;
	var x_pos = room_width / 2 - wall_x_ref
	var x_pos2 = room_width / 2 + wall_x_ref

	vertex_format_begin();
	vertex_format_add_position_3d();
	vertex_format_add_color();
	vertex_format_add_texcoord();
	vForm = vertex_format_end();


	wall_plus += vsp;
	wall_plus %= wall_size;
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



	obj_camera_3d.x = x_cam_ref + sin(step / 70) * 20;




	step += 1;
}