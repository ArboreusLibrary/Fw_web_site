%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Jul 2015 12:58
%%%-------------------------------------------------------------------
-module(page).
-author("alexandr").

%% API
-export([properties/0]).

properties() ->
	[
		{"/",[
			{template,index},
			{parent,0}
		]
		},
		{"/main",[
			{template,main},
			{parent,0}
		]}
	]
.