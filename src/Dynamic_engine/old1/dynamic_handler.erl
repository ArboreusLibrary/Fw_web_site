%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV (http://alexandr.kirilov.me)
%%% @copyright (C) 2015, Arboreus, (http://arboreus.systems)
%%% @doc
%%%
%%% @end
%%% Created : 23. Aug 2015 1:20
%%%-------------------------------------------------------------------
-module(dynamic_handler).
-author("Alexandr KIRILOV (http://alexandr.kirilov.me)").

%% Module API
-export([page_nodes/1,render_node/2]).
-export([node/2]).

%% System include
-include_lib("stdlib/include/qlc.hrl").

%% Module Include Start
-include("dynamic.hrl").
%% Module Include End

page_nodes(Request_id) ->
	Query = qlc:q([Row#request.nodes || Row <- ets:table(?STORAGE_REQUESTS), Row#request.id == Request_id]),
	[Qlc_result] = qlc:eval(Query),
	Qlc_result.

render_node(Node_name,Node_source_list) when is_atom(Node_name), is_list(Node_source_list) ->
	Result = node(Node_name,Node_source_list),
	case Result of
		{error,Node} -> lists:concat(["Render node error: ", Node]);
		_ -> Result
	end.

node(title,Title) ->
	[{'title',[],Title},["\n"]];
node(jsc,Jsc_list) ->
	[[lists:concat(["<script src=\"",File,"\" type=\"text/javascript\"></script>\n"])] || File <- Jsc_list];
node(css,Css_list) ->
	[[lists:concat(["<link href=\"",File,"\" rel=\"stylesheet\" type=\"text/css\">\n"])] || File <- Css_list];
node(content,Node_list) ->
	[[apply(Module,Function,Arguments)] || {Module,Function,Arguments} <- Node_list];
node(Node_name,_) ->
	{error,atom_to_list(Node_name)}.

22,927525
