%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 20. Февр. 2016 12:30
%%%-------------------------------------------------------------------
-module(aw_css).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.3.265").

%% API
-export([
	link/2,
	style/3
]).


%%-----------------------------------
%% @doc Return list within prepared css link tag
-spec link(Output_type,File_url) -> list()
	when
		Output_type :: binary | string,
		File_url :: unicode:unicode_binary() | unicode:latin1_chardata().

link(binary,File_url) when is_list(File_url) ->
	<<("<link href=\"")/utf8,(list_to_binary(File_url))/binary,
		("\"rel=\"stylesheet\" type=\"text/css\">\n")/utf8>>;
link(string,File_url) when is_list(File_url) ->
	lists:concat([
		"<link href=\"",File_url,"\"rel=\"stylesheet\" type=\"text/css\">\n"
	]);
link(_,_) -> "<link class=\"css\">Bad arguments</link>".


%%-----------------------------------
%% @doc Return list within css style tag
-spec style(Output_type,Type,Parameter) -> list()
	when
		Output_type :: binary | string,
		Type :: from_file | from_string | from_binary,
		Parameter :: unicode:latin1_chardata() | string() | byte().

style(string,from_file,File_path) ->
	case a:read_file(File_path) of
		{error,_Reason} -> "<style>Error: file read</style>";
		File_data -> unicode:characters_to_list(
			<<("<style>\n")/utf8,(File_data)/binary,("\n</style>\n")/utf8>>)
	end;
style(binary,from_file,File_path) ->
	case a:read_file(File_path) of
		{error,_Reason} -> <<("<style>Error: file read</style>")/utf8>>;
		File_data -> <<("<style>\n")/utf8,(File_data)/binary,("\n</style>\n")/utf8>>
	end;
style(string,from_string,Css_string) when is_list(Css_string) ->
	lists:concat(["<style>\n",Css_string,"\n</style>\n"]);
style(binary,from_binary,Css_binary) when is_binary(Css_binary) ->
	<<("<style>\n")/utf8,(Css_binary)/binary,("\n</style>\n")/utf8>>;
style(_,_,_) -> "<style class=\"css\">Bad arguments</style>".