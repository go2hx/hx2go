package go.regexp;

/**
    Package syntax parses regular expressions into parse trees and compiles
    parse trees into programs. Most clients of regular expressions will use the
    facilities of package [regexp] (such as [regexp.Compile] and [regexp.Match]) instead of this package.
    
    # Syntax
    
    The regular expression syntax understood by this package when parsing with the [Perl] flag is as follows.
    Parts of the syntax can be disabled by passing alternate flags to [Parse].
    
    Single characters:
    
    	.              any character, possibly including newline (flag s=true)
    	[xyz]          character class
    	[^xyz]         negated character class
    	\d             Perl character class
    	\D             negated Perl character class
    	[[:alpha:]]    ASCII character class
    	[[:^alpha:]]   negated ASCII character class
    	\pN            Unicode character class (one-letter name)
    	\p{Greek}      Unicode character class
    	\PN            negated Unicode character class (one-letter name)
    	\P{Greek}      negated Unicode character class
    
    Composites:
    
    	xy             x followed by y
    	x|y            x or y (prefer x)
    
    Repetitions:
    
    	x*             zero or more x, prefer more
    	x+             one or more x, prefer more
    	x?             zero or one x, prefer one
    	x{n,m}         n or n+1 or ... or m x, prefer more
    	x{n,}          n or more x, prefer more
    	x{n}           exactly n x
    	x*?            zero or more x, prefer fewer
    	x+?            one or more x, prefer fewer
    	x??            zero or one x, prefer zero
    	x{n,m}?        n or n+1 or ... or m x, prefer fewer
    	x{n,}?         n or more x, prefer fewer
    	x{n}?          exactly n x
    
    Implementation restriction: The counting forms x{n,m}, x{n,}, and x{n}
    reject forms that create a minimum or maximum repetition count above 1000.
    Unlimited repetitions are not subject to this restriction.
    
    Grouping:
    
    	(re)           numbered capturing group (submatch)
    	(?P<name>re)   named & numbered capturing group (submatch)
    	(?<name>re)    named & numbered capturing group (submatch)
    	(?:re)         non-capturing group
    	(?flags)       set flags within current group; non-capturing
    	(?flags:re)    set flags during re; non-capturing
    
    	Flag syntax is xyz (set) or -xyz (clear) or xy-z (set xy, clear z). The flags are:
    
    	i              case-insensitive (default false)
    	m              multi-line mode: ^ and $ match begin/end line in addition to begin/end text (default false)
    	s              let . match \n (default false)
    	U              ungreedy: swap meaning of x* and x*?, x+ and x+?, etc (default false)
    
    Empty strings:
    
    	^              at beginning of text or line (flag m=true)
    	$              at end of text (like \z not \Z) or line (flag m=true)
    	\A             at beginning of text
    	\b             at ASCII word boundary (\w on one side and \W, \A, or \z on the other)
    	\B             not at ASCII word boundary
    	\z             at end of text
    
    Escape sequences:
    
    	\a             bell (== \007)
    	\f             form feed (== \014)
    	\t             horizontal tab (== \011)
    	\n             newline (== \012)
    	\r             carriage return (== \015)
    	\v             vertical tab character (== \013)
    	\*             literal *, for any punctuation character *
    	\123           octal character code (up to three digits)
    	\x7F           hex character code (exactly two digits)
    	\x{10FFFF}     hex character code
    	\Q...\E        literal text ... even if ... has punctuation
    
    Character class elements:
    
    	x              single character
    	A-Z            character range (inclusive)
    	\d             Perl character class
    	[:foo:]        ASCII character class foo
    	\p{Foo}        Unicode character class Foo
    	\pF            Unicode character class F (one-letter name)
    
    Named character classes as character class elements:
    
    	[\d]           digits (== \d)
    	[^\d]          not digits (== \D)
    	[\D]           not digits (== \D)
    	[^\D]          not not digits (== \d)
    	[[:name:]]     named ASCII class inside character class (== [:name:])
    	[^[:name:]]    named ASCII class inside negated character class (== [:^name:])
    	[\p{Name}]     named Unicode property inside character class (== \p{Name})
    	[^\p{Name}]    named Unicode property inside negated character class (== \P{Name})
    
    Perl character classes (all ASCII-only):
    
    	\d             digits (== [0-9])
    	\D             not digits (== [^0-9])
    	\s             whitespace (== [\t\n\f\r ])
    	\S             not whitespace (== [^\t\n\f\r ])
    	\w             word characters (== [0-9A-Za-z_])
    	\W             not word characters (== [^0-9A-Za-z_])
    
    ASCII character classes:
    
    	[[:alnum:]]    alphanumeric (== [0-9A-Za-z])
    	[[:alpha:]]    alphabetic (== [A-Za-z])
    	[[:ascii:]]    ASCII (== [\x00-\x7F])
    	[[:blank:]]    blank (== [\t ])
    	[[:cntrl:]]    control (== [\x00-\x1F\x7F])
    	[[:digit:]]    digits (== [0-9])
    	[[:graph:]]    graphical (== [!-~] == [A-Za-z0-9!"#$%&'()*+,\-./:;<=>?@[\\\]^_`{|}~])
    	[[:lower:]]    lower case (== [a-z])
    	[[:print:]]    printable (== [ -~] == [ [:graph:]])
    	[[:punct:]]    punctuation (== [!-/:-@[-`{-~])
    	[[:space:]]    whitespace (== [\t\n\v\f\r ])
    	[[:upper:]]    upper case (== [A-Z])
    	[[:word:]]     word characters (== [0-9A-Za-z_])
    	[[:xdigit:]]   hex digit (== [0-9A-Fa-f])
    
    Unicode character classes are those in [unicode.Categories],
    [unicode.CategoryAliases], and [unicode.Scripts].
**/
@:go.Type({ name: "syntax", instanceName: "syntax.syntax", imports: ["regexp/syntax"] })
extern class Syntax {

    @:native("ClassNL") static var classNL: go.regexp.syntax.Flags;
    @:native("DotNL") static var dotNL: go.regexp.syntax.Flags;
    @:native("EmptyBeginLine") static var emptyBeginLine: go.regexp.syntax.EmptyOp;
    @:native("EmptyBeginText") static var emptyBeginText: go.regexp.syntax.EmptyOp;
    @:native("EmptyEndLine") static var emptyEndLine: go.regexp.syntax.EmptyOp;
    @:native("EmptyEndText") static var emptyEndText: go.regexp.syntax.EmptyOp;
    @:native("EmptyNoWordBoundary") static var emptyNoWordBoundary: go.regexp.syntax.EmptyOp;
    @:native("EmptyWordBoundary") static var emptyWordBoundary: go.regexp.syntax.EmptyOp;
    @:native("ErrInternalError") static var errInternalError: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidCharClass") static var errInvalidCharClass: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidCharRange") static var errInvalidCharRange: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidEscape") static var errInvalidEscape: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidNamedCapture") static var errInvalidNamedCapture: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidPerlOp") static var errInvalidPerlOp: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidRepeatOp") static var errInvalidRepeatOp: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidRepeatSize") static var errInvalidRepeatSize: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidUTF8") static var errInvalidUTF8: go.regexp.syntax.ErrorCode;
    @:native("ErrLarge") static var errLarge: go.regexp.syntax.ErrorCode;
    @:native("ErrMissingBracket") static var errMissingBracket: go.regexp.syntax.ErrorCode;
    @:native("ErrMissingParen") static var errMissingParen: go.regexp.syntax.ErrorCode;
    @:native("ErrMissingRepeatArgument") static var errMissingRepeatArgument: go.regexp.syntax.ErrorCode;
    @:native("ErrNestingDepth") static var errNestingDepth: go.regexp.syntax.ErrorCode;
    @:native("ErrTrailingBackslash") static var errTrailingBackslash: go.regexp.syntax.ErrorCode;
    @:native("ErrUnexpectedParen") static var errUnexpectedParen: go.regexp.syntax.ErrorCode;
    @:native("FoldCase") static var foldCase: go.regexp.syntax.Flags;
    @:native("InstAlt") static var instAlt: go.regexp.syntax.InstOp;
    @:native("InstAltMatch") static var instAltMatch: go.regexp.syntax.InstOp;
    @:native("InstCapture") static var instCapture: go.regexp.syntax.InstOp;
    @:native("InstEmptyWidth") static var instEmptyWidth: go.regexp.syntax.InstOp;
    @:native("InstFail") static var instFail: go.regexp.syntax.InstOp;
    @:native("InstMatch") static var instMatch: go.regexp.syntax.InstOp;
    @:native("InstNop") static var instNop: go.regexp.syntax.InstOp;
    @:native("InstRune") static var instRune: go.regexp.syntax.InstOp;
    @:native("InstRune1") static var instRune1: go.regexp.syntax.InstOp;
    @:native("InstRuneAny") static var instRuneAny: go.regexp.syntax.InstOp;
    @:native("InstRuneAnyNotNL") static var instRuneAnyNotNL: go.regexp.syntax.InstOp;
    @:native("Literal") static var literal: go.regexp.syntax.Flags;
    @:native("MatchNL") static var matchNL: go.regexp.syntax.Flags;
    @:native("NonGreedy") static var nonGreedy: go.regexp.syntax.Flags;
    @:native("OneLine") static var oneLine: go.regexp.syntax.Flags;
    @:native("OpAlternate") static var opAlternate: go.regexp.syntax.Op;
    @:native("OpAnyChar") static var opAnyChar: go.regexp.syntax.Op;
    @:native("OpAnyCharNotNL") static var opAnyCharNotNL: go.regexp.syntax.Op;
    @:native("OpBeginLine") static var opBeginLine: go.regexp.syntax.Op;
    @:native("OpBeginText") static var opBeginText: go.regexp.syntax.Op;
    @:native("OpCapture") static var opCapture: go.regexp.syntax.Op;
    @:native("OpCharClass") static var opCharClass: go.regexp.syntax.Op;
    @:native("OpConcat") static var opConcat: go.regexp.syntax.Op;
    @:native("OpEmptyMatch") static var opEmptyMatch: go.regexp.syntax.Op;
    @:native("OpEndLine") static var opEndLine: go.regexp.syntax.Op;
    @:native("OpEndText") static var opEndText: go.regexp.syntax.Op;
    @:native("OpLiteral") static var opLiteral: go.regexp.syntax.Op;
    @:native("OpNoMatch") static var opNoMatch: go.regexp.syntax.Op;
    @:native("OpNoWordBoundary") static var opNoWordBoundary: go.regexp.syntax.Op;
    @:native("OpPlus") static var opPlus: go.regexp.syntax.Op;
    @:native("OpQuest") static var opQuest: go.regexp.syntax.Op;
    @:native("OpRepeat") static var opRepeat: go.regexp.syntax.Op;
    @:native("OpStar") static var opStar: go.regexp.syntax.Op;
    @:native("OpWordBoundary") static var opWordBoundary: go.regexp.syntax.Op;
    @:native("POSIX") static var POSIX: go.regexp.syntax.Flags;
    @:native("Perl") static var perl: go.regexp.syntax.Flags;
    @:native("PerlX") static var perlX: go.regexp.syntax.Flags;
    @:native("Simple") static var simple: go.regexp.syntax.Flags;
    @:native("UnicodeGroups") static var unicodeGroups: go.regexp.syntax.Flags;
    @:native("WasDollar") static var wasDollar: go.regexp.syntax.Flags;

    /**
        Compile compiles the regexp into a program to be executed.
        The regexp should have been simplified already (returned from re.Simplify).
    **/
    @:native("Compile") static function compile(re: go.Pointer<go.regexp.syntax.Regexp>): (go.Result<go.Pointer<go.regexp.syntax.Prog>>);
    /**
        EmptyOpContext returns the zero-width assertions
        satisfied at the position between the runes r1 and r2.
        Passing r1 == -1 indicates that the position is
        at the beginning of the text.
        Passing r2 == -1 indicates that the position is
        at the end of the text.
    **/
    @:native("EmptyOpContext") static function emptyOpContext(r1: go.Rune, r2: go.Rune): (go.regexp.syntax.EmptyOp);
    /**
        IsWordChar reports whether r is considered a “word character”
        during the evaluation of the \b and \B zero-width assertions.
        These assertions are ASCII-only: the word characters are [A-Za-z0-9_].
    **/
    @:native("IsWordChar") static function isWordChar(r: go.Rune): (Bool);
    /**
        Parse parses a regular expression string s, controlled by the specified
        Flags, and returns a regular expression parse tree. The syntax is
        described in the top-level comment.
    **/
    @:native("Parse") static function parse(s: String, flags: go.regexp.syntax.Flags): (go.Result<go.Pointer<go.regexp.syntax.Regexp>>);

}