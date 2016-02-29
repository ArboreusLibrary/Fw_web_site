%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 28. Февр. 2016 22:28
%%%-------------------------------------------------------------------
-module(aw_xhtml_audiovideo).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.278").

%% API
-export([
	track/2,
	source/2
]).

%%-----------------------------------
%% @doc Return unicode string or unicode binary within <track />
-spec track(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

track(string,Attributes) -> aw_xhtml:tag(string,"track",Attributes);
track(binary,Attributes) -> aw_xhtml:tag(binary,<<("track")/utf8>>,Attributes).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <source />
-spec source(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

source(string,Attributes) -> aw_xhtml:tag(string,"source",Attributes);
source(binary,Attributes) -> aw_xhtml:tag(binary,<<("source")/utf8>>,Attributes).