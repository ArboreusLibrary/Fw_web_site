%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 16. Jun 2015 15:27
%%%-------------------------------------------------------------------
-module(erl_template).
-author("alexandr").

%% API
-export([get/2]).

get(main,Params)->
	[
		{'allheaders',[
			{'header', {'content_type', "text/html; charset=utf-8"}}
		]},
		{'ehtml',[
			["<!DOCTYPE html> "],
			{'html',[],[
				{'head',[],[
					{'title',[],"Test page"},
					["\n"]
				]},
				{'body',[],[
					{'div',[{id,"node_1"}],"Node_1"},
					{'div',[{id,"node_2"}],"Node_2"},
					{'div',[{id,"node_3"}],"Node_3"},
					["\n"]
				]}
			]}
		]}
	]
;

get(inner,Params)->
	[
		{'allheaders',[
			{'header', {'content_type', "text/html; charset=utf-8"}}
		]},
		{'ehtml',[
			["<!DOCTYPE html> "],
			{'html',[],[
				{'head',[],[
					{'title',[],"Test page"},
					["\n"]
				]},
				{'body',[],[
					{'div',[{id,"node_1"}],"Node_1"},
					["\n"]
				]}
			]}
		]}
	]
.