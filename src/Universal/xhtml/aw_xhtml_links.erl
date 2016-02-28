%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 28. Февр. 2016 22:36
%%%-------------------------------------------------------------------
-module(aw_xhtml_links).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").

%% API
-export([
	link/2
]).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <link />
-spec link(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

link(string,Attributes) -> aw_xhtml:tag(string,"link",Attributes);
link(binary,Attributes) -> aw_xhtml:tag(binary,<<("link")/utf8>>,Attributes).