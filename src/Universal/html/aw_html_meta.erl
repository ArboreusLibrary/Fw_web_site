%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 25. Февр. 2016 13:09
%%%-------------------------------------------------------------------
-module(aw_html_meta).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.276").

%% API
-export([
	base/2,basefont/2,
	head/3,
	meta/2
]).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <basefont>,
%% tag is not supported in HTML5. Use CSS instead.
-spec basefont(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

basefont(string,Attributes) -> aw_html:tag(string,"basefont",Attributes,"single_tag");
basefont(binary,Attributes) -> aw_html:tag(binary,<<("basefont")/utf8>>,Attributes,<<("single_tag")/utf8>>).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <base>
-spec base(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

base(string,Attributes) -> aw_html:tag(string,"base",Attributes,"single_tag");
base(binary,Attributes) -> aw_html:tag(binary,<<("base")/utf8>>,Attributes,<<("single_tag")/utf8>>).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <meta>
-spec meta(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

meta(string,Attributes) -> aw_html:tag(string,"meta",Attributes,"single_tag");
meta(binary,Attributes) -> aw_html:tag(binary,<<("meta")/utf8>>,Attributes,<<("single_tag")/utf8>>).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <head>
-spec head(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

head(string,Attributes,Value) -> aw_html:tag(string,"head",Attributes,Value);
head(binary,Attributes,Value) -> aw_html:tag(binary,<<("head")/utf8>>,Attributes,Value).