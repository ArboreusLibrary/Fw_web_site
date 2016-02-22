%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 22. Февр. 2016 21:22
%%%-------------------------------------------------------------------
-module(aw_html_frames).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.262").

%% API
-export([
	iframe/3,
	noframes/3,
	frameset/3,frame/2
]).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <iframe>,
%% tag is not supported in HTML5.
-spec iframe(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

iframe(string,Attributes,Value) -> aw_html:tag(string,"iframe",Attributes,Value);
iframe(binary,Attributes,Value) -> aw_html:tag(binary,<<("iframe")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <noframes>,
%% tag is not supported in HTML5.
-spec noframes(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

noframes(string,Attributes,Value) -> aw_html:tag(string,"noframes",Attributes,Value);
noframes(binary,Attributes,Value) -> aw_html:tag(binary,<<("noframes")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <frameset>,
%% tag is not supported in HTML5.
-spec frameset(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

frameset(string,Attributes,Value) -> aw_html:tag(string,"frameset",Attributes,Value);
frameset(binary,Attributes,Value) -> aw_html:tag(binary,<<("frameset")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <frame>,
%% tag is not supported in HTML5.
-spec frame(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

frame(string,Attributes) -> aw_html:tag(string,"frame",Attributes,"single_tag");
frame(binary,Attributes) -> aw_html:tag(binary,<<("frame")/utf8>>,Attributes,<<("single_tag")/utf8>>).