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
-vsn("0.0.4.264").

%% API
-export([
	do/4,
	menu/3,
	ul/3,
	ol/3
]).


%%-----------------------------------
%% @doc Return composed menu inside ol tag
-spec ol(Type,Menu_attributes,Menu_schema) -> list()
	when
		Type :: binary | string | tuple,
		Menu_attributes :: proplists:proplist(),
		Menu_schema :: proplists:proplist().

ol(binary,Menu_attributes,Menu_schema) ->
	do(binary,a,<<("ol")/utf8>>,{Menu_attributes,Menu_schema});
ol(string,Menu_attributes,Menu_schema) ->
	do(string,li_a,"ol",{Menu_attributes,Menu_schema});
ol(tuple,Menu_attributes,Menu_schema) ->
	do(tuple,li_a,'ol',{Menu_attributes,Menu_schema}).

%%-----------------------------------
%% @doc Return composed menu inside ul tag
-spec ul(Type,Menu_attributes,Menu_schema) -> list()
	when
		Type :: binary | string | tuple,
		Menu_attributes :: proplists:proplist(),
		Menu_schema :: proplists:proplist().

ul(binary,Menu_attributes,Menu_schema) ->
	do(binary,li_a,<<("ul")/utf8>>,{Menu_attributes,Menu_schema});
ul(string,Menu_attributes,Menu_schema) ->
	do(string,li_a,"ul",{Menu_attributes,Menu_schema});
ul(tuple,Menu_attributes,Menu_schema) ->
	do(tuple,li_a,'ul',{Menu_attributes,Menu_schema}).


%%-----------------------------------
%% @doc Return composed menu inside menu tag
-spec menu(Type,Tag,{Menu_attributes,Menu_schema}) -> list()
	when
		Type :: binary | string | tuple,
		Tag :: atom(),
		Menu_attributes :: proplists:proplist(),
		Menu_schema :: proplists:proplist().

menu(binary,Anchor_type,{Menu_attributes,Menu_schema}) ->
	do(binary,Anchor_type,<<("menu")/utf8>>,{Menu_attributes,Menu_schema});
menu(string,Anchor_type,{Menu_attributes,Menu_schema}) ->
	do(string,Anchor_type,"menu",{Menu_attributes,Menu_schema});
menu(tuple,Anchor_type,{Menu_attributes,Menu_schema}) ->
	do(tuple,Anchor_type,'menu',{Menu_attributes,Menu_schema}).


%%-----------------------------------
%% @doc Return composed menu inside wrap tag
-spec do(Type,Anchor_type,Wrap_tag,{Menu_attributes,Menu_schema}) -> list()
	when
		Type :: binary | string | tuple,
		Anchor_type :: a | li_a | button,
		Wrap_tag :: unicode:unicode_binary() | unicode:latin1_chardata() | atom(),
		Menu_attributes :: proplists:proplist(),
		Menu_schema :: proplists:proplist().

do(binary,a,Wrap_tag,{Menu_attributes,Menu_schema})
	when
		is_binary(Wrap_tag),is_list(Menu_attributes),
		is_list(Menu_schema) ->
	<<("<")/utf8,(Wrap_tag)/binary,
		(list_to_binary([
			<<(" ")/utf8,(Attribute_name)/binary,("=\"")/utf8,
			(Attribute_value)/binary,("\"")/utf8>>||
			{Attribute_name,Attribute_value} <- Menu_attributes
		]))/binary,(">\n")/utf8,
		(list_to_binary([
			<<("<a")/utf8,
				(list_to_binary([
					<<(" ")/utf8,(Attrib_name)/binary,("=\"")/utf8,(Attrib_value)/binary,("\"")/utf8>> ||
					{Attrib_name,Attrib_value} <- A_attributes
				]))/binary,(">"),(A_value)/binary,("</a>\n")/utf8>>||
			{A_attributes,A_value} <- Menu_schema
		]))/binary,("</")/utf8,(Wrap_tag)/binary,(">")/utf8>>;
do(binary,li_a,Wrap_tag,{Menu_attributes,Menu_schema})
	when
		is_binary(Wrap_tag),is_list(Menu_attributes),
		is_list(Menu_schema) ->
	<<("<")/utf8,(Wrap_tag)/binary,
		(list_to_binary([
			<<(" ")/utf8,(Attribute_name)/binary,("=\"")/utf8,
				(Attribute_value)/binary,("\"")/utf8>>||
			{Attribute_name,Attribute_value} <- Menu_attributes
		]))/binary,(">\n")/utf8,
		(list_to_binary([
			<<("<li><a")/utf8,
				(list_to_binary([
					<<(" ")/utf8,(Attrib_name)/binary,("=\"")/utf8,(Attrib_value)/binary,("\"")/utf8>> ||
					{Attrib_name,Attrib_value} <- A_attributes
				]))/binary,(">"),(A_value)/binary,("</a></li>\n")/utf8>>||
			{A_attributes,A_value} <- Menu_schema
		]))/binary,("</")/utf8,(Wrap_tag)/binary,(">")/utf8>>;
do(binary,button,Wrap_tag,{Menu_attributes,Menu_schema})
	when
		is_binary(Wrap_tag),is_list(Menu_attributes),
		is_list(Menu_schema) ->
	<<("<")/utf8,(Wrap_tag)/binary,
		(list_to_binary([
			<<(" ")/utf8,(Attribute_name)/binary,("=\"")/utf8,
				(Attribute_value)/binary,("\"")/utf8>>||
			{Attribute_name,Attribute_value} <- Menu_attributes
		]))/binary,(">\n")/utf8,
		(list_to_binary([
			<<("<button")/utf8,
				(list_to_binary([
					<<(" ")/utf8,(Attrib_name)/binary,("=\"")/utf8,(Attrib_value)/binary,("\"")/utf8>> ||
					{Attrib_name,Attrib_value} <- A_attributes
				]))/binary,(">"),(A_value)/binary,("</button>\n")/utf8>>||
			{A_attributes,A_value} <- Menu_schema
		]))/binary,("</")/utf8,(Wrap_tag)/binary,(">")/utf8>>;
do(string,a,Wrap_tag,{Menu_attributes,Menu_schema})
	when
		is_list(Wrap_tag),is_list(Menu_attributes),
		is_list(Menu_schema) ->
	lists:concat([
		"<",Wrap_tag,[lists:concat([" ",Attribute_name,"=\"",Attribute_value,"\""])||
			{Attribute_name,Attribute_value} <- Menu_attributes],">\n",
		[lists:concat([
			"<a",[lists:concat([" ",Atrib_name,"=\"",Attrib_value,"\""])||
				{Atrib_name,Attrib_value} <- A_attributes],">",
			A_value,"</a>\n"
		])||{A_attributes,A_value} <- Menu_schema],
		"</",Wrap_tag,">\n"
	]);
do(string,li_a,Wrap_tag,{Menu_attributes,Menu_schema})
	when
		is_list(Wrap_tag),is_list(Menu_attributes),
		is_list(Menu_schema) ->
	lists:concat([
		"<",Wrap_tag,[lists:concat([" ",Attribute_name,"=\"",Attribute_value,"\""])||
			{Attribute_name,Attribute_value} <- Menu_attributes],">\n",
		[lists:concat([
			"<li><a",[lists:concat([" ",Atrib_name,"=\"",Attrib_value,"\""])||
				{Atrib_name,Attrib_value} <- A_attributes],">",
			A_value,"</a></li>\n"
		])||{A_attributes,A_value} <- Menu_schema],
		"</",Wrap_tag,">\n"
	]);
do(string,button,Wrap_tag,{Menu_attributes,Menu_schema})
	when
		is_list(Wrap_tag),is_list(Menu_attributes),
		is_list(Menu_schema) ->
	lists:concat([
		"<",Wrap_tag,[lists:concat([" ",Attribute_name,"=\"",Attribute_value,"\""])||
			{Attribute_name,Attribute_value} <- Menu_attributes],">\n",
		[lists:concat([
			"<button",[lists:concat([" ",Atrib_name,"=\"",Attrib_value,"\""])||
				{Atrib_name,Attrib_value} <- A_attributes],">",
			A_value,"</button>\n"
		])||{A_attributes,A_value} <- Menu_schema],
		"</",Wrap_tag,">\n"
	]);
do(tuple,a,Wrap_tag,{Menu_attributes,Menu_schema})
	when
		is_atom(Wrap_tag),is_list(Menu_attributes),
		is_list(Menu_schema) ->
	[{Wrap_tag,Menu_attributes,[{'a',Item_attributes,Item_content}||
		{Item_attributes,Item_content} <- Menu_schema]},"\n"];
do(tuple,li_a,Wrap_tag,{Menu_attributes,Menu_schema})
	when
		is_atom(Wrap_tag),is_list(Menu_attributes),
		is_list(Menu_schema) ->
	[{Wrap_tag,Menu_attributes,[{'li',[],[{'a',Item_attributes,Item_content}]}||
		{Item_attributes,Item_content} <- Menu_schema]},"\n"];
do(tuple,button,Wrap_tag,{Menu_attributes,Menu_schema})
	when
		is_atom(Wrap_tag),is_list(Menu_attributes),
		is_list(Menu_schema) ->
	[{Wrap_tag,Menu_attributes,[{'button',Item_attributes,Item_content}||
		{Item_attributes,Item_content} <- Menu_schema]},"\n"];
do(_,_,_,_) -> "<menu>Bad argument</menu>\n".