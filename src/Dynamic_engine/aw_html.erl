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
-vsn("0.0.1.240").

%% API
-export([
	link/2
]).

%%-----------------------------------
%% @doc Return prepared for Yaws Appmod link tag
-spec link(Type,File_path) -> list()
	when
		Type :: atom(),
		File_path :: unicode:latin1_charlist().

link(css,File_path) when is_list(File_path) ->
	case io_lib:char_list(File_path) of
		true -> lists:concat(["<link href=\"",File_path,"\" rel=\"stylesheet\" type=\"text/css\">\n"]);
		false -> "<link>Bad argument</link>\n"
	end;
link(_,_) -> "<link>Bad argument</link>\n".