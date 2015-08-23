%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV (alexandr.kirilov.me)
%%% @copyright (C) 2014, Alexandr KIRILOV
%%% @doc Neuron Site Start Module
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(engine_ssi).
-author("Alexandr KIRILOV (alexandr.kirilov.me)").

%% API
-include("/usr/local/lib/erlang/lib/yaws-1.98/include/yaws_api.hrl").
-import(yaws_api,[f/2]).
-compile(export_all).

out(YAWS_API) ->
	URL_API=yaws_api:request_url(YAWS_API),
	%% Get URL
	URL=URL_API#url.path,
	HOST=URL_API#url.host,
	%% Set Pages params for start rendering based on URL value
	if
		%% Render "Index" page
		URL=="/" ->	nium_headers:set(redirect,lists:concat(["http://",HOST,"/rus:index.html"]));
		%% Render "Thanks for install" page
		URL=="/thanksForInstall.html" ->
			nium_headers:set(redirect,lists:concat(["http://",HOST,"/rus:thanksForInstall.html"]));
		%% Render "robots.txt"
		URL=="/robots.txt" -> [{page,["/robots.txt"]}];
		%% Old links redirect
		URL=="/aboutNeuronBrowser.html" ->
			nium_headers:set(redirect,lists:concat(["http://",HOST,"/rus:aboutNeuronBrowser.html"]));
		URL=="/download.html" ->
			nium_headers:set(redirect,lists:concat(["http://",HOST,"/rus:download.html"]));
		URL=="/faqs.html" ->
			nium_headers:set(redirect,lists:concat(["http://",HOST,"/rus:faqs.html"]));
		URL=="/licenseAgreement.html" ->
			nium_headers:set(redirect,lists:concat(["http://",HOST,"/rus:licenseAgreement.html"]));
		URL=="/vacancies.html" ->
			nium_headers:set(redirect,lists:concat(["http://",HOST,"/rus:vacancies.html"]));
		%% Other pages
		URL/="/" ->
			%% Checking URL
			URL_PATTERN="^\/([a-z]{3}):([a-zA-Z0-9]*).html$",
			URL_CHECK=re:run(URL,URL_PATTERN),
			if
				%% Set pages render params
				URL_CHECK/=nomatch ->
					{_,[{_,URL_LENGHT},_,_]}=URL_CHECK,
					LANGUAGE=string:sub_string(URL,2,4),
					PAGE_ID=string:sub_string(URL,6,URL_LENGHT-5),
					URL_LIST_CHECK=string:str(engine_ssi_render:page_list(),[PAGE_ID]),
					if
						URL_LIST_CHECK/=0 ->
							LANGUAGE_CHECK=string:str(engine_ssi_render:page_language_list(),[LANGUAGE]),
							if
								LANGUAGE_CHECK/=0 ->
									engine_ssi_render:page(PAGE_ID,LANGUAGE);
								LANGUAGE_CHECK==0 ->
									nium_headers:set(redirect,lists:concat(["http://",HOST,"/rus:",PAGE_ID,".html"]))
							end;
						URL_LIST_CHECK==0 ->
							engine_ssi_render:error(404)
					end;
				%% Set "Error 404" render params
				URL_CHECK==nomatch ->
					engine_ssi_render:error(404)
			end
	end
.
