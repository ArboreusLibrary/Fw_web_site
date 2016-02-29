%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 28. Февр. 2016 22:31
%%%-------------------------------------------------------------------
-module(aw_xhtml_frames).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.278").

%% API
-export([
	frame/2
]).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <frame />,
%% tag is not supported in HTML5.
-spec frame(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

frame(string,Attributes) -> aw_xhtml:tag(string,"frame",Attributes);
frame(binary,Attributes) -> aw_xhtml:tag(binary,<<("frame")/utf8>>,Attributes).