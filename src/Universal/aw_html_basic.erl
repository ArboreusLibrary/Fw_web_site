%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 22. Февр. 2016 11:42
%%%-------------------------------------------------------------------
-module(aw_html_basic).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.257").

%% API
-export([
	comment/2,
	hr/2,
	br/2,
	p/3,
	h1/3,h2/3,h3/3,h4/3,h5/3,h6/3,
	body/3,
	title/3,
	html/3,
	doctype/2
]).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <hr>
-spec comment(Type,Comment) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Comment :: unicode:chardata() | unicode:unicode_binary().

comment(string,Comment) when is_list(Comment) ->
	lists:concat(["<!-- ",Comment," -->"]);
comment(binary,Comment) when is_binary(Comment) ->
	<<("<!-- ")/utf8,(Comment)/binary,(" -->")/utf8>>;
comment(_,_) -> "<!-- Comment error: bad arguments -->".


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <hr>
-spec hr(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

hr(string,Attributes) -> aw_html:tag(string,"hr",Attributes,"single_tag");
hr(binary,Attributes) -> aw_html:tag(binary,<<("hr")/utf8>>,Attributes,<<("single_tag")/utf8>>).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <br>
-spec br(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

br(string,Attributes) -> aw_html:tag(string,"br",Attributes,"single_tag");
br(binary,Attributes) -> aw_html:tag(binary,<<("br")/utf8>>,Attributes,<<("single_tag")/utf8>>).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <p>
-spec p(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

p(string,Attributes,Value) -> aw_html:tag(string,"p",Attributes,Value);
p(binary,Attributes,Value) -> aw_html:tag(binary,<<("p")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <h1>
-spec h1(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

h1(string,Attributes,Value) -> aw_html:tag(string,"h1",Attributes,Value);
h1(binary,Attributes,Value) -> aw_html:tag(binary,<<("h1")/utf8>>,Attributes,Value).
h2(string,Attributes,Value) -> aw_html:tag(string,"h2",Attributes,Value);
h2(binary,Attributes,Value) -> aw_html:tag(binary,<<("h2")/utf8>>,Attributes,Value).
h3(string,Attributes,Value) -> aw_html:tag(string,"h3",Attributes,Value);
h3(binary,Attributes,Value) -> aw_html:tag(binary,<<("h3")/utf8>>,Attributes,Value).
h4(string,Attributes,Value) -> aw_html:tag(string,"h4",Attributes,Value);
h4(binary,Attributes,Value) -> aw_html:tag(binary,<<("h4")/utf8>>,Attributes,Value).
h5(string,Attributes,Value) -> aw_html:tag(string,"h5",Attributes,Value);
h5(binary,Attributes,Value) -> aw_html:tag(binary,<<("h5")/utf8>>,Attributes,Value).
h6(string,Attributes,Value) -> aw_html:tag(string,"h6",Attributes,Value);
h6(binary,Attributes,Value) -> aw_html:tag(binary,<<("h6")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <body>
-spec body(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

body(string,Attributes,Value) -> aw_html:tag(string,"body",Attributes,Value);
body(binary,Attributes,Value) -> aw_html:tag(binary,<<("body")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <title>
-spec title(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

title(string,Attributes,Value) -> aw_html:tag(string,"title",Attributes,Value);
title(binary,Attributes,Value) -> aw_html:tag(binary,<<("title")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <html>
-spec html(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

html(string,Attributes,Value) -> aw_html:tag(string,"html",Attributes,Value);
html(binary,Attributes,Value) -> aw_html:tag(binary,<<("html")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within HTML Doctype specification
-spec doctype(Output_type,Type) -> unicode:chardata() | unicode:latin1_binary()
	when
		Output_type :: string | binary,
		Type :: html401_strict | html401_transitional | html401_frameset | html5.

doctype(string,html401_strict) ->
	"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">";
doctype(binary,html401_strict) ->
	<<("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">")/utf8>>;
doctype(string,html401_transitional) ->
	"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">";
doctype(binary,html401_transitional) ->
	<<("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">")/utf8>>;
doctype(string,html401_frameset) ->
	"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Frameset//EN\" \"http://www.w3.org/TR/html4/frameset.dtd\">";
doctype(binary,html401_frameset) ->
	<<("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Frameset//EN\" \"http://www.w3.org/TR/html4/frameset.dtd\">")/utf8>>;
doctype(string,html5) ->
	"<!DOCTYPE html>";
doctype(binary,html5) ->
	<<("<!DOCTYPE html>")/utf8>>;

doctype(_,_) -> "<!DOCTYPE error: bad arguments>".