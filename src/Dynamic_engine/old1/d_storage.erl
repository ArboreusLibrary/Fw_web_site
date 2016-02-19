%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV (http://alexandr.kirilov.me)
%%% @copyright (C) 2015, Arboreus, (http://arboreus.systems)
%%% @doc Server storage handler
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(d_storage).
-author("Alexandr KIRILOV (http://alexandr.kirilov.me)").

%% API
-export([request/2]).
-export([page/2]).
-export([add/2]).
-export([delete/2]).

%% System include
-include_lib("stdlib/include/qlc.hrl").

%% Module Include Start
-include("dynamic.hrl").
%% Module Include End

%% @spec delete(Record_name,Record_unique_id) -> true
%% where
%%      Record_name() = request | page
%% @doc Dlete from storage requested row
delete(request,Request_id) when is_binary(Request_id) -> ets:delete(?STORAGE_REQUESTS,Request_id);
delete(page,Path) when is_list(Path) -> ets:delete(?STORAGE_PAGES,Path);
delete(_,_) -> {error,?FUNCTION_NAME(),"Bad Arguments"}.

%% @spec add(Record_name,Record) -> true | {error,Reason}
%% where
%%      Record_name() = request | page
%%      Record() = record()
%% @doc Write to storage specified information
add(request,Request) when is_record(Request,request) -> ets:insert(?STORAGE_REQUESTS,Request);
add(page,Page) when is_record(Page,page) -> ets:insert(?STORAGE_PAGES,Page);
add(_,_) -> {error,?FUNCTION_NAME(),"Bad Arguments"}.

%% @spec request(Request_id,Field_name) -> Field_value() | {error,Reason()}
%% where
%%      Request_id = binary()
%%      Field_name = atom()
%% @doc Return from STORAGE_REQUESTS table the property of the request by ID
request(Request_id,Field_name) when is_binary(Request_id), is_atom(Field_name) ->
	Query = qlc:q([Row || Row <- ets:table(?STORAGE_REQUESTS), Row#request.id == Request_id]),
	Query_call = qlc:eval(Query),
	case Query_call of
		[] ->
			{error,?FUNCTION_NAME(),"Wrong request id"};
		_ ->
			[Request] = Query_call,
			case Field_name of
				path -> {_,_,Output,_,_} = Request,Output;
				parameters -> {_,_,_,Output,_} = Request,Output;
				nodes -> {_,_,_,_,Output} = Request,Output;
				_ -> {error,?FUNCTION_NAME(),"Wrong field name"}



			end
	end;
request(_,_) -> {error,?FUNCTION_NAME(),"Bad Arguments"}.

node(add,Request_id,Node) ->
	Nodes_source = request(Request_id,nodes).


%% @spec request(Path,Field_name) -> Field_value() | {error,Reason()}
%% where
%%      Path = string()
%%      Field_name = atom()
%% @doc Return from STORAGE_PAGES table the property of the page by Path
page(Path,Field_name) when is_list(Path), is_atom(Field_name) ->
	Query = qlc:q([Row || Row <- ets:table(?STORAGE_PAGES), Row#page.path == Path]),
	Query_call = qlc:eval(Query),
	case Query_call of
		[] ->
			{error,?FUNCTION_NAME(),"Wrong path"};
		_ ->
			[Request] = Query_call,
			case Field_name of
				type -> {_,_,Output,_,_,_,_,_} = Request,Output;
				parent -> {_,_,_,Output,_,_,_,_} = Request,Output;
				description -> {_,_,_,_,Output,_,_,_} = Request,Output;
				template -> {_,_,_,_,_,Output,_,_} = Request,Output;
				title -> {_,_,_,_,_,_,Output,_} = Request,Output;
				default -> {_,_,_,_,_,_,_,Output} = Request,Output;
				_ -> {error,?FUNCTION_NAME(),"Wrong field name"}
			end
	end;
page(_,_) -> {error,?FUNCTION_NAME(),"Bad Arguments"}.