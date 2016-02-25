%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 25. Февр. 2016 13:23
%%%-------------------------------------------------------------------
-module(aw_html_programming).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.277").

%% API
-export([
	applet/3,
	embed/2,
	noscript/2,
	object/3,
	param/2,
	script/3
]).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <param>
-spec param(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

param(string,Attributes) -> aw_html:tag(string,"param",Attributes,"single_tag");
param(binary,Attributes) -> aw_html:tag(binary,<<("param")/utf8>>,Attributes,<<("single_tag")/utf8>>).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <object>
-spec object(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

object(string,Attributes,Value) -> aw_html:tag(string,"object",Attributes,Value);
object(binary,Attributes,Value) -> aw_html:tag(binary,<<("object")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <embed>
-spec embed(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

embed(string,Attributes) -> aw_html:tag(string,"embed",Attributes,"single_tag");
embed(binary,Attributes) -> aw_html:tag(binary,<<("embed")/utf8>>,Attributes,<<("single_tag")/utf8>>).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <applet>,
%% tag is not supported in HTML5. Use <embed> or <object> instead.
-spec applet(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

applet(string,Attributes,Value) -> aw_html:tag(string,"applet",Attributes,Value);
applet(binary,Attributes,Value) -> aw_html:tag(binary,<<("applet")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <noscript>
-spec noscript(Type,Message) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Message :: unicode:chardata() | unicode:unicode_binary().

noscript(string,Message) when is_list(Message) ->
	lists:concat(["<noscript>",Message,"</noscript>\n"]);
noscript(binary,Message) when is_binary(Message) ->
	<<("<noscript>")/utf8,(Message)/binary,("</noscript>\n")/utf8>>;
noscript(_,_) -> "<noscript>Bad arguments</noscript>\n".


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <script>
-spec script(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

script(string,Attributes,Value) -> aw_html:tag(string,"script",Attributes,Value);
script(binary,Attributes,Value) -> aw_html:tag(binary,<<("script")/utf8>>,Attributes,Value).