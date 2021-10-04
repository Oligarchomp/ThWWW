/// vertex_add_wall(buffer,x1,y1,z1,x2,y2,z2,color,alpha)
///@param buffer
///@param x1
///@param y1
///@param z1
///@param x2
///@param y2
///@param z2
///@param color
///@param alpha
function vertex_add_wall(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8){

	var buf = argument0;
	var xx1 = argument1;
	var yy1 = argument2;
	var zz1 = argument3;
	var xx2 = argument4;
	var yy2 = argument5;
	var zz2 = argument6;
	var col = argument7;
	var al = argument8;

	vertex_add(buf,xx1,yy1,zz2,0,0,col,al);
	vertex_add(buf,xx2,yy2,zz2,1,0,col,al);
	vertex_add(buf,xx1,yy1,zz1,0,1,col,al);
	vertex_add(buf,xx2,yy2,zz2,1,0,col,al);
	vertex_add(buf,xx2,yy2,zz1,1,0,col,al);
	vertex_add(buf,xx1,yy1,zz1,0,1,col,al);

}