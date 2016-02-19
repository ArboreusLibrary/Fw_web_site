%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV (http://alexandr.kirilov.me)
%%% @copyright (C) 2015, Arboreus, (http://arboreus.systems)
%%% @doc
%%%
%%% @end
%%% Created : 23. Aug 2015 0:11
%%%-------------------------------------------------------------------
-module(dynamic_templates).
-author("Alexandr KIRILOV (http://alexandr.kirilov.me)").
-vsn("0.0.0.0").

%% Module API
-export([get/2]).

%% System include
-include_lib("stdlib/include/qlc.hrl").

%% Module Include Start
-include("dynamic.hrl").
%% Module Include End

%% --------------------------------------------------
%% Index Template
%% --------------------------------------------------
get(index,Request_id) when is_binary(Request_id) == true ->
	Page_nodes = dynamic_handler:page_nodes(Request_id),
	[
		?HTML_HEADER_CHARSET,
		{'ehtml',[
			?HTML_DOCTYPE,
			{'html',[],[
				{'head',[],[
					dynamic_handler:node(title,proplists:get_value(title,Page_nodes)),
					dynamic_handler:node(css,proplists:get_value(css,Page_nodes)),
					dynamic_handler:node(jsc,proplists:get_all_values(jsc,Page_nodes))
					%%["<link href=\"css/index.css\" rel=\"stylesheet\" type=\"text/css\">"],["\n"]
				]},
				{'body',[],[
					{'div',[],"Index template"},["\n"],
					example:function(),
					example:function("Test text"),
					example:function("Test text 1","Test text 2"),
					["\n"]
					%%dynamic_handler:node(content,node1)
				]},["\n"]
			]}
		]}
	];

%% --------------------------------------------------
%% Error Template
%% --------------------------------------------------
get(_,_) ->
	[
		?HTML_HEADER_CHARSET,
		{'ehtml',[
			?HTML_DOCTYPE,
			{'html',[],[
				{'head',[],[
					{'title',[],"Something wrong"},["\n"]
				]},
				{'body',[],[
					{'div',[],"Application error"},["\n"],
					{'div',[],"Something goes wrong"},["\n"]
				]}
			]}
		]}
	].