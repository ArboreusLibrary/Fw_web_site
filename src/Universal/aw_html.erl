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
-vsn("0.0.7.248").

%% API
-export([
	tag_string/3,single_tag_string/2,
	a/2,
	li/2,
	link/2,
	script/2,
	style/1,
	title/1
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
		"<",Tag_name," ",
		[lists:concat([Attribute,"=\"",Value,"\" "])||{Attribute,Value} <- Attributes_proplist],">",
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
		"<",Tag_name," ",
		[lists:concat([Attribute,"=\"",Value,"\" "])||{Attribute,Value} <- Attributes_proplist],">"
	]);
single_tag_string(_,_) -> "<make_tag_string>Bag_argument</make_tag_string>".


%%-----------------------------------
%% @doc Return prepared the tag a for Yaws appmode
-spec a(Output_type,{Attributes_proplist,Text}) -> list() | tuple()
	when
		Output_type :: string | tuple,
		Attributes_proplist :: proplists:proplist(),
		Text :: unicode:chardata().

a(string,{Attributes_proplist,Value}) -> tag_string("a",Attributes_proplist,Value);
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

li(string,{Attributes_proplist,Value}) -> tag_string("li",Attributes_proplist,Value);
li(tuple,{Attributes_proplist,Value}) when is_list(Attributes_proplist), is_list(Value) ->
	{'li',Attributes_proplist,Value};
li(_,_) -> "<li>Bag argument</li>".


%%-----------------------------------
%% @doc Return prepared for Yaws Appmod link tag
-spec link(Type,File_path) -> list()
	when
		Type :: atom(),
		File_path :: unicode:chardata().

link(css,File_path) when is_list(File_path) ->
	lists:concat(["<link href=\"",File_path,"\" rel=\"stylesheet\" type=\"text/css\">\n"]);
link(_,_) -> "<link>Bad argument</link>\n".


%%-----------------------------------
%% @doc Return prepared for Yaws Appmod script tag
-spec script(Type,Properties) -> list()
	when
		Type :: atom(),
		Properties :: any().

script(js,{file_link,Url,Charset}) when is_list(Url), is_list(Charset) ->
	lists:concat(["<script type=\"text/javascript\" src=\"",Url,"\" charset=\"",Charset,"\"></script>\n"]);
script(js,{script,Script}) when is_list(Script) ->
	lists:concat(["<script>",Script,"</script>\n"]);
script(_,_) -> "<script>Bad argument</script>".


%%-----------------------------------
%% @doc Return prepared for Yaws Appmod style tag
-spec style(Style::unicode:chardata()) -> list().

style(Style) when is_list(Style) -> lists:concat(["<style>",Style,"</style>\n"]);
style(_) -> "<style>Bad arguments</style>\n".


%%-----------------------------------
%% @doc Return prepared for Yaws Appmod title tag
-spec title(Title::unicode:chardata()) -> unicode:chardata().

title(Title) when is_list(Title) ->
	lists:concat(["<title>",Title,"</title>\n"]);
title(_) -> "<title>Bad argument</title>\n".