%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV (alexandr.kirilov.me)
%%% @copyright (C) 2014, Alexandr KIRILOV
%%% @doc Neuron Site Modules
%%%
%%% @end
%%%-------------------------------------------------------------------
-module(engine_ssi_modules).
-author("Alexandr KIRILOV (alexandr.kirilov.me)").

%% API
-compile(export_all).

%% Main Menu Generation
menu(MENU_ID,MENU_CLASS_NAME,LANGUAGE) when MENU_ID=="main" ->
	[
		{'ul',[{class,MENU_CLASS_NAME}],[
			lists:map(fun(ITEM) ->
				menu_item(ITEM,LANGUAGE,MENU_CLASS_NAME)
			end, engine_ssi_render:page_list()),
			["\r\n"]
		]}
	]
.
%% Main Menu Items Generation
menu_item(ITEM,_,_) when ITEM=="index" -> [];
menu_item(ITEM,_,_) when ITEM=="thanksForInstall" -> [];
menu_item(ITEM,_,_) when ITEM=="vacanciesSeniorJSDeveloper" -> [];
menu_item(ITEM,_,_) when ITEM=="version32" -> [];
menu_item(ITEM,_,_) when ITEM=="versionPortable" -> [];
menu_item(ITEM,_,_) when ITEM=="versionVK" -> [];
menu_item(ITEM,LANGUAGE,MENU_CLASS_NAME) ->
	{'li',[{'class',lists:concat([MENU_CLASS_NAME,"Items"])}],[
		{'a',[{'href',lists:concat(["/",LANGUAGE,":",ITEM,".html"])}],[
			{ssi,lists:concat(["/ssi/",LANGUAGE,"/menu.item.",ITEM,".html"]),"",""}
		]}
	]}
.
%% Download button
download_button(LANGUAGE) ->
	[
		{'a',
			[
				{'href',"/download/Neuron32.exe"},
				{'id',"downloadButton"},
				{'class',"downloadButton"}
			],
			[
				if
					LANGUAGE=="rus"->
						[
							{'div',[{'class',"downloadButtonText"}],[<<"Скачать"/utf8>>]},
							{'div',[{'class',"downloadButtonNotice"}],
								[[{ssi,"/ssi/default/current.version.html","",""}],<<" версию"/utf8>>]
							}
						];
					LANGUAGE=="eng"->
						[
							{'div',[{'class',"downloadButtonText"}],[<<"Download"/utf8>>]},
							{'div',[{'class',"downloadButtonNotice"}],
								[[{ssi,"/ssi/default/current.version.html","",""}],<<" version"/utf8>>]
							}
						]
				end
			]
		},
		{'div',[{'class',"latestVersionInfo"}],
			[
				{'a',[{'href',[lists:concat(["/",LANGUAGE,":download.html"])]}],
					[
						if
							LANGUAGE=="rus" -> <<"Другие версии браузера"/utf8>>;
							LANGUAGE=="eng" -> <<"Another browser versions"/utf8>>
						end
					]
				}
			]
		}
	]
.