%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV (http://alexandr.kirilov.me)
%%% @copyright (C) 2015, Arboreus, (http://arboreus.systems)
%%% @doc
%%%
%%% @end
%%% Created : 21. Aug 2015 12:28
%%%-------------------------------------------------------------------
-author("Alexandr KIRILOV (http://alexandr.kirilov.me)").

-include("pages.hrl").

%% Setttings
-define(DEBUG,true).
-define(REQUEST_STORAGE,request_storage).

%% Predefined functions
-define(FUNCTION_NAME(),process_info(self(),current_function)).
