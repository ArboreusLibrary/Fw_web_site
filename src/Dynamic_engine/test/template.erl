%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 18. Февр. 2016 17:33
%%%-------------------------------------------------------------------
-module(template).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").

%% API
-export([
	get/2
]).

node(Node_name,Parameters,Page_schema) ->
	Node_schema = proplists:get_value(Node_name,Page_schema),
	make_node(Node_schema,Parameters,[]).

make_node([],_,Output) -> Output;
make_node([{Module,Function,Function_params}|Node_schema],Parameters,Output) ->
	Node_element = apply(Module,Function,Function_params),
	Output_out = lists:append(Output,Node_element),
	make_node(Node_schema,Parameters,Output_out).

get_node(Name,Result_datum) ->
	case proplists:get_value(Name,Result_datum) of
		undefined -> "";
		Node -> Node
	end.


get(one,Result_datum) ->
	[
		a_http_headers:cache(no),
		{'ehtml',[
			["<!DOCTYPE html> "],
			{'html',[],[
				{'head',[],[
					awd_render:node(title,Result_datum),
					awd_render:node(css,Result_datum),
					awd_render:node(js,Result_datum)
				]},
				{'h1',[],"Node 1"},
				awd_render:node(1,Result_datum),
				{'h1',[],"Node 2"},
				awd_render:node(2,Result_datum),
				{'h1',[],"Node 3"},
				awd_render:node(3,Result_datum),
				"\n"
			]}
		]}
	];
get(two,Result_datum) ->
	[
		a_http_headers:cache(no),
		{'ehtml',[
			["<!DOCTYPE html> "],
			{'html',[],[
				{'head',[],[
					{'title',[],"Two"},
					["\n"]
				]},
				{'h1',[],"Two"},
				{'div',[],"Page number two"}
			]}
		]}
	];
get(error,Result_datum) ->
	[
		a_http_headers:cache(no),
		{'ehtml',[
			["<!DOCTYPE html> "],
			{'html',[],[
				{'head',[],[
					{'title',[],"Error"},
					{'link',[{href,"css/index.css"},{rel,"stylesheet"},{type,"text/css"}]},
					["\n"]
				]},
				{'h1',[],"Error"},
				{'div',[],"Page error"}
			]}
		]}
	].