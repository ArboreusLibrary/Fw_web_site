%%%-------------------------------------------------------------------
%%% @author alexandr
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 07. Jul 2015 12:43
%%%-------------------------------------------------------------------
-module(template).
-author("alexandr").

-include("/usr/local/lib/yaws/include/yaws_api.hrl").

%% API
-export([get/3]).

get(error,Path,Yaws_arguments) ->
	Url = yaws_api:request_url(Yaws_arguments),
	[
		{'ehtml',[
			["<!DOCTYPE html> "],
			{'head',[],[
				{'title',[],"404"},
				["\n"]
			]},
			{'body',[],[
				{'h1',[],"404"},
				{'div',[],"Requested URL isn't found"},
				{'div',[],"Host: "++Url#url.host},
				{'div',[],"Path: "++Path}
			]}
		]}
	]
;
get(index,Path,Yaws_arguments) ->
	[
		{'ehtml',[
			["<!DOCTYPE html> "],
			{'head',[],[
				{'title',[],"Template 1: Index"},
				["\n"]
			]},
			{'body',[],[
				{'h1',[],"Template 1: Index"},
				{'div',[],"Test page"}
			]}
		]}
	]
;
get(main,Path,Yaws_arguments) ->
	[
		{'ehtml',[
			["<!DOCTYPE html> "],
			{'head',[],[
				{'title',[],"Template 2: Main"},
				["\n"]
			]},
			{'body',[],[
				{'h1',[],"Template 2: Main"},
				{'div',[],"Test page"}
			]}
		]}
	]
.