%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 19. Февр. 2016 19:28
%%%-------------------------------------------------------------------
-module(aw_html).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.11.258").

%% API
-export([
	tag/4
]).


%%-----------------------------------
%% @doc Wraper function for makin tag, return unicode binary or unicode string
-spec tag(Type,Name,Attributes,Value) -> unicode:chardata() | unicode:unicode_binary()
	when
		Type :: string | binary,
		Name :: unicode:latin1_chardata() | unicode:unicode_binary(),
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

tag(string,Name,Attributes,Value) when	is_list(Name), is_list(Attributes), is_list(Value) ->
	make_tag_string(Name,Attributes,Value);
tag(binary,Name,Attributes,Value) when	is_binary(Name), is_list(Attributes), is_binary(Value) ->
	make_tag_binary(Name,Attributes,Value);
tag(Type,Name,_,_) ->
	lists:concat([
		"<",a:to_string(Name)," class=",a:to_string(Type),
		"\">Bag_argument</",a:to_string(Name),">"
	]).


%%-----------------------------------
%% @doc Return uncode string within prepared tag for Yaws appmod
-spec make_tag_string(Name,Attributes,Value) -> unicode:chardata()
	when
		Name :: unicode:latin1_chardata(),
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata().

make_tag_string(Name,[],"single_tag") -> lists:concat(["<",Name,">"]);
make_tag_string(Name,Attributes,"single_tag") ->
	lists:concat([
		"<",Name,[lists:concat([" ",Attribute,"=\"",Attribute_value,"\""])||
			{Attribute,Attribute_value} <- Attributes],">"
	]);
make_tag_string(Name,[],Value) -> lists:concat(["<",Name,">",Value,"</",Name,">"]);
make_tag_string(Name,Attributes,Value) ->
	lists:concat([
		"<",Name,[lists:concat([" ",Attribute,"=\"",Attribute_value,"\""])||
			{Attribute,Attribute_value} <- Attributes],">",Value,"</",Name,">"
	]).


%%-----------------------------------
%% @doc Return binary within prepared tag for Yaws appmod
-spec make_tag_binary(Name,Attributes,Value) -> unicode:unicode_binary()
	when
		Name :: unicode:unicode_binary(),
		Attributes :: proplists:proplist(),
		Value :: unicode:unicode_binary().

make_tag_binary(Name,[],<<("single_tag")/utf8>>) -> <<("<")/utf8,(Name)/binary,(">")/utf8>>;
make_tag_binary(Name,Attributes,<<("single_tag")/utf8>>) ->
	<<("<")/utf8,(Name)/binary,
		(list_to_binary([
			<<(" ")/utf8,(Attribute_name)/binary,
				("=\"")/utf8,(Attribute_value)/binary,("\"")/utf8>>||
			{Attribute_name,Attribute_value} <- Attributes
		]))/binary,
		(">")/utf8>>;
make_tag_binary(Name,[],Value) ->
	<<("<")/utf8,(Name)/binary,(">")/utf8,
		(Value)/binary,("</")/utf8,(Name)/binary,(">")/utf8>>;
make_tag_binary(Name,Attributes,Value) ->
	<<("<")/utf8,(Name)/binary,
		(list_to_binary([
			<<(" ")/utf8,(Attribute_name)/binary,
				("=\"")/utf8,(Attribute_value)/binary,("\"")/utf8>>||
			{Attribute_name,Attribute_value} <- Attributes
		]))/binary,
		(">")/utf8,(Value)/binary,("</")/utf8,(Name)/binary,(">")/utf8>>.