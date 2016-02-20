%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 20. Февр. 2016 2:36
%%%-------------------------------------------------------------------
-module(awd_render).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.246").

%% API
-export([
	node/2
]).


%%-----------------------------------
%% @doc Return node datum from proplist within rendered nodes
-spec node(Name,Rendered_nodes) -> any()
	when
		Name :: any(),
		Rendered_nodes :: proplists:proplist().

node(Name,Result_datum) ->
	case proplists:get_value(Name,Result_datum) of
		undefined -> "";
		Node -> Node
	end.