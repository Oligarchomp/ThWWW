/// vertex_add_custom(buffer,x1,y1,z1,x2,y2,z2,x3,y3,z3,x4,y4,z4,color,alpha)
///@param buffer
///@param x1
///@param y1
///@param z1
///@param x2
///@param y2
///@param z2
///@param x3
///@param y3
///@param z3
///@param x4
///@param y4
///@param z4
///@param color
///@param alpha
function vertex_add_custom(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,argument11,argument12,argument13,argument14){

	var buf = argument0;
	var xx1 = argument1;
	var yy1 = argument2;
	var zz1 = argument3;
	var xx2 = argument4;
	var yy2 = argument5;
	var zz2 = argument6;
	var xx3 = argument7;
	var yy3 = argument8;
	var zz3 = argument9;
	var xx4 = argument10;
	var yy4 = argument11;
	var zz4 = argument12;
	var col = argument13;
	var al = argument14;

	vertex_add(buf,xx4,yy4,zz4,0,0,col,al);
	vertex_add(buf,xx3,yy3,zz3,1,0,col,al);
	vertex_add(buf,xx1,yy1,zz1,0,1,col,al);
	
	vertex_add(buf,xx3,yy3,zz3,1,0,col,al);
	vertex_add(buf,xx2,yy2,zz2,1,1,col,al);
	vertex_add(buf,xx1,yy1,zz1,0,1,col,al);

}