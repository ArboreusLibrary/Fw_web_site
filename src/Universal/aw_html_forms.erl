%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 22. Февр. 2016 20:04
%%%-------------------------------------------------------------------
-module(aw_html_forms).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").

%% API
-export([
	output/3,
	keygen/3,
	datalist/3,
	legend/3,
	fieldset/3,
	label/3,
	option/3,optgroup/3,
	select/3,
	button/3,
	textarea/3,
	input/3,
	form/3
]).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <output>.
-spec output(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

output(string,Attributes,Value) -> aw_html:tag(string,"output",Attributes,Value);
output(binary,Attributes,Value) -> aw_html:tag(binary,<<("output")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <keygen>.
-spec keygen(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

keygen(string,Attributes,Value) -> aw_html:tag(string,"keygen",Attributes,Value);
keygen(binary,Attributes,Value) -> aw_html:tag(binary,<<("keygen")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <datalist>.
-spec datalist(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

datalist(string,Attributes,Value) -> aw_html:tag(string,"datalist",Attributes,Value);
datalist(binary,Attributes,Value) -> aw_html:tag(binary,<<("datalist")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <legend>.
-spec legend(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

legend(string,Attributes,Value) -> aw_html:tag(string,"legend",Attributes,Value);
legend(binary,Attributes,Value) -> aw_html:tag(binary,<<("legend")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <fieldset>.
-spec fieldset(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

fieldset(string,Attributes,Value) -> aw_html:tag(string,"fieldset",Attributes,Value);
fieldset(binary,Attributes,Value) -> aw_html:tag(binary,<<("fieldset")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <label>.
-spec label(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

label(string,Attributes,Value) -> aw_html:tag(string,"label",Attributes,Value);
label(binary,Attributes,Value) -> aw_html:tag(binary,<<("label")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <option>.
-spec option(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

option(string,Attributes,Value) -> aw_html:tag(string,"option",Attributes,Value);
option(binary,Attributes,Value) -> aw_html:tag(binary,<<("option")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <optgroup>.
-spec optgroup(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

optgroup(string,Attributes,Value) -> aw_html:tag(string,"optgroup",Attributes,Value);
optgroup(binary,Attributes,Value) -> aw_html:tag(binary,<<("optgroup")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <select>.
-spec select(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

select(string,Attributes,Value) -> aw_html:tag(string,"select",Attributes,Value);
select(binary,Attributes,Value) -> aw_html:tag(binary,<<("select")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <button>.
-spec button(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

button(string,Attributes,Value) -> aw_html:tag(string,"button",Attributes,Value);
button(binary,Attributes,Value) -> aw_html:tag(binary,<<("button")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <textarea>.
-spec textarea(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

textarea(string,Attributes,Value) -> aw_html:tag(string,"textarea",Attributes,Value);
textarea(binary,Attributes,Value) -> aw_html:tag(binary,<<("textarea")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <input>.
-spec input(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

input(string,Attributes,Value) -> aw_html:tag(string,"input",Attributes,Value);
input(binary,Attributes,Value) -> aw_html:tag(binary,<<("input")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <form>.
-spec form(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

form(string,Attributes,Value) -> aw_html:tag(string,"form",Attributes,Value);
form(binary,Attributes,Value) -> aw_html:tag(binary,<<("form")/utf8>>,Attributes,Value).