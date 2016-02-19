%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 11. Sep 2015 17:46
%%%-------------------------------------------------------------------
-module(example).
-author("alexandr").

%% API
-export([function/0]).
-export([function/1]).
-export([function/2]).

function() -> {'div',[{id,"example_function_0"}],"example:function/0"}.
function(Text) -> {'div',[{id,"example_function_1"}],"example:function/1: "++Text}.
function(Text1,Text2) ->
	[
		{'div',[{id,"example_function_2"}],"example:function/2: "},
		{'div',[{id,"text1"}],"Text1: "++Text1},
		{'div',[{id,"text2"}],"Text2: "++Text2}
	].

