%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 24. Февр. 2016 17:22
%%%-------------------------------------------------------------------
-module(aw_html_images).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").

%% API
-export([
	figure/3,figcaption/3,
	canvas/3,
	area/2,
	map/3,
	img/2
]).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <figure>
-spec figure(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

figure(string,Attributes,Value) -> aw_html:tag(string,"figure",Attributes,Value);
figure(binary,Attributes,Value) -> aw_html:tag(binary,<<("figure")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <figcaption>
-spec figcaption(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

figcaption(string,Attributes,Value) -> aw_html:tag(string,"figcaption",Attributes,Value);
figcaption(binary,Attributes,Value) -> aw_html:tag(binary,<<("figcaption")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <canvas>
-spec canvas(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

canvas(string,Attributes,Value) -> aw_html:tag(string,"canvas",Attributes,Value);
canvas(binary,Attributes,Value) -> aw_html:tag(binary,<<("canvas")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <area>
-spec area(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

area(string,Attributes) -> aw_html:tag(string,"area",Attributes,"single_tag");
area(binary,Attributes) -> aw_html:tag(binary,<<("area")/utf8>>,Attributes,<<("single_tag")/utf8>>).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <map>
-spec map(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

map(string,Attributes,Value) -> aw_html:tag(string,"map",Attributes,Value);
map(binary,Attributes,Value) -> aw_html:tag(binary,<<("map")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <img>
-spec img(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

img(string,Attributes) -> aw_html:tag(string,"img",Attributes,"single_tag");
img(binary,Attributes) -> aw_html:tag(binary,<<("img")/utf8>>,Attributes,<<("single_tag")/utf8>>).