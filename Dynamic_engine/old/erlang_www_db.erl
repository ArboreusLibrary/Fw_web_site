%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 20. Jul 2015 11:53
%%%-------------------------------------------------------------------
-module(erlang_www_db).
-author("alexandr").

%% Fill data files
-define(DATUM_PAGES,"/projects/erlang/www/src/erlang/setup/pages.txt").
%% Engine Storage
-define(STORAGE_OWNER,yaws_server).
-define(TABLE_PAGES,pages).
-define(TABLE_STORE_PAGE,store_page).
-define(TABLE_STORE_REQUEST,store_request).

%% API
-export([make/0,fill_datum/0]).

%%----------------------------------------
%% Engine Storage setup datum
%%----------------------------------------
tables() ->
	[
		{?TABLE_STORE_REQUEST,[set,public,named_table,{read_concurrency,true},{write_concurrency,true}]},
		{?TABLE_STORE_PAGE,[set,public,named_table,{read_concurrency,true},{write_concurrency,true}]},
		{?TABLE_PAGES,[set,public,named_table,{read_concurrency,true},{write_concurrency,true}]}
	].

datum() ->
	[
		{?TABLE_PAGES,?DATUM_PAGES}
	].

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

make() ->
	table_create(tables(),whereis(?STORAGE_OWNER)).

%%----------------------------------------
%% Fill the tables
%%----------------------------------------
fill_datum() ->
	lists:map(fun({Table_name,File}) ->
		case file:read_file(File) of
			{ok,Binary_Source} ->
				Pages = binary:split(Binary_Source,<<"\n">>,[global]),
				lists:map(fun(Page) ->
					[Url,Parent,Properties] = binary:split(Page,<<"\t">>,[global]),
					case ets:info(Table_name) of
						undefined ->
							{error, "fill_datum/0: requested ets table isn't availible"};
						_ ->
							case ets:insert(Table_name,{Url,Parent,Properties}) of
								true ->
									{ok,Table_name,Url};
								_ ->
									{error,Table_name,Url}
							end
					end
				end,Pages);
			{error,enoent} ->
				{error,enoent}
		end
	end, datum()).
