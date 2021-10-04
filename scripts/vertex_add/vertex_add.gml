/// vertex_add(bufer,x1,y1,z1,uvX,uvY,color,alpha)
///@param buffer
///@param x
///@param y
///@param z
///@param uvX
///@param uvY
///@param color
///@param alpha
function vertex_add(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7){

	var buf = argument0;
	var xx = argument1;
	var yy = argument2;
	var zz = argument3;
	var uvx = argument4;
	var uvy = argument5;
	var col = argument6;
	var al = argument7;
	
	vertex_position_3d(buf,xx,yy,zz);
	vertex_color(buf,col,al);
	vertex_texcoord(buf,uvx,uvy);
}