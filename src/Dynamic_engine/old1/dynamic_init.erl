%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV (http://alexandr.kirilov.me)
%%% @copyright (C) 2015, Arboreus, (http://arboreus.systems)
%%% @doc Initial module for Arboreus WWW.
%%% @end
%%%-------------------------------------------------------------------
-module(dynamic_init).
-author("Alexandr KIRILOV (http://alexandr.kirilov.me)").
-vsn("0.0.0.0").

%% API
-export([setup/0]).

%% System include

%% Module Include Start
-include("dynamic.hrl").
%% Module Include End 

%% Engine Storage Tables
-define(TABLES,[
	{?STORAGE_REQUESTS,[
		set,
		public,
		named_table,
		{keypos,#request.id},
		{read_concurrency,true},
		{write_concurrency,true}
	]},
	{?STORAGE_PAGES,[
		set,
		public,
		named_table,
		{keypos,#page.path},
		{read_concurrency,true},
		{write_concurrency,true}
	]}
]).

%%----------------------------------------
%% Setup Engine
%%----------------------------------------
setup() ->
	storage_set().

%%----------------------------------------
%% Make engine storage
%%----------------------------------------
table_create([],_) ->
	{ok,"ETS Storage Created"};
table_create([Head|Tail],Pid) ->
	{Table_name,Table_properties} = Head,
	Table = ets:new(Table_name,Table_properties),
	ets:give_away(Table,Pid,[]),
	table_create(Tail,Pid).

storage_set() ->
	table_create(?TABLES,whereis(?STORAGE_OWNER)).