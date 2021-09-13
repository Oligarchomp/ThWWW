/// @function get_text(string)
/// @description Get the correct string in the external text file
/// @param {string} string the name of the string to look at for
function get_text(argument0) {

	string_name = argument0;
	final_string = argument0; // just so it exist

	var file = file_text_open_read(working_directory + "\GameText_eng.txt");
	
	do 
	{
		final_string = file_text_readln(file);
	}
	until (string_count(string_name,final_string) = 1)

		   
	// for editing the string   
	final_string = string_replace(final_string,string_name,"")
	final_string = string_replace(final_string," = ","")


	file_text_close(file);
		
	return final_string;
}
