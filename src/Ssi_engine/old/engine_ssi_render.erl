%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV (alexandr.kirilov.me)
%%% @copyright (C) 2014, Alexandr KIRILOV
%%% @doc Neuron Site Start Module
%%%
%%% @end
%%% Created : 23. May 2014 15:01
%%%-------------------------------------------------------------------
-module(engine_ssi_render).
-author("Alexandr KIRILOV (alexandr.kirilov.me)").

%% API
-compile(export_all).


%% Language list
page_language_list() ->
	[
		"rus","eng"
	]
.

%% Page list
page_list() ->
	[
		"index","aboutNeuronBrowser","download","faqs","licenseAgreement","vacancies",
		"thanksForInstall","vacanciesSeniorJSDeveloper","version32","versionPortable","versionVK"
	]
.
%% Pages
%% Index page
page(PAGE_ID,LANGUAGE) when PAGE_ID=="index" ->
	[
		{allheaders,[
			{header,["Content-Type:","text/html; charset=utf-8"]}
		]},
		{ehtml,[
			["<!DOCTYPE html>"],
			{'html',[],[
				{'head',[],[
					{'title',[],{ssi,lists:concat(["/ssi/",LANGUAGE,"/title.",PAGE_ID,".html"]),"",""}},
					[{ssi,lists:concat(["/ssi/",LANGUAGE,"/meta.description.",PAGE_ID,".html"]),"",""}],
					["\r\n"],
					[{ssi,"/ssi/default/socialPageMeta.html","",""}],
					{'link',[{'rel',"shortcut icon"},{'type',"image/x-icon"},{'href',"img/favicon.ico"}]},
					{'link',[{'rel',"stylesheet"},{'type',"text/css"},{'href',"css/index.css"}]},
					{'link',[{'rel',"stylesheet"},{'type',"text/css"},{'href',"css/text.css"}]},
					{'link',[{'rel',"stylesheet"},{'type',"text/css"},{'href',"css/billboard.css"}]},
					{'link',[{'rel',"stylesheet"},{'type',"text/css"},{'href',"css/googleFonts.css"}]},
					{'script',[{'src',"jsc/index.js"},{'type',"text/javascript"}]},
					[{ssi,"/ssi/default/like.vkHead.html","",""}],
					[{ssi,"/ssi/default/google.analytics.html","",""}],
					["\r\n"]
				]},
				{'body',[],[
					[{ssi,"/ssi/default/like.fbHead.html","",""}],
					{'div',[{'class',"wrapperMain"}],[
						{'div',[{'id',"mainContent"},{'class',"mainContent"}],[
							{'div',[{'class',"browserType"}],"Chromium Based Web Browser"},
							{'div',[{'class',"slogan"}],{ssi,lists:concat(["/ssi/",LANGUAGE,"/slogan.html"]),"",""}},
							{'div',[{'id',"langMenu"}],[]},
							["\r\n"],
							[engine_ssi_modules:download_button(LANGUAGE)],
							[engine_ssi_modules:menu("main","headerMenu",LANGUAGE)],
							{'div',[{'id',"billboardSlider"}]},
							["\r\n"],
							[{ssi,"/ssi/default/socialShare.html","",""}],
							["<br>"],
							{'div',[{'class',"pageContent"}],[
								{ssi,lists:concat(["/ssi/",LANGUAGE,"/content.index.html"]),"",""}
							]},["\r\n"]
						]},["\r\n"]
					]},
					{'div',[{'class',"wrapperFooter"}],[
						{'div',[{'class',"footerContent"}],[
							{'div',[{'class',"footerSitePageIndex"}],[
								{'a',[{'href',lists:concat(["/",LANGUAGE,":index.html"])}],["www.neuronbrowser.net"]}
							]},
							[engine_ssi_modules:menu("main","footerMenu",LANGUAGE)],
							["\r\n"]
						]},["\r\n"]
					]},["\r\n"]
				]},["\r\n"]
			]},["\r\n"]
		]}
	]
;
%% Inner Pages
page(PAGE_ID,LANGUAGE) ->
	[
		{allheaders,[
			{header,["Content-Type:","text/html; charset=utf-8"]}
		]},
		{ehtml,[
			["<!DOCTYPE html>"],
			{'head',[],[
				{'title',[],{ssi,lists:concat(["/ssi/",LANGUAGE,"/title.",PAGE_ID,".html"]),"",""}},
				[{ssi,lists:concat(["/ssi/",LANGUAGE,"/meta.description.index.html"]),"",""}],
				["\r\n"],
				[{ssi,"/ssi/default/socialPageMeta.html","",""}],
				{'link',[{'rel',"shortcut icon"},{'type',"image/x-icon"},{'href',"img/favicon.ico"}]},
				{'link',[{'rel',"stylesheet"},{'type',"text/css"},{'href',"css/inner.css"}]},
				{'link',[{'rel',"stylesheet"},{'type',"text/css"},{'href',"css/text.css"}]},
				{'link',[{'rel',"stylesheet"},{'type',"text/css"},{'href',"css/googleFonts.css"}]},
				{'script',[{'src',"jsc/inner.js"},{'type',"text/javascript"}]},
				[{ssi,"/ssi/default/like.vkHead.html","",""}],
				["\r\n"],
				[{ssi,"/ssi/default/google.analytics.html","",""}],
				["\r\n"]
			]},
			{'body',[],[
				[{ssi,"/ssi/default/like.fbHead.html","",""}],
				{'div',[{'class',"wrapperMain"}],[
					{'div',[{'class',"mainContent"}],[
						["\r\n"],
						[{ssi,lists:concat(["/ssi/",LANGUAGE,"/content.",PAGE_ID,".html"]),"",""}],
						["<br>"],
						[{ssi,"/ssi/default/socialShare.html","",""}],
						{'div',[{'class',"browserType"}],["Chromium Based Web Browser"]},
						{'div',[{'class',"slogan"}],[{ssi,lists:concat(["/ssi/",LANGUAGE,"/slogan.html"]),"",""}]},
						[engine_ssi_modules:menu("main","headerMenu",LANGUAGE)],
						{'div',[{'id',"langMenu"}],[]},
						{'div',[{'class',"headerSitePageIndex"}],[
							{'a',[{'href',lists:concat(["/",LANGUAGE,":index.html"])}],["www.neuronbrowser.net"]}
						]},
						["\r\n"]
					]},["\r\n"]
				]},
				{'div',[{'class',"wrapperFooter"}],[
					{'div',[{'class',"footerContent"}],[
						{'div',[{'class',"neuronNature"}],[]},
						{'div',[{'class',"footerSitePageIndex"}],[
							{'a',[{'href',lists:concat(["/",LANGUAGE,":index.html"])}],["www.neuronbrowser.net"]}
						]},
						[engine_ssi_modules:menu("main","footerMenu",LANGUAGE)],
						["\r\n"]
					]},["\r\n"]
				]},["\r\n"]
			]}
		]}
	]
.

%% Error Pages
error(ERROR_CODE) ->
	[
		{status,ERROR_CODE},
		{allheaders,[
			{header,["Content-Type:","text/html; charset=utf-8"]},
			{header,["Expires:","Mon, 26 Jul 1997 05:00:00 GMT"]},
			{header,["Cache-Control:","no-store, no-cache, must-revalidate"]},
			{header,["Last-Modified:",nium_time:currentTimeHTTP(rfc822)]},
			{header,["Pragma:","no-cache"]}
		]},
		{ehtml,[
			["<!DOCTYPE html>"],
			{'head',[],[
				{'title',[],[lists:concat([ERROR_CODE,""])]},
				{'link',[{'rel',"shortcut icon"},{'type',"image/x-icon"},{'href',"img/favicon.ico"}]},
				{'link',[{'rel',"stylesheet"},{'type',"text/css"},{'href',"css/inner.css"}]},
				{'link',[{'rel',"stylesheet"},{'type',"text/css"},{'href',"css/text.css"}]},
				{'link',[{'rel',"stylesheet"},{'type',"text/css"},{'href',"css/googleFonts.css"}]},
				%{'script',[{'src',"jsc/error.js"},{'type',"text/javascript"}]},
				["\r\n"]
			]},
			{'body',[],[
				{'div',[{'class',"wrapperMain"}],[
					{'div',[{'class',"mainContent"}],[
						["\r\n"],
						[{ssi,lists:concat(["/ssi/default/error.",lists:concat([ERROR_CODE,""]),".html"]),"",""}],
						["<br>"],
						[{ssi,"/ssi/default/socialLikes.html","",""}],
						{'div',[{'class',"browserType"}],["Chromium Based Web Browser"]},
						{'div',[{'class',"headerSitePageIndex"}],[
							{'a',[{'href',lists:concat(["/rus:index.html"])}],["www.neuronbrowser.net"]}
						]},
						["\r\n"]
					]},["\r\n"]
				]},
				{'div',[{'class',"wrapperFooter"}],[
					{'div',[{'class',"footerContent"}],[
						{'div',[{'class',"neuronNature"}],[]},
						{'div',[{'class',"footerSitePageIndex"}],[
							{'a',[{'href',lists:concat(["/rus:index.html"])}],["www.neuronbrowser.net"]}
						]},["\r\n"]
					]},["\r\n"]
				]},["\r\n"]
			]}
		]}
	]
.