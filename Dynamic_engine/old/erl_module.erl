%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 06. Jul 2015 9:03
%%%-------------------------------------------------------------------
-module(erl_module).
-author("alexandr").

%% API
-export([function_01/1,function_02/1,function_03/1]).

function_01(mask) ->
	[
		{'master',{atom}},
		{'id',{string,[32]}},
		{}
	]
;
function_01(Params) ->
	{current_function,{Module,Function,Arity}} = process_info(self(),current_function),
	[
		[lists:concat([
			"Module: ",atom_to_list(Module),
			" Function: ",atom_to_list(Function),
			" Arity: ",Arity,
			"\n"
		])],
		[[lists:concat([
			"Key: ",Key," "
			"Value: ",Value,"\n"
		])]||{Key,Value} <- Params]
	]
.
function_02(Params) ->
	{current_function,{Module,Function,Arity}} = process_info(self(),current_function),
	[
		[lists:concat([
			"Module: ",atom_to_list(Module),
			" Function: ",atom_to_list(Function),
			" Arity: ",Arity,
			"\n"
		])],
		[[lists:concat([
			"Key: ",Key," "
			"Value: ",Value,"\n"
		])]||{Key,Value} <- Params]
	]
.
function_03(Params) ->
	{current_function,{Module,Function,Arity}} = process_info(self(),current_function),
	[
		[lists:concat([
			"Module: ",atom_to_list(Module),
			" Function: ",atom_to_list(Function),
			" Arity: ",Arity,
			"\n"
		])],
		[[lists:concat([
			"Key: ",Key," "
			"Value: ",Value,"\n"
		])]||{Key,Value} <- Params]
	]
.