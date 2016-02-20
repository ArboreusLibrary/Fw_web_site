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
-vsn("0.0.1.251").

%% API
-export([
	link/1,
	style/2
]).


%%-----------------------------------
%% @doc Return list within prepared css link tag
-spec link(File_url::unicode:latin1_chardata()) -> list().

link(File_url) when is_list(File_url) ->
	lists:concat(["<link href=\"",File_url,"\"rel=\"stylesheet\" type=\"text/css\">\n"]);
link(_) -> "<link class=\"css\">Bad arguments</link>".


%%-----------------------------------
%% @doc Return list within css style tag
-spec style(Type,Parameter) -> list()
	when
		Type :: from_file | from_string | from_binary,
		Parameter :: unicode:latin1_chardata() | string() | byte().

style(from_file,File_path) ->
	case a:read_file(File_path) of
		{error,_Reason} -> "<style>Error: file read</style>";
		File_data -> unicode:characters_to_list(
			<<("<style>\n")/utf8,(File_data)/binary,("\n<style>\n")/utf8>>)
	end;
style(from_string,Css_string) when is_list(Css_string) ->
	lists:concat(["<style>\n",Css_string,"\n</style>\n"]);
style(from_binary,Css_binary) when is_binary(Css_binary) ->
	unicode:characters_to_list(<<("<style>\n")/utf8,(Css_binary)/binary,("\n<style>\n")/utf8>>);
style(_,_) -> "<style class=\"css\">Bad arguments</style>".