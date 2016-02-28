%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 28. Февр. 2016 22:44
%%%-------------------------------------------------------------------
-module(aw_xhtml_tables).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").

%% API
-export([
	col/2
]).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <col />
-spec col(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

col(string,Attributes) -> aw_xhtml:tag(string,"col",Attributes);
col(binary,Attributes) -> aw_xhtml:tag(binary,<<("col")/utf8>>,Attributes).