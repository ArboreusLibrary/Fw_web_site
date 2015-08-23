%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Jun 2015 10:17
%%%-------------------------------------------------------------------
-module(erlang_www).
-author("alexandr").

%% Yaws API
-include_lib("/usr/local/lib/yaws/include/yaws.hrl").
-include_lib("/usr/local/lib/yaws/include/yaws_api.hrl").

%% API
-export([out/1,render_node/1,node_list/0,get_md/2]).

-define(STORE_REQUEST,store_request).
-define(STORE_PAGE,store_page).


out(Yaws_arguments) ->

	%% Request handler
	%% -------------------------------
	Url = yaws_api:request_url(Yaws_arguments),
	Path = Url#url.path,
	Method = (Yaws_arguments#arg.req)#http_request.method,
	{Ip,_} = Yaws_arguments#arg.client_ip_port,

	%% Session_id generating
	%% -------------------------------
	{Mega,Sec,Micro} = os:timestamp(),
	Session_id = get_md(list_to_binary([
		list_to_binary(tuple_to_list(Ip)),
		list_to_binary(Path),
		list_to_binary(get_random_string(12)),
		integer_to_binary(Mega*1000000000000+Sec*1000000+Micro)]),md5),

	%% Parse parameters
	%% -------------------------------
	Parameters = fun() ->
		case Method of
			'GET' -> yaws_api:parse_query(Yaws_arguments);
			'POST' -> yaws_api:parse_post(Yaws_arguments);
			_ -> [{error,"Undefined method"}]
		end
	end,

	%% Write to request store
	%% -------------------------------
	ets:insert(?STORE_REQUEST,{
		Session_id,
		{request,[Path]},
		{parameters,Parameters}
	}),

	Page_properties = proplists:get_value(Path,pages()),

	%% Render page
	%% -------------------------------
	case Page_properties of
		undefined ->
			Output = template:get(error,Path,Yaws_arguments);
		_ ->
			Template = proplists:get_value(template,page:properties(Path)),
			Output = template:get(Template,Path,Yaws_arguments)
	end,

	%% Clear from request store
	%% -------------------------------
	ets:delete(?STORE_REQUEST,Session_id),

	%% Otput result
	%% -------------------------------
	Output
.

pages() ->
	[
		{"/",[
			{template,index}
		]},
		{"/main",[
			{template,main}
		]}
	]
.

render_node(Node_list) ->
	[fun() ->[apply(Module,Function,[Parameters]),"<br>\n"]end||{{Module,Function},Parameters}<- Node_list]
.

session_id(Ip,Url) ->
	[]
.

node_list() ->
	[
		{{erl_module,function_01},[{key1,"value1"},{key2,"value2"}]},
		{{erl_module,function_03},[{key1,"test page"},{key2,8976789689761111},{key3,"876567856785_hjgggh"}]},
		{{erl_module,function_03},[]}
	]
.

get_random_string(Length) ->
	Char_list = list_to_tuple("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"),
	Char_size = size(Char_list),
	Random_list = fun(_,List) -> [element(random:uniform(Char_size),Char_list)|List] end,
	lists:foldl(Random_list,"",lists:seq(1,Length))
.


hex(X) ->
	element(X+1,{$0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$a,$b,$c,$d,$e,$f})
.
get_md(Object,Type) ->
	<<    A1:4, A2:4, A3:4, A4:4, A5:4, A6:4, A7:4, A8:4,
	A9:4, A10:4,A11:4,A12:4,A13:4,A14:4,A15:4,A16:4,
	A17:4,A18:4,A19:4,A20:4,A21:4,A22:4,A23:4,A24:4,
	A25:4,A26:4,A27:4,A28:4,A29:4,A30:4,A31:4,A32:4
	>> = crypto:hash(Type,Object),
	<<    (hex(A1)),  (hex(A2)),  (hex(A3)),  (hex(A4)),
	(hex(A5)),  (hex(A6)),  (hex(A7)),  (hex(A8)),
	(hex(A9)),  (hex(A10)), (hex(A11)), (hex(A12)),
	(hex(A13)), (hex(A14)), (hex(A15)), (hex(A16)),
	(hex(A17)), (hex(A18)), (hex(A19)), (hex(A20)),
	(hex(A21)), (hex(A22)), (hex(A23)), (hex(A24)),
	(hex(A25)), (hex(A26)), (hex(A27)), (hex(A28)),
	(hex(A29)), (hex(A30)), (hex(A31)), (hex(A32)) >>
.