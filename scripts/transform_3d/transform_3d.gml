/// transform_3d(x,y,z,matrix)
///@param x real
///@param y real
///@param z real
///@param matrix matrix

function transform_3d(xx,yy,zz,mat){

	var vect;
	
	for(var i = 0; i < 3; i += 1)
	{
		vect[i] = mat[i,0] * xx + mat[i,1] * yy + mat[i,2] * zz;
	}
	
	return vect;
}


