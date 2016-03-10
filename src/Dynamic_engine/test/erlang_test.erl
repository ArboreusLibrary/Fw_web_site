%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV (http://alexandr.kirilov.me)
%%% @copyright (C) 2015, Arboreus, (http://arboreus.systems)
%%% @doc
%%%
%%% @end
%%% Created : 15. Aug 2015 21:29
%%%-------------------------------------------------------------------
-module(erlang_test).
-author("Alexandr KIRILOV (http://alexandr.kirilov.me)").
-vsn("0.0.0.0").

%% Module API
-export([out/1]).

%% System include
-include_lib("/usr/local/lib/yaws/include/yaws.hrl").
-include_lib("/usr/local/lib/yaws/include/yaws_api.hrl").

%% Module Include Start
-include("define.hrl").
%% Module Include End

out(Yaws_arguments)->

	%% Parse Request
	Uri = yaws_api:request_url(Yaws_arguments),
	Path = Uri#url.path,
	Request_id = a_sequence:unique(time),
	Method = (Yaws_arguments#arg.req)#http_request.method,
	Parameters = fun() ->
		case Method of
			'GET' -> yaws_api:parse_query(Yaws_arguments);
			'POST' -> yaws_api:parse_post(Yaws_arguments);
			_ -> [{error,"Undefined method"}]
		end
	end,
	[Template_name,Prepared_datum] = prepare_datum(Path,Parameters),
	template:get(Template_name,Prepared_datum).
	%[Template_name,Parameters,Page_schema] = check_path(Path,Parameters()),
	%template:get(Template_name,Parameters).

%   case Path of
%		"/" -> template:get(one,Parameters,page_schema());
%		"/two" -> template:get(two,Parameters,page_schema());
%		_ -> template:get(error,Parameters,page_schema())
%	end.

prepare_datum(Path,Parameters) ->
	Script = "(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
		m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
		})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
		ga('create', 'UA-49059086-1', 'kirilov.me');
		ga('send', 'pageview');",
	Title = aw_html_basic:title(string,[],"WTF!"),
	Css = [
		aw_css:link(binary,"localhost"),
		aw_css:style(binary,from_file,"/Users/alexandr/projects/Arboreus/Arboreus_web_site/pub/css/index.css"),
		aw_css:style(string,from_file,"/Users/alexandr/projects/Arboreus/Arboreus_web_site/pub/css/index.css"),
		aw_css:style(string,from_string,"string_css"),
		aw_css:style(binary,from_binary,<<"binary_string">>)
		%aw_html:link([{href,"intex.css"},{rel,"stylesheet"},{type,"text/css"}]),
		%aw_html:link([{href,"google.css"},{rel,"stylesheet"},{type,"text/css"}])
	],
	%Js = [
	%	aw_js:script(from_link,"http://index.js"),
	%	aw_js:script(from_file,"/Users/alexandr/projects/Arboreus/Arboreus_fw_web_site/pub/test.js"),
	%	aw_js:script(from_string,"string javascipt"),
	%	aw_js:script(from_binary,<<"binary javascipt">>),
	%	aw_html:script(string,{[{type,"javascript"},{src,"index.html"},{charset,"utf-8"}],""}),
	%	aw_html:script(tuple,{[],Script})
	%],
	Prepared_datum = [
		{title,Title},
		{css,Css},
		%{js,Js},
		{1,[
			aw_xhtml_basic:br(string,[]),
			aw_xhtml_basic:br(binary,[]),
			aw_xhtml_basic:hr(string,[]),
			aw_xhtml_basic:hr(binary,[]),
			aw_xhtml:tag(binary,<<("div1111")/utf8>>,[{<<"id1">>,<<"test">>}]),
			aw_html:tag(string,"div",[{id,"tag_string"}],"Tag_string"),
			aw_html:tag(binary,<<"div">>,[{<<"id">>,<<"tag_binary">>}],<<("Привет!!!")/utf8>>)
		]},
		{2,[
			%aw_html:a(tuple,{[{href,"tuple.html"}],"tuple"})
		]},
		{3,[
			%aw_html:list(string,{"ol",[{"id","menu_ul"}],[
			%	{[{"class","test"}],"Value1"},
			%	{[{"class","test"}],"Value2"},
			%	{[{"class","test"}],"Value3"}]}),
			%aw_html:list(tuple,{'ul',[{id,"test2"}],
			%	[
			%		{[{'class',"test"}],"Value12222"},
			%		{[{'class',"test"}],"Value2"},
			%		{[{'class',"test"}],"Value3"}
			%	]}),
			aw_menu:do(string,a,"div",{[{"id","menu_ul_string"}],[
				{[{"href","http://yandex.ru"},{"target","_blank"}],"Value1"},
				{[{"href","http://yandex.ru"},{"class","test"}],"Value2"},
				{[{"href","http://yandex.ru"}],"Value3"},
				{[{"href","http://yandex.ru"},{"target","_blank"}],"Value4"}
			]}),
			aw_menu:menu(string,li_a,{[{'id',"menu_ul_tuple"}],[
				{[{href,"http://yandex.ru"},{target,"_blank"}],"Value1"},
				{[{href,"http://yandex.ru"},{class,"test"}],"Value2"},
				{[{href,"http://yandex.ru"}],"Value3"},
				{[{href,"http://yandex.ru"},{target,"_blank"}],"Value4"}
			]}),
			aw_menu:menu(
				binary,a,{
				[{<<("id")/utf8>>,<<("menu_binary")/utf8>>}],
				[
					{[{<<("href")/utf8>>,<<("http://yandex.ru")/utf8>>},{<<("target")/utf8>>,<<("_blank")/utf8>>}],<<("Value1")/utf8>>},
					{[{<<("href")/utf8>>,<<("http://yandex.ru")/utf8>>},{<<("class")/utf8>>,<<("test")/utf8>>}],<<("Value2")/utf8>>},
					{[{<<("href")/utf8>>,<<("http://yandex.ru")/utf8>>}],<<("Value3")/utf8>>},
					{[{<<("href")/utf8>>,<<("http://yandex.ru")/utf8>>},{<<("target")/utf8>>,<<("_blank")/utf8>>}],<<("Value4")/utf8>>}
				]}
			),
			aw_menu:menu(
				binary,menuitem,
				{[{<<("type")/utf8>>,<<("context")/utf8>>},{<<("id")/utf8>>,<<("menu_item_binary")/utf8>>}],
				[
					{[{<<("label")/utf8>>,<<("Button1")/utf8>>},{<<("onclick")/utf8>>,<<("window.location.reload();")/utf8>>}],<<"">>},
					{[{<<("label")/utf8>>,<<("Button1")/utf8>>},{<<("onclick")/utf8>>,<<("window.location.reload();")/utf8>>}],<<"">>},
					{[{<<("label")/utf8>>,<<("Button1")/utf8>>},{<<("onclick")/utf8>>,<<("window.location.reload();")/utf8>>}],<<"">>},
					{[{<<("label")/utf8>>,<<("Button1")/utf8>>},{<<("onclick")/utf8>>,<<("window.location.reload();")/utf8>>}],<<"">>},
					{[{<<("label")/utf8>>,<<("Button1")/utf8>>},{<<("onclick")/utf8>>,<<("window.location.reload();")/utf8>>}],<<"">>}
				]}
			),
			aw_html_basic:p(binary,[{<<"id">>,<<"test">>}],<<("Привет")/utf8>>)
		]}
	],
	[one,Prepared_datum].

page_schema("/") ->
	[
		{node_name,[{module,function,parameters}]},
		{1,[
			{test1,go,[]},
			{test2,go,[]}
		]},
		{2,[
			{test1,go,[]},
			{test1,go,[]},
			{test1,go,[]}
		]},
		{3,[
			{test2,go,[]},
			{test2,go,[]},
			{test2,go,[]},
			{test2,go,[]}
		]}
	].

%% @TODO Make parameters income to prepared parameters transformation

check_path(Path,Parameters_income) ->
	case proplists:get_value(Path,pathes()) of
		[Template_name,Page_schema] ->
			Parameters = Parameters_income,
			[Template_name,Parameters,Page_schema];
		_ ->
			[error,[],[]]
	end.

pathes() ->
	[
		{"/",[
			one,[
				{1,[{test1,go,[]}]},
				{2,[{test1,go,[]},{test1,go,[]},{test1,go,[]}]},
				{3,[{test2,go,[]},{test2,go,[]},{test2,go,[]},{test2,go,[]}]}
			]

		]}
	].