/// @function get_text(string)
/// @description Get the correct string in the external text file
/// @param {string} string the name of the string to look at for
function get_text(argument0) {

	var string_name = argument0;
	var final_string = argument0; // just so it exist

	var file = file_text_open_read(working_directory + "\GameText_eng.txt");
	
	do 
	{
		final_string = file_text_readln(file);
		if(file_text_eof(file))
		{
			final_string = "Text not found"
			exit;
		}
	}
	until (string_count(string_name,final_string) = 1)

		   
	// for editing the string   
	final_string = string_replace(final_string,string_name,"")
	final_string = string_replace(final_string," = ","")
	
	while(string_pos("*",final_string))
	{
		final_string = string_replace(final_string,"*","\n")//this makes no freaking sense! Why does it only works like this ?
	}

	file_text_close(file);
		
	return final_string;
}
