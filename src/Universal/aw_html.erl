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
-vsn("0.0.9.250").

%% API
-export([
	tag_string/3,single_tag_string/2,
	a/2,
	li/2,
	link/1,
	script/2,
	style/2,
	title/2
]).


%%-----------------------------------
%% @doc Return a tag string. In case of usage string mode proplist
%% should be {"String_attribute","String_value"}, in case of usage tuple mode
%% proplist should be {atom_attribute,"String_value"}
-spec tag_string(Tag_name,Attributes_proplist,Value) -> list()
	when
		Tag_name :: unicode:latin1_chardata(),
		Attributes_proplist :: proplists:proplist(),
		Value :: unicode:chardata().

tag_string(Tag_name,[],Value) when is_list(Tag_name), is_list(Value) ->
	lists:concat(["<",Tag_name,">",Value,"</",Tag_name,">"]);
tag_string(Tag_name,Attributes_proplist,Value) when is_list(Tag_name), is_list(Value) ->
	lists:concat([
		"<",Tag_name,
		[lists:concat([" ",Attribute,"=\"",Attr_value,"\""])||{Attribute,Attr_value} <- Attributes_proplist],">",
		Value,"</",Tag_name,">"
	]);
tag_string(_,_,_) -> "<make_tag_string>Bag_argument</make_tag_string>".


%%-----------------------------------
%% @doc Return a tag string. In case of usage string mode proplist
%% should be {"String_attribute","String_value"}, in case of usage tuple mode
%% proplist should be {atom_attribute,"String_value"}
-spec single_tag_string(Tag_name,Attributes_proplist) -> list()
	when
		Tag_name :: unicode:latin1_chardata(),
		Attributes_proplist :: proplists:proplist().

single_tag_string(Tag_name,[]) when is_list(Tag_name) ->
	lists:concat(["<",Tag_name,">"]);
single_tag_string(Tag_name,Attributes_proplist) when is_list(Tag_name) ->
	lists:concat([
		"<",Tag_name,
		[lists:concat([" ",Attribute,"=\"",Value,"\""])||{Attribute,Value} <- Attributes_proplist],">"
	]);
single_tag_string(_,_) -> "<make_tag_string>Bag_argument</make_tag_string>".


%%-----------------------------------
%% @doc Return prepared the tag a for Yaws appmode
-spec a(Output_type,{Attributes_proplist,Text}) -> list() | tuple()
	when
		Output_type :: string | tuple,
		Attributes_proplist :: proplists:proplist(),
		Text :: unicode:chardata().

a(string,{Attributes_proplist,Value}) ->
	tag_string("a",Attributes_proplist,Value);
a(tuple,{Attributes_proplist,Value}) when is_list(Attributes_proplist), is_list(Value) ->
	{'a',Attributes_proplist,Value};
a(_,_) -> "<a>Bad argument</a>".


%%-----------------------------------
%% @doc Return prepared the tag li for Yaws appmode
-spec li(Output_type,{Attributes_proplist,Text}) -> list() | tuple()
	when
		Output_type :: string | tuple,
		Attributes_proplist :: proplists:proplist(),
		Text :: unicode:chardata().

li(string,{Attributes_proplist,Value}) ->
	tag_string("li",Attributes_proplist,Value);
li(tuple,{Attributes_proplist,Value}) when is_list(Attributes_proplist), is_list(Value) ->
	{'li',Attributes_proplist,Value};
li(_,_) -> "<li>Bag argument</li>".


%%-----------------------------------
%% @doc Return prepared for Yaws Appmod link tag
-spec link(Attributes_proplist::proplists:proplist()) -> list().

link(Attributes_proplist) when is_list(Attributes_proplist) ->
	[single_tag_string("link",Attributes_proplist),"\n"];
link(_) -> "<link>Bad argument</link>\n".


%%-----------------------------------
%% @doc Return prepared the tag scipt for Yaws appmode
-spec script(Output_type,{Attributes_proplist,Text}) -> list() | tuple()
	when
		Output_type :: string | tuple,
		Attributes_proplist :: proplists:proplist(),
		Text :: unicode:chardata().

script(string,{Attributes_proplist,Value}) ->
	tag_string("script",Attributes_proplist,Value);
script(tuple,{Attributes_proplist,Value}) when is_list(Attributes_proplist), is_list(Value) ->
	[{'script',Attributes_proplist,Value},"\n"];
script(_,_) -> "<script>Bad argument</script>\n".


%%-----------------------------------
%% @doc Return prepared the tag scipt for Yaws appmode
-spec style(Output_type,{Attributes_proplist,Text}) -> list() | tuple()
	when
		Output_type :: string | tuple,
		Attributes_proplist :: proplists:proplist(),
		Text :: unicode:chardata().

style(string,{Attributes_proplist,Value}) ->
	[tag_string("style",Attributes_proplist,Value),"\n"];
style(tuple,{Attributes_proplist,Value}) when is_list(Attributes_proplist), is_list(Value) ->
	[{'style',Attributes_proplist,Value},"\n"];
style(_,_) -> "<style>Bad argument</style>\n".


%%-----------------------------------
%% @doc Return prepared the tag scipt for Yaws appmode
-spec title(Output_type,{Attributes_proplist,Text}) -> list() | tuple()
	when
		Output_type :: string | tuple,
		Attributes_proplist :: proplists:proplist(),
		Text :: unicode:chardata().

title(string,{Attributes_proplist,Value}) ->
	[tag_string("title",Attributes_proplist,Value),"\n"];
title(tuple,{Attributes_proplist,Value}) when is_list(Attributes_proplist), is_list(Value) ->
	[{'style',Attributes_proplist,Value},"\n"];
title(_,_) -> "<title>Bad argument</title>\n".