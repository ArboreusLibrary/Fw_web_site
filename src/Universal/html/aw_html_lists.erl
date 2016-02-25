%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 25. Февр. 2016 11:30
%%%-------------------------------------------------------------------
-module(aw_html_lists).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.272").

%% API
-export([
	menuitem/3,
	menu/3,
	dd/3,dt/3,dir/3,dl/3,
	li/3,
	ol/3,
	ul/3
]).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <menuitem>
-spec menuitem(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

menuitem(string,Attributes,Value) -> aw_html:tag(string,"menuitem",Attributes,Value);
menuitem(binary,Attributes,Value) -> aw_html:tag(binary,<<("menuitem")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <menu>
-spec menu(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

menu(string,Attributes,Value) -> aw_html:tag(string,"menu",Attributes,Value);
menu(binary,Attributes,Value) -> aw_html:tag(binary,<<("menu")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <dd>
-spec dd(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

dd(string,Attributes,Value) -> aw_html:tag(string,"dd",Attributes,Value);
dd(binary,Attributes,Value) -> aw_html:tag(binary,<<("dd")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <dt>
-spec dt(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

dt(string,Attributes,Value) -> aw_html:tag(string,"dt",Attributes,Value);
dt(binary,Attributes,Value) -> aw_html:tag(binary,<<("dt")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <dl>
-spec dl(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

dl(string,Attributes,Value) -> aw_html:tag(string,"dl",Attributes,Value);
dl(binary,Attributes,Value) -> aw_html:tag(binary,<<("dl")/utf8>>,Attributes,Value).



%%-----------------------------------
%% @doc Return unicode string or unicode binary within <dir>,
%% tag is not supported in HTML5. Use CSS instead.
-spec dir(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

dir(string,Attributes,Value) -> aw_html:tag(string,"dir",Attributes,Value);
dir(binary,Attributes,Value) -> aw_html:tag(binary,<<("dir")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <li>
-spec li(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

li(string,Attributes,Value) -> aw_html:tag(string,"li",Attributes,Value);
li(binary,Attributes,Value) -> aw_html:tag(binary,<<("li")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <ol>
-spec ol(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

ol(string,Attributes,Value) -> aw_html:tag(string,"ol",Attributes,Value);
ol(binary,Attributes,Value) -> aw_html:tag(binary,<<("ol")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <ul>
-spec ul(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

ul(string,Attributes,Value) -> aw_html:tag(string,"ul",Attributes,Value);
ul(binary,Attributes,Value) -> aw_html:tag(binary,<<("ul")/utf8>>,Attributes,Value).