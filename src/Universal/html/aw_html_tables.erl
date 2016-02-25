%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 25. Февр. 2016 12:16
%%%-------------------------------------------------------------------
-module(aw_html_tables).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.274").

%% API
-export([
	caption/3,col/2,colgroup/3,
	table/3,tbody/3,td/3,tfoot/3,th/3,thead/3,tr/3
]).

%%-----------------------------------
%% @doc Return unicode string or unicode binary within <colgroup>
-spec colgroup(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

colgroup(string,Attributes,Value) -> aw_html:tag(string,"colgroup",Attributes,Value);
colgroup(binary,Attributes,Value) -> aw_html:tag(binary,<<("colgroup")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <col>
-spec col(Type,Attributes) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist().

col(string,Attributes) -> aw_html:tag(string,"col",Attributes,"single_tag");
col(binary,Attributes) -> aw_html:tag(binary,<<("col")/utf8>>,Attributes,<<("single_tag")/utf8>>).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <tfoot>
-spec tfoot(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

tfoot(string,Attributes,Value) -> aw_html:tag(string,"tfoot",Attributes,Value);
tfoot(binary,Attributes,Value) -> aw_html:tag(binary,<<("tfoot")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <tbody>
-spec tbody(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

tbody(string,Attributes,Value) -> aw_html:tag(string,"tbody",Attributes,Value);
tbody(binary,Attributes,Value) -> aw_html:tag(binary,<<("tbody")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <thead>
-spec thead(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

thead(string,Attributes,Value) -> aw_html:tag(string,"thead",Attributes,Value);
thead(binary,Attributes,Value) -> aw_html:tag(binary,<<("thead")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <td>
-spec td(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

td(string,Attributes,Value) -> aw_html:tag(string,"td",Attributes,Value);
td(binary,Attributes,Value) -> aw_html:tag(binary,<<("td")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <tr>
-spec tr(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

tr(string,Attributes,Value) -> aw_html:tag(string,"tr",Attributes,Value);
tr(binary,Attributes,Value) -> aw_html:tag(binary,<<("tr")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <th>
-spec th(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

th(string,Attributes,Value) -> aw_html:tag(string,"th",Attributes,Value);
th(binary,Attributes,Value) -> aw_html:tag(binary,<<("th")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <caption>
-spec caption(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

caption(string,Attributes,Value) -> aw_html:tag(string,"caption",Attributes,Value);
caption(binary,Attributes,Value) -> aw_html:tag(binary,<<("caption")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <table>
-spec table(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

table(string,Attributes,Value) -> aw_html:tag(string,"table",Attributes,Value);
table(binary,Attributes,Value) -> aw_html:tag(binary,<<("table")/utf8>>,Attributes,Value).