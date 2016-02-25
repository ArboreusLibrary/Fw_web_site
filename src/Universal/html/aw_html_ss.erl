%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 25. Февр. 2016 12:52
%%%-------------------------------------------------------------------
-module(aw_html_ss).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.275").

%% API
-export([
	article/3,aside/3,
	ddiv/3,details/3,dialog/3,
	footer/3,
	header/3,
	main/3,
	section/3,style/3,summary/3
]).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <summary>
-spec summary(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

summary(string,Attributes,Value) -> aw_html:tag(string,"summary",Attributes,Value);
summary(binary,Attributes,Value) -> aw_html:tag(binary,<<("summary")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <dialog>
-spec dialog(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

dialog(string,Attributes,Value) -> aw_html:tag(string,"dialog",Attributes,Value);
dialog(binary,Attributes,Value) -> aw_html:tag(binary,<<("dialog")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <details>
-spec details(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

details(string,Attributes,Value) -> aw_html:tag(string,"details",Attributes,Value);
details(binary,Attributes,Value) -> aw_html:tag(binary,<<("details")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <aside>
-spec aside(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

aside(string,Attributes,Value) -> aw_html:tag(string,"aside",Attributes,Value);
aside(binary,Attributes,Value) -> aw_html:tag(binary,<<("aside")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <article>
-spec article(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

article(string,Attributes,Value) -> aw_html:tag(string,"article",Attributes,Value);
article(binary,Attributes,Value) -> aw_html:tag(binary,<<("article")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <section>
-spec section(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

section(string,Attributes,Value) -> aw_html:tag(string,"section",Attributes,Value);
section(binary,Attributes,Value) -> aw_html:tag(binary,<<("section")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <main>
-spec main(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

main(string,Attributes,Value) -> aw_html:tag(string,"main",Attributes,Value);
main(binary,Attributes,Value) -> aw_html:tag(binary,<<("main")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <footer>
-spec footer(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

footer(string,Attributes,Value) -> aw_html:tag(string,"footer",Attributes,Value);
footer(binary,Attributes,Value) -> aw_html:tag(binary,<<("footer")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <header>
-spec header(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

header(string,Attributes,Value) -> aw_html:tag(string,"header",Attributes,Value);
header(binary,Attributes,Value) -> aw_html:tag(binary,<<("header")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <div>
-spec ddiv(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

ddiv(string,Attributes,Value) -> aw_html:tag(string,"div",Attributes,Value);
ddiv(binary,Attributes,Value) -> aw_html:tag(binary,<<("div")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <style>
-spec style(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

style(string,Attributes,Value) -> aw_html:tag(string,"style",Attributes,Value);
style(binary,Attributes,Value) -> aw_html:tag(binary,<<("style")/utf8>>,Attributes,Value).