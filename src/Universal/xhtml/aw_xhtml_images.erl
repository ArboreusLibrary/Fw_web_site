%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 28. Февр. 2016 22:33
%%%-------------------------------------------------------------------
-module(aw_xhtml_images).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").

%% API
-export([
	area/2,
	img/2
]).

%%-----------------------------------
%% @doc Return unicode string or unicode binary within <area />
-spec area(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

area(string,Attributes) -> aw_xhtml:tag(string,"area",Attributes);
area(binary,Attributes) -> aw_xhtml:tag(binary,<<("area")/utf8>>,Attributes).

%%-----------------------------------
%% @doc Return unicode string or unicode binary within <img />
-spec img(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

img(string,Attributes) -> aw_xhtml:tag(string,"img",Attributes);
img(binary,Attributes) -> aw_xhtml:tag(binary,<<("img")/utf8>>,Attributes).