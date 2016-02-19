%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV (http://alexandr.kirilov.me)
%%% @copyright (C) 2015, Arboreus, (http://arboreus.systems)
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(dynamic).
-author("Alexandr KIRILOV (http://alexandr.kirilov.me)").

%% Module API
-export([out/1]).
-export([test/0]).

%% System include
-include_lib("/usr/local/lib/yaws/include/yaws.hrl").
-include_lib("/usr/local/lib/yaws/include/yaws_api.hrl").
-include_lib("stdlib/include/qlc.hrl").

%% Module Include Start
-include("dynamic.hrl").
-include("dynamic_pages.hrl").
%% Module Include End 

out(Yaws_arguments) ->

	%% Generate Request_id
	Request_id = a_sequence:unique(time),

	%% Parse Request
	Uri = yaws_api:request_url(Yaws_arguments),
	Path = Uri#url.path,
	Method = (Yaws_arguments#arg.req)#http_request.method,
	{Ip,_} = Yaws_arguments#arg.client_ip_port,

	%% Parse Parameters
	Parameters = fun() ->
		case Method of
			'GET' -> yaws_api:parse_query(Yaws_arguments);
			'POST' -> yaws_api:parse_post(Yaws_arguments);
			_ -> [{error,"Undefined method"}]
		end
	end,

	%% Insert Request Parameters
	Request = #request{
		id = Request_id,
		path =  Path,
		parameters = Parameters(),
		nodes = [
			{title,Request_id},
			{css,["/css1/index.css","/path/module.css"]},
			{jsc,["/jsc/module.js"]},
			{node1,[
				{example,function,[]},
				{example,function,["Test text from db, example:function/1"]},
				{example,function,[
					"Test text from db, example:function/2, text 1",
					"Test text from db, example:function/2, text 2"
				]}
			]}
		]
	},
	d_storage:add(request,Request),
	%%ets:insert(?STORAGE_REQUESTS,),
	%%ets:match_delete(?STORAGE_REQUESTS,#request{request_id = Request_id,_='_',_='_',_='_',_='_',_='_'}),
	dynamic_templates:get(index,Request_id).

test() ->
	ets:insert(?STORAGE_REQUESTS,#request{
		id = <<"iuytiuyoiyuoiuyoiuy">>,
		path =  "/jkhgkjhg",
		parameters = [
			{key1,"val1"},
			{key2,"val2"},
			{key3,"val3"}
		],
		nodes = [
			{title,"Title from ets table"},
			{css,["/css/index.css","/path/module.css","/test.css"]},
			{js,["/jsc/module.js"]}
		]
	})
	%ets:insert(?STORAGE_REQUESTS,#request{
	%	id = <<"bfb278dd30593a6f44eb100dc556a4e6">>,
	%	path = "/1111"})
	%Query = qlc:q([Row#request.path || Row <- ets:table(?STORAGE_REQUESTS),
	%	Row#request.id == <<"0e08ad6775798136d0f41ea184cb1177">>
	%]),
	%qlc:eval(Query)
	.