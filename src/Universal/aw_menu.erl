%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 21. Февр. 2016 13:50
%%%-------------------------------------------------------------------
-module(aw_menu).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.2.253").

%% API
-export([
	menu/3,
	ul/3,
	ol/3
]).


%%-----------------------------------
%% @doc Return composed menu inside ol tag

menu(string,a,{Menu_attributes,Menu_schema}) when is_list(Menu_attributes), is_list(Menu_schema) ->
	lists:concat([
		"<menu",[lists:concat([" ",Attribute_name,"=\"",Attribute_value,"\""])||
			{Attribute_name,Attribute_value} <- Menu_attributes],">\n",
		[lists:concat([
			"<a",[lists:concat([" ",Atrib_name,"=\"",Attrib_value,"\""])||
				{Atrib_name,Attrib_value} <- A_attributes],">",
			A_value,"</a>\n"
		])||{A_attributes,A_value} <- Menu_schema],
		"</menu>\n"
	]);
menu(string,li_a,{Menu_attributes,Menu_schema}) when is_list(Menu_attributes), is_list(Menu_schema) ->
	lists:concat([
		"<menu",[lists:concat([" ",Attribute_name,"=\"",Attribute_value,"\""])||
			{Attribute_name,Attribute_value} <- Menu_attributes],">\n",
		[lists:concat([
			"<li><a",[lists:concat([" ",Atrib_name,"=\"",Attrib_value,"\""])||
				{Atrib_name,Attrib_value} <- A_attributes],">",
			A_value,"</a></li>\n"
		])||{A_attributes,A_value} <- Menu_schema],
		"</menu>\n"
	]);
menu(string,button,{Menu_attributes,Menu_schema}) when is_list(Menu_attributes), is_list(Menu_schema) ->
	lists:concat([
		"<menu",[lists:concat([" ",Attribute_name,"=\"",Attribute_value,"\""])||
			{Attribute_name,Attribute_value} <- Menu_attributes],">\n",
		[lists:concat([
			"<button",[lists:concat([" ",Atrib_name,"=\"",Attrib_value,"\""])||
				{Atrib_name,Attrib_value} <- A_attributes],">",
			A_value,"</button>\n"
		])||{A_attributes,A_value} <- Menu_schema],
		"</menu>\n"
	]);
menu(tuple,a,{Menu_attributes,Menu_schema}) when is_list(Menu_attributes), is_list(Menu_schema) ->
	[{'menu',Menu_attributes,[{'a',Item_attributes,Item_content}||
			{Item_attributes,Item_content} <- Menu_schema]},"\n"];
menu(tuple,li_a,{Menu_attributes,Menu_schema}) when is_list(Menu_attributes), is_list(Menu_schema) ->
	[{'menu',Menu_attributes,[{'li',[],[{'a',Item_attributes,Item_content}]}||
			{Item_attributes,Item_content} <- Menu_schema]},"\n"];
menu(tuple,button,{Menu_attributes,Menu_schema}) when is_list(Menu_attributes), is_list(Menu_schema) ->
	[{'menu',Menu_attributes,[{'button',Item_attributes,Item_content}||
			{Item_attributes,Item_content} <- Menu_schema]},"\n"];
menu(_,_,_) -> "<menu class=\"a\">Bad argument</menu>\n".


%%-----------------------------------
%% @doc Return composed menu inside ul tag
-spec ul(Type,Menu_attributes,Menu_schema) -> list()
	when
		Type :: string | tuple,
		Menu_attributes :: proplists:proplist(),
		Menu_schema :: proplists:proplist().

ul(string,Menu_attributes,Menu_schema) when is_list(Menu_attributes), is_list(Menu_schema) ->
	lists:concat([
		"<ul",[lists:concat([" ",Attribute_name,"=\"",Attribute_value,"\""])||
			{Attribute_name,Attribute_value} <- Menu_attributes],">\n",
		[lists:concat([
			"<li><a",[lists:concat([" ",Name,"=\"",Value,"\""])|| {Name,Value} <- Attributes_anchor],">",
			Item_content,"</a></li>\n"])||{Attributes_anchor,Item_content} <- Menu_schema],
		"</ul>\n"
	]);
ul(tuple,Menu_attributes,Menu_schema) when is_list(Menu_attributes), is_list(Menu_schema) ->
	[{'ul',Menu_attributes,
		[{'li',[],{'a',Attributes_anchor,Item_content}}||
			{Attributes_anchor,Item_content} <- Menu_schema]},"\n"];
ul(_,_,_) -> "<ul class=\"menu\">Bad argument</ul>\n".


%%-----------------------------------
%% @doc Return composed menu inside ol tag
-spec ol(Type,Menu_attributes,Menu_schema) -> list()
	when
		Type :: string | tuple,
		Menu_attributes :: proplists:proplist(),
		Menu_schema :: proplists:proplist().

ol(string,Menu_attributes,Menu_schema) when is_list(Menu_attributes), is_list(Menu_schema) ->
	lists:concat([
		"<ol",[lists:concat([" ",Attribute_name,"=\"",Attribute_value,"\""])||
			{Attribute_name,Attribute_value} <- Menu_attributes],">\n",
		[lists:concat([
			"<li><a",[lists:concat([" ",Name,"=\"",Value,"\""])|| {Name,Value} <- Attributes_anchor],">",
			Item_content,"</a></li>\n"])||{Attributes_anchor,Item_content} <- Menu_schema],
		"</ol>\n"
	]);
ol(tuple,Menu_attributes,Menu_schema) when is_list(Menu_attributes), is_list(Menu_schema) ->
	[{'ol',Menu_attributes,
		[{'li',[],{'a',Attributes_anchor,Item_content}}||
			{Attributes_anchor,Item_content} <- Menu_schema]},"\n"];
ol(_,_,_) -> "<ol class=\"menu\">Bad argument</ul>\n".