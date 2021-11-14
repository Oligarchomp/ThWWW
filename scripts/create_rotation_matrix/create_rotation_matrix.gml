/// create_rotation_matrix(,alpha,beta,gamma)
///@param alpha real
///@param beta real
///@param gamma real
function create_rotation_matrix(alpha,beta,gamma){

	var mat;

	mat[0,0] = cos(alpha) * cos(beta);
	mat[0,1] = cos(alpha) * sin(beta) * sin(gamma) - sin(alpha) * cos(gamma);
	mat[0,2] = cos(alpha) * sin(beta) * cos(gamma) + sin(alpha) * sin(gamma)
	
	mat[1,0] = sin(alpha) * cos(beta);
	mat[1,1] = sin(alpha) * sin(beta) * sin(gamma) + cos(alpha) * cos(gamma);
	mat[1,2] = sin(alpha) * sin(beta) * cos(gamma) - cos(alpha) * sin(gamma);
	
	mat[2,0] = -sin(beta);
	mat[2,1] = cos(beta) * sin(gamma);
	mat[2,2] = cos(beta) * cos(gamma);
	
	return mat;

}