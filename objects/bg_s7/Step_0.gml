/// @description Insert description here
// You can write your code in this editor
if(global.gp_active)
{
	y += spd;
	y %= height;
	
	
	roof_plus += spd;
	roof_plus %= roof_size;
	
	//roof 
	//vertex_delete_buffer(roof_buff);
	//roof_buff = vertex_create_buffer();
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




}