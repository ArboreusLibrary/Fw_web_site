%%%-------------------------------------------------------------------
%%% @author Alexandr KIRILOV
%%% @copyright (C) 2016, http://arboreus.system
%%% @doc
%%%
%%% @end
%%% Created : 22. Февр. 2016 12:31
%%%-------------------------------------------------------------------
-module(aw_xhtml_basic).
-author("Alexandr KIRILOV, http://alexandr.kirilov.me").
-vsn("0.0.1.256").

%% API
-export([
	doctype/2
]).


%%-----------------------------------
%% @doc Return unicode string or unicode binary within XHTML Doctype specification
-spec doctype(Output_type,Type) -> unicode:chardata() | unicode:latin1_binary()
	when
		Output_type :: string | binary,
		Type :: xhtml1_strict | xhtml1_transitional | xhtml1_frameset | xhtml11.

doctype(string,xhtml1_strict) ->
	"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">";
doctype(binary,xhtml1_strict) ->
	<<("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">")/utf8>>;
doctype(string,xhtml1_transitional) ->
	"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">";
doctype(binary,xhtml1_transitional) ->
	<<("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">")/utf8>>;
doctype(string,xhtml1_frameset) ->
	"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Frameset//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\">";
doctype(binary,xhtml1_frameset) ->
	<<("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Frameset//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\">")/utf8>>;
doctype(string,xhtml11) ->
	"<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">";
doctype(binary,xhtml11) ->
	<<("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.1//EN\" \"http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd\">")/utf8>>;
doctype(_,_) -> "<!DOCTYPE error: bad arguments>".