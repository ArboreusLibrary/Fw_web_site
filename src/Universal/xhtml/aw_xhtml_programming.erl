%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 28. Февр. 2016 22:41
%%%-------------------------------------------------------------------
-module(aw_xhtml_programming).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.278").

%% API
-export([
	param/2,
	embed/2
]).

%%-----------------------------------
%% @doc Return unicode string or unicode binary within <param />
-spec param(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

param(string,Attributes) -> aw_xhtml:tag(string,"param",Attributes);
param(binary,Attributes) -> aw_xhtml:tag(binary,<<("param")/utf8>>,Attributes).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <embed />
-spec embed(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

embed(string,Attributes) -> aw_xhtml:tag(string,"embed",Attributes);
embed(binary,Attributes) -> aw_xhtml:tag(binary,<<("embed")/utf8>>,Attributes).