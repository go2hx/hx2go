package go.regexp;

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

    @:native("Compile") static function compile(re: go.Pointer<go.regexp.syntax.Regexp>): (go.Result<go.Pointer<go.regexp.syntax.Prog>>);
    @:native("EmptyOpContext") static function emptyOpContext(r1: go.Rune, r2: go.Rune): (go.regexp.syntax.EmptyOp);
    @:native("IsWordChar") static function isWordChar(r: go.Rune): (Bool);
    @:native("Parse") static function parse(s: String, flags: go.regexp.syntax.Flags): (go.Result<go.Pointer<go.regexp.syntax.Regexp>>);

}