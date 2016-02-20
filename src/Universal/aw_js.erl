%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 20. Февр. 2016 13:28
%%%-------------------------------------------------------------------
-module(aw_js).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.252").

%% API
-export([
	script/2
]).


%%-----------------------------------
%% @doc Return list within prepared javascript script tag
-spec script(Type,Parameter) -> list()
	when
		Type :: from_link | from_file | from_string | from_binary,
		Parameter :: string() | unicode:latin1_chardata().

script(from_link,File_url) when is_list(File_url) ->
	lists:concat([
		"<script src=\"",File_url,"\" type=\"text/javascript\" charset=\"utf-8\"></script>\n"
	]);
script(from_file,File_path) when is_list(File_path) ->
	case a:read_file(File_path) of
		{error,_Reason} -> "<script class=\"javascript\">Error: file read</script>";
		File_data -> unicode:characters_to_list(
			<<("<script>\n")/utf8,(File_data)/binary,("\n</script>\n")/utf8>>)
	end;
script(from_string,Javascript_string) when is_list(Javascript_string) ->
	lists:concat(["<script>\n",Javascript_string,"\n</script>\n"]);
script(from_binary,Javascript_binary) when is_binary(Javascript_binary) ->
	unicode:characters_to_list(
		<<("<script>\n")/utf8,(Javascript_binary)/binary,("\n</script>\n")/utf8>>
	);
script(_,_) -> "<script class=\"javascript\">Bad arguments</script>".