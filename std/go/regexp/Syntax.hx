package go.regexp;

@:go.Type({ name: "syntax", instanceName: "syntax.syntax", imports: ["regexp/syntax"] })
extern class Syntax {

    @:native("ClassNL") static var ClassNL: go.regexp.syntax.Flags;
    @:native("DotNL") static var DotNL: go.regexp.syntax.Flags;
    @:native("EmptyBeginLine") static var EmptyBeginLine: go.regexp.syntax.EmptyOp;
    @:native("EmptyBeginText") static var EmptyBeginText: go.regexp.syntax.EmptyOp;
    @:native("EmptyEndLine") static var EmptyEndLine: go.regexp.syntax.EmptyOp;
    @:native("EmptyEndText") static var EmptyEndText: go.regexp.syntax.EmptyOp;
    @:native("EmptyNoWordBoundary") static var EmptyNoWordBoundary: go.regexp.syntax.EmptyOp;
    @:native("EmptyWordBoundary") static var EmptyWordBoundary: go.regexp.syntax.EmptyOp;
    @:native("ErrInternalError") static var ErrInternalError: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidCharClass") static var ErrInvalidCharClass: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidCharRange") static var ErrInvalidCharRange: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidEscape") static var ErrInvalidEscape: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidNamedCapture") static var ErrInvalidNamedCapture: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidPerlOp") static var ErrInvalidPerlOp: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidRepeatOp") static var ErrInvalidRepeatOp: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidRepeatSize") static var ErrInvalidRepeatSize: go.regexp.syntax.ErrorCode;
    @:native("ErrInvalidUTF8") static var ErrInvalidUTF8: go.regexp.syntax.ErrorCode;
    @:native("ErrLarge") static var ErrLarge: go.regexp.syntax.ErrorCode;
    @:native("ErrMissingBracket") static var ErrMissingBracket: go.regexp.syntax.ErrorCode;
    @:native("ErrMissingParen") static var ErrMissingParen: go.regexp.syntax.ErrorCode;
    @:native("ErrMissingRepeatArgument") static var ErrMissingRepeatArgument: go.regexp.syntax.ErrorCode;
    @:native("ErrNestingDepth") static var ErrNestingDepth: go.regexp.syntax.ErrorCode;
    @:native("ErrTrailingBackslash") static var ErrTrailingBackslash: go.regexp.syntax.ErrorCode;
    @:native("ErrUnexpectedParen") static var ErrUnexpectedParen: go.regexp.syntax.ErrorCode;
    @:native("FoldCase") static var FoldCase: go.regexp.syntax.Flags;
    @:native("InstAlt") static var InstAlt: go.regexp.syntax.InstOp;
    @:native("InstAltMatch") static var InstAltMatch: go.regexp.syntax.InstOp;
    @:native("InstCapture") static var InstCapture: go.regexp.syntax.InstOp;
    @:native("InstEmptyWidth") static var InstEmptyWidth: go.regexp.syntax.InstOp;
    @:native("InstFail") static var InstFail: go.regexp.syntax.InstOp;
    @:native("InstMatch") static var InstMatch: go.regexp.syntax.InstOp;
    @:native("InstNop") static var InstNop: go.regexp.syntax.InstOp;
    @:native("InstRune") static var InstRune: go.regexp.syntax.InstOp;
    @:native("InstRune1") static var InstRune1: go.regexp.syntax.InstOp;
    @:native("InstRuneAny") static var InstRuneAny: go.regexp.syntax.InstOp;
    @:native("InstRuneAnyNotNL") static var InstRuneAnyNotNL: go.regexp.syntax.InstOp;
    @:native("Literal") static var Literal: go.regexp.syntax.Flags;
    @:native("MatchNL") static var MatchNL: go.regexp.syntax.Flags;
    @:native("NonGreedy") static var NonGreedy: go.regexp.syntax.Flags;
    @:native("OneLine") static var OneLine: go.regexp.syntax.Flags;
    @:native("OpAlternate") static var OpAlternate: go.regexp.syntax.Op;
    @:native("OpAnyChar") static var OpAnyChar: go.regexp.syntax.Op;
    @:native("OpAnyCharNotNL") static var OpAnyCharNotNL: go.regexp.syntax.Op;
    @:native("OpBeginLine") static var OpBeginLine: go.regexp.syntax.Op;
    @:native("OpBeginText") static var OpBeginText: go.regexp.syntax.Op;
    @:native("OpCapture") static var OpCapture: go.regexp.syntax.Op;
    @:native("OpCharClass") static var OpCharClass: go.regexp.syntax.Op;
    @:native("OpConcat") static var OpConcat: go.regexp.syntax.Op;
    @:native("OpEmptyMatch") static var OpEmptyMatch: go.regexp.syntax.Op;
    @:native("OpEndLine") static var OpEndLine: go.regexp.syntax.Op;
    @:native("OpEndText") static var OpEndText: go.regexp.syntax.Op;
    @:native("OpLiteral") static var OpLiteral: go.regexp.syntax.Op;
    @:native("OpNoMatch") static var OpNoMatch: go.regexp.syntax.Op;
    @:native("OpNoWordBoundary") static var OpNoWordBoundary: go.regexp.syntax.Op;
    @:native("OpPlus") static var OpPlus: go.regexp.syntax.Op;
    @:native("OpQuest") static var OpQuest: go.regexp.syntax.Op;
    @:native("OpRepeat") static var OpRepeat: go.regexp.syntax.Op;
    @:native("OpStar") static var OpStar: go.regexp.syntax.Op;
    @:native("OpWordBoundary") static var OpWordBoundary: go.regexp.syntax.Op;
    @:native("POSIX") static var POSIX: go.regexp.syntax.Flags;
    @:native("Perl") static var Perl: go.regexp.syntax.Flags;
    @:native("PerlX") static var PerlX: go.regexp.syntax.Flags;
    @:native("Simple") static var Simple: go.regexp.syntax.Flags;
    @:native("UnicodeGroups") static var UnicodeGroups: go.regexp.syntax.Flags;
    @:native("WasDollar") static var WasDollar: go.regexp.syntax.Flags;

    @:native("Compile") static function compile(re: go.Pointer<go.regexp.syntax.Regexp>): (go.Result<go.Pointer<go.regexp.syntax.Prog>>);
    @:native("EmptyOpContext") static function emptyOpContext(r1: go.Rune, r2: go.Rune): (go.regexp.syntax.EmptyOp);
    @:native("IsWordChar") static function isWordChar(r: go.Rune): (Bool);
    @:native("Parse") static function parse(s: String, flags: go.regexp.syntax.Flags): (go.Result<go.Pointer<go.regexp.syntax.Regexp>>);

}