%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 24. Февр. 2016 17:38
%%%-------------------------------------------------------------------
-module(aw_html_audiovideo).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.269").

%% API
-export([
	track/2,
	source/2,
	audio/3,
	video/3
]).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <track>
-spec track(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

track(string,Attributes) -> aw_html:tag(string,"track",Attributes,"single_tag");
track(binary,Attributes) -> aw_html:tag(binary,<<("track")/utf8>>,Attributes,<<("single_tag")/utf8>>).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <source>
-spec source(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

source(string,Attributes) -> aw_html:tag(string,"source",Attributes,"single_tag");
source(binary,Attributes) -> aw_html:tag(binary,<<("source")/utf8>>,Attributes,<<("single_tag")/utf8>>).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <audio>
-spec audio(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

audio(string,Attributes,Value) -> mmedia_tag_string("audio",Attributes,Value);
audio(binary,Attributes,Value) -> mmedia_tag_binary("audio",Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <video>
-spec video(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

video(string,Attributes,Value) -> mmedia_tag_string("video",Attributes,Value);
video(binary,Attributes,Value) -> mmedia_tag_binary("video",Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string within prepared tag
-spec mmedia_tag_string(Name,Attributes,Value) -> unicode:chardata()
	when
		Name :: unicode:unicode_binary(),
		Attributes :: proplists:proplist(),
		Value :: unicode:unicode_binary().

mmedia_tag_string(Name,[],Value) -> lists:concat(["<",Name," controls>",Value,"</",Name,">"]);
mmedia_tag_string(Name,Attributes,Value) ->
	lists:concat([
		"<",Name,[lists:concat([" ",Attribute,"=\"",Attribute_value,"\""])||
			{Attribute,Attribute_value} <- Attributes]," controls>",Value,"</",Name,">"
	]).


%%-----------------------------------
%% @doc Return unicode binary within prepared tag
-spec mmedia_tag_binary(Name,Attributes,Value) -> unicode:unicode_binary()
	when
		Name :: unicode:unicode_binary(),
		Attributes :: proplists:proplist(),
		Value :: unicode:unicode_binary().


mmedia_tag_binary(Name,[],Value) ->
	<<("<")/utf8,(Name)/binary,(" controls>")/utf8,
		(Value)/binary,("</")/utf8,(Name)/binary,(">")/utf8>>;
mmedia_tag_binary(Name,Attributes,Value) ->
	<<("<")/utf8,(Name)/binary,
		(list_to_binary([
			<<(" ")/utf8,(Attribute_name)/binary,
				("=\"")/utf8,(Attribute_value)/binary,("\"")/utf8>>||
			{Attribute_name,Attribute_value} <- Attributes
		]))/binary,
		(" controls>")/utf8,(Value)/binary,("</")/utf8,(Name)/binary,(">")/utf8>>.