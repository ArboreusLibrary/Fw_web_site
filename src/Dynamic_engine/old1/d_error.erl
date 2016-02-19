%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV (http://alexandr.kirilov.me)
%%% @copyright (C) 2015, Arboreus, (http://arboreus.systems)
%%% @doc Server error handler
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(d_error).
-author("Alexandr KIRILOV (http://alexandr.kirilov.me)").

-include("dynamic.hrl").
-include("d_error.hrl").

%% API
-export([]).

%% @spec error(Function_name::tuple(),Reason::string()) -> tuple()
%% @doc Return a tuple within function Id and the reason of an error
error({_,{Module,Function,Arity}},Error_code) when is_atom(Error_code) ->
	Reason = proplists:get_value(Error_code,?D_ERROR_CODES),
	case Reason of
		undefined ->
			{error,{a,error,2},proplists:get_value(e001,?D_ERROR_CODES)};
		_ ->
			{error,{Module,Function,Arity,Reason}}
	end;
error(_,_) -> {error,{a,error,2,proplists:get_value(e000,?D_ERROR_CODES)}}.