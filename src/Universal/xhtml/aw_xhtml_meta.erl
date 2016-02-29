%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 28. Февр. 2016 22:38
%%%-------------------------------------------------------------------
-module(aw_xhtml_meta).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.278").

%% API
-export([
	basefont/2,
	base/2,
	meta/2
]).

%%-----------------------------------
%% @doc Return unicode string or unicode binary within <basefont />,
%% tag is not supported in HTML5. Use CSS instead.
-spec basefont(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

basefont(string,Attributes) -> aw_xhtml:tag(string,"basefont",Attributes);
basefont(binary,Attributes) -> aw_xhtml:tag(binary,<<("basefont")/utf8>>,Attributes).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <base />
-spec base(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

base(string,Attributes) -> aw_xhtml:tag(string,"base",Attributes);
base(binary,Attributes) -> aw_xhtml:tag(binary,<<("base")/utf8>>,Attributes).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <meta>
-spec meta(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

meta(string,Attributes) -> aw_xhtml:tag(string,"meta",Attributes);
meta(binary,Attributes) -> aw_xhtml:tag(binary,<<("meta")/utf8>>,Attributes).