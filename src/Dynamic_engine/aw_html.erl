%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 19. Февр. 2016 19:28
%%%-------------------------------------------------------------------
-module(aw_html).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.3.242").

%% API
-export([
	link/2,
	script/2,
	title/1
]).

%%-----------------------------------
%% @doc Return prepared for Yaws Appmod link tag
-spec link(Type,File_path) -> list()
	when
		Type :: atom(),
		File_path :: unicode:chardata().

link(css,File_path) when is_list(File_path) ->
	lists:concat(["<link href=\"",File_path,"\" rel=\"stylesheet\" type=\"text/css\">\n"]);
link(_,_) -> "<link>Bad argument</link>\n".


%%-----------------------------------
%% @doc Return prepared for Yaws Appmod script tag
-spec script(Type,Properties) -> list()
	when
		Type :: atom(),
		Properties :: any().

script(js,{file_link,Url,Charset}) when is_list(Url), is_list(Charset) ->
	lists:concat(["<script type=\"text/javascript\" src=\"",Url,"\" charset=\"",Charset,"\"></script>\n"]);
script(js,{script,Script}) when is_list(Script) ->
	lists:concat(["<script>",Script,"</script>\n"]);
script(_,_) -> "<script>Bad argument</script>".


%%-----------------------------------
%% @doc Return prepared for Yaws Appmod title tag
-spec title(Title::unicode:chardata()) -> unicode:chardata().

title(Title) when is_list(Title) ->
	lists:concat(["<title>",Title,"</title>\n"]);
title(_) -> "<title>Bad argument</title>\n".