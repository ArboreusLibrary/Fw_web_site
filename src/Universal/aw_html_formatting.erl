%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 22. Февр. 2016 18:39
%%%-------------------------------------------------------------------
-module(aw_html_formatting).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.259").

%% API
-export([
	wbr/3,
	var/3,
	u/3,
	tt/3,time/3,
	sup/3,sub/3,strong/3,strike/3,small/3,samp/3,s/3,
	ruby/3,rt/3,rp/3,
	q/3,
	progress/3,pre/3,
	meter/3,mark/3,
	kbd/3,
	i/3,ins/3,
	font/3,
	em/3,
	del/3,dfn/3,
	center/3,cite/3,code/3,
	blockquote/3,big/3,bdo/3,bdi/3,b/3,
	address/3,abbr/3,acronym/3
]).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <wbr>,
-spec wbr(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

wbr(string,Attributes,Value) -> aw_html:tag(string,"wbr",Attributes,Value);
wbr(binary,Attributes,Value) -> aw_html:tag(binary,<<("wbr")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <var>,
-spec var(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

var(string,Attributes,Value) -> aw_html:tag(string,"var",Attributes,Value);
var(binary,Attributes,Value) -> aw_html:tag(binary,<<("var")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <u>,
-spec u(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

u(string,Attributes,Value) -> aw_html:tag(string,"u",Attributes,Value);
u(binary,Attributes,Value) -> aw_html:tag(binary,<<("u")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <tt>,
%% tag is not supported in HTML5. If it was used for marking up keyboard input,
%% consider the <kbd>; for variables, consider the <var>; for computer code,
%% consider the <code>; and for computer output, consider the <samp>, or use CSS instead.
-spec tt(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

tt(string,Attributes,Value) -> aw_html:tag(string,"tt",Attributes,Value);
tt(binary,Attributes,Value) -> aw_html:tag(binary,<<("tt")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <time>.
-spec time(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

time(string,Attributes,Value) -> aw_html:tag(string,"time",Attributes,Value);
time(binary,Attributes,Value) -> aw_html:tag(binary,<<("time")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <sup>.
-spec sup(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

sup(string,Attributes,Value) -> aw_html:tag(string,"sup",Attributes,Value);
sup(binary,Attributes,Value) -> aw_html:tag(binary,<<("sup")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <sub>.
-spec sub(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

sub(string,Attributes,Value) -> aw_html:tag(string,"sub",Attributes,Value);
sub(binary,Attributes,Value) -> aw_html:tag(binary,<<("sub")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <strong>.
-spec strong(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

strong(string,Attributes,Value) -> aw_html:tag(string,"strong",Attributes,Value);
strong(binary,Attributes,Value) -> aw_html:tag(binary,<<("strong")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <strike>,
%% tag is not supported in HTML5. Use <del> or <s> instead.
-spec strike(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

strike(string,Attributes,Value) -> aw_html:tag(string,"strike",Attributes,Value);
strike(binary,Attributes,Value) -> aw_html:tag(binary,<<("strike")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <small>.
-spec small(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

small(string,Attributes,Value) -> aw_html:tag(string,"small",Attributes,Value);
small(binary,Attributes,Value) -> aw_html:tag(binary,<<("small")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <samp>.
-spec samp(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

samp(string,Attributes,Value) -> aw_html:tag(string,"samp",Attributes,Value);
samp(binary,Attributes,Value) -> aw_html:tag(binary,<<("samp")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <s>.
-spec s(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

s(string,Attributes,Value) -> aw_html:tag(string,"s",Attributes,Value);
s(binary,Attributes,Value) -> aw_html:tag(binary,<<("s")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <ruby>.
-spec ruby(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

ruby(string,Attributes,Value) -> aw_html:tag(string,"ruby",Attributes,Value);
ruby(binary,Attributes,Value) -> aw_html:tag(binary,<<("ruby")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <rt>.
-spec rt(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

rt(string,Attributes,Value) -> aw_html:tag(string,"rt",Attributes,Value);
rt(binary,Attributes,Value) -> aw_html:tag(binary,<<("rt")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <rp>.
-spec rp(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

rp(string,Attributes,Value) -> aw_html:tag(string,"rp",Attributes,Value);
rp(binary,Attributes,Value) -> aw_html:tag(binary,<<("rp")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <q>.
-spec q(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

q(string,Attributes,Value) -> aw_html:tag(string,"q",Attributes,Value);
q(binary,Attributes,Value) -> aw_html:tag(binary,<<("q")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <progress>.
-spec progress(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

progress(string,Attributes,Value) -> aw_html:tag(string,"progress",Attributes,Value);
progress(binary,Attributes,Value) -> aw_html:tag(binary,<<("progress")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <pre>.
-spec pre(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

pre(string,Attributes,Value) -> aw_html:tag(string,"pre",Attributes,Value);
pre(binary,Attributes,Value) -> aw_html:tag(binary,<<("pre")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <meter>.
-spec meter(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

meter(string,Attributes,Value) -> aw_html:tag(string,"meter",Attributes,Value);
meter(binary,Attributes,Value) -> aw_html:tag(binary,<<("meter")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <mark>.
-spec mark(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

mark(string,Attributes,Value) -> aw_html:tag(string,"mark",Attributes,Value);
mark(binary,Attributes,Value) -> aw_html:tag(binary,<<("mark")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <kbd>.
-spec kbd(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

kbd(string,Attributes,Value) -> aw_html:tag(string,"kbd",Attributes,Value);
kbd(binary,Attributes,Value) -> aw_html:tag(binary,<<("kbd")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <ins>.
-spec ins(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

ins(string,Attributes,Value) -> aw_html:tag(string,"ins",Attributes,Value);
ins(binary,Attributes,Value) -> aw_html:tag(binary,<<("ins")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <i>.
-spec i(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

i(string,Attributes,Value) -> aw_html:tag(string,"i",Attributes,Value);
i(binary,Attributes,Value) -> aw_html:tag(binary,<<("i")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <font>.
-spec font(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

font(string,Attributes,Value) -> aw_html:tag(string,"font",Attributes,Value);
font(binary,Attributes,Value) -> aw_html:tag(binary,<<("font")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <em>.
-spec em(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

em(string,Attributes,Value) -> aw_html:tag(string,"em",Attributes,Value);
em(binary,Attributes,Value) -> aw_html:tag(binary,<<("em")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <dfn>.
-spec dfn(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

dfn(string,Attributes,Value) -> aw_html:tag(string,"dfn",Attributes,Value);
dfn(binary,Attributes,Value) -> aw_html:tag(binary,<<("dfn")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <del>.
-spec del(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

del(string,Attributes,Value) -> aw_html:tag(string,"del",Attributes,Value);
del(binary,Attributes,Value) -> aw_html:tag(binary,<<("del")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <code>.
-spec code(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

code(string,Attributes,Value) -> aw_html:tag(string,"code",Attributes,Value);
code(binary,Attributes,Value) -> aw_html:tag(binary,<<("code")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <cite>.
-spec cite(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

cite(string,Attributes,Value) -> aw_html:tag(string,"cite",Attributes,Value);
cite(binary,Attributes,Value) -> aw_html:tag(binary,<<("cite")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <center>,
%% tag is not supported in HTML5. Use CSS instead.
-spec center(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

center(string,Attributes,Value) -> aw_html:tag(string,"center",Attributes,Value);
center(binary,Attributes,Value) -> aw_html:tag(binary,<<("center")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <blockquote>
-spec blockquote(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

blockquote(string,Attributes,Value) -> aw_html:tag(string,"blockquote",Attributes,Value);
blockquote(binary,Attributes,Value) -> aw_html:tag(binary,<<("blockquote")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <big>,
%% tag is not supported in HTML5. Use CSS instead.
-spec big(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

big(string,Attributes,Value) -> aw_html:tag(string,"big",Attributes,Value);
big(binary,Attributes,Value) -> aw_html:tag(binary,<<("big")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <bdo>
-spec bdo(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

bdo(string,Attributes,Value) -> aw_html:tag(string,"bdo",Attributes,Value);
bdo(binary,Attributes,Value) -> aw_html:tag(binary,<<("bdo")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <bdi>
-spec bdi(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

bdi(string,Attributes,Value) -> aw_html:tag(string,"bdi",Attributes,Value);
bdi(binary,Attributes,Value) -> aw_html:tag(binary,<<("bdi")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <b>
-spec b(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

b(string,Attributes,Value) -> aw_html:tag(string,"b",Attributes,Value);
b(binary,Attributes,Value) -> aw_html:tag(binary,<<("b")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <address>
-spec address(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

address(string,Attributes,Value) -> aw_html:tag(string,"address",Attributes,Value);
address(binary,Attributes,Value) -> aw_html:tag(binary,<<("address")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <abbr>
-spec abbr(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

abbr(string,Attributes,Value) -> aw_html:tag(string,"abbr",Attributes,Value);
abbr(binary,Attributes,Value) -> aw_html:tag(binary,<<("abbr")/utf8>>,Attributes,Value).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within <acronym>
%% Not supported in HTML5. Use <abbr> instead
-spec acronym(Type,Attributes,Value) -> unicode:chardata() | unicode:latin1_binary()
	when
		Type :: string | binary,
		Attributes :: proplists:proplist(),
		Value :: unicode:chardata() | unicode:unicode_binary().

acronym(string,Attributes,Value) -> aw_html:tag(string,"acronym",Attributes,Value);
acronym(binary,Attributes,Value) -> aw_html:tag(binary,<<("acronym")/utf8>>,Attributes,Value).