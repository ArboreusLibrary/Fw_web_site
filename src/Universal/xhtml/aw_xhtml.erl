%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 28. Февр. 2016 22:03
%%%-------------------------------------------------------------------
-module(aw_xhtml).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").

%% API
-export([
	tag/3
]).


%%-----------------------------------
%% @doc Wraper function for makin tag, return unicode binary or unicode string
-spec tag(Type,Name,Attributes) -> unicode:chardata() | unicode:unicode_binary()
	when
		Type :: string | binary,
		Name :: unicode:latin1_chardata() | unicode:unicode_binary(),
		Attributes :: proplists:proplist().

tag(string,Name,Attributes) when is_list(Name), is_list(Attributes) ->
	make_tag_string(Name,Attributes);
tag(binary,Name,Attributes ) when is_binary(Name), is_list(Attributes) ->
	make_tag_binary(Name,Attributes);
tag(Type,Name,_) ->
	lists:concat([
		"<",a:to_string(Name)," class=",a:to_string(Type),
		"\">Bag_argument</",a:to_string(Name),">"
	]).

%%-----------------------------------
%% @doc Return uncode string within prepared tag for Yaws appmod
-spec make_tag_string(Name,Attributes) -> unicode:chardata()
	when
		Name :: unicode:latin1_chardata(),
		Attributes :: proplists:proplist().

make_tag_string(Name,[]) -> lists:concat(["<",Name," />"]);
make_tag_string(Name,Attributes) ->
	lists:concat([
		"<",Name,[lists:concat([" ",Attribute,"=\"",Attribute_value,"\""])||
			{Attribute,Attribute_value} <- Attributes]," />"
	]).


%%-----------------------------------
%% @doc Return binary within prepared tag for Yaws appmod
-spec make_tag_binary(Name,Attributes) -> unicode:unicode_binary()
	when
		Name :: unicode:unicode_binary(),
		Attributes :: proplists:proplist().

make_tag_binary(Name,[]) -> <<("<")/utf8,(Name)/binary,(" />")/utf8>>;
make_tag_binary(Name,Attributes) ->
	<<("<")/utf8,(Name)/binary,
		(list_to_binary([
			<<(" ")/utf8,(Attribute_name)/binary,
				("=\"")/utf8,(Attribute_value)/binary,("\"")/utf8>>||
			{Attribute_name,Attribute_value} <- Attributes
		]))/binary,
		(" />")/utf8>>.