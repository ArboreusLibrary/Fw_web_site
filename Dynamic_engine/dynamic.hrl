%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV (http://alexandr.kirilov.me)
%%% @copyright (C) 2015, Arboreus, (http://arboreus.systems)
%%% @doc
%%%
%%% @end
%%%-------------------------------------------------------------------
-author("Alexandr KIRILOV (http://alexandr.kirilov.me)").

%% Application
-define(DEBUG,false).
-define(FUNCTION_NAME(),process_info(self(),current_function)).

%% Default HTML Settings
-define(HTML_HEADER_CHARSET,[{'header', {'content_type', "text/html; charset=utf-8"}}]).
-define(HTML_DOCTYPE,["<!DOCTYPE html>"]).

%% Storage
-define(STORAGE_OWNER,yaws_server).
-define(STORAGE_REQUESTS,storage_requests).
-define(STORAGE_PAGES,storage_pages).

%% Records
-record(request,{
	id,
	path = [],
	parameters = [],
	nodes = []
}).
-record(page,{
	path,
	type = page,
	parent,
	description,
	template = index,
	title,
	default = []
}).