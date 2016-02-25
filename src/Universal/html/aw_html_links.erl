%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 25. Февр. 2016 11:01
%%%-------------------------------------------------------------------
-module(aw_html_links).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.270").

%% API
-export([
	nav/3,
	a/3,
	link/2
]).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <nav>
-spec nav(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

nav(string,Attributes,Value) -> aw_html:tag(string,"nav",Attributes,Value);
nav(binary,Attributes,Value) -> aw_html:tag(binary,<<("nav")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <a>
-spec a(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

a(string,Attributes,Value) -> aw_html:tag(string,"a",Attributes,Value);
a(binary,Attributes,Value) -> aw_html:tag(binary,<<("a")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <link>
-spec link(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

link(string,Attributes) -> aw_html:tag(string,"link",Attributes,"single_tag");
link(binary,Attributes) -> aw_html:tag(binary,<<("link")/utf8>>,Attributes,<<("single_tag")/utf8>>).