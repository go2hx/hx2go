package parser.dump;

import HaxeExpr.SpecialExprDef;
import HaxeExpr.HaxeExprDef;
import HaxeExpr.SpecialExprDef;
import haxe.iterators.StringIterator;
import haxe.macro.ComplexTypeTools;
import haxe.macro.Type;
import HaxeExpr;

@:structInit
class ExprParser {
    var lines:Array<String> = [];
    var lineIndex:Int = 0;
    var stringIndex:Int = 0;
    var lastHeader:Header = null;
    var dbg_path:String = "";
    var nonImpl: Array<String> = [];

    public function new(dbg_path) {
        this.dbg_path = dbg_path;
    }

    public function parse(lines:Array<String>):HaxeExpr {
        // invalid expr
        if (lines.length == 0 || StringTools.contains(lines[0], "cf_expr = None;"))
            return null;
        this.lines = lines;
        var headerMap:Map<Int, Header> = [];
        var firstHeader:Header = null;
        // discard first header for example: [Function:() -> Void], skip straight to Block
        getHeader();
        // recursively get header and add headers to a parent header depending on indention
        while (true) {
            final header = getHeader();
            if (firstHeader == null)
                firstHeader = header;
            if (header == null)
                break;
            headerMap[header.startIndex] = header;
            if (headerMap.exists(header.startIndex - 1))
                headerMap[header.startIndex - 1].headers.push(header);
        }
        if (firstHeader == null) {
            trace("lines parsed:\n" + lines.join("\n"));
            throw "first header not parsed";
        }
        printHeader(firstHeader);
        final expr = headerToExpr(firstHeader);
        // trace(new haxe.macro.Printer().printExpr(expr));
        return expr;
    }

    function findCloseParen(startIndex):Int {
        var parenCount = 0;
        for (i in startIndex...lines.length) {
            for (char in new StringIterator(lines[i])) {
                switch char {
                    case "(".code:
                        parenCount++;
                    case ")".code:
                        parenCount--;
                        if (parenCount == 0)
                            return i;
                    default:
                }
            }
        }
        return -1;
    }
    function headerToExpr(header:Header):HaxeExpr {
        var specialDef:SpecialExprDef = null;
        final def:HaxeExprDef = switch header.def {
            case BLOCK:
                EBlock(header.headers.map(header -> headerToExpr(header)));
            case CALL:
                ECall(headerToExpr(header.headers[0]), header.headers.slice(1).map(header -> headerToExpr(header)));
            case FIELD:
                final field = exprToValueString(headerToExpr(header.headers[1]));
                EField(headerToExpr(header.headers[0]), field);
            case TYPEEXPR:
                EConst(CIdent(header.subType));
            case FSTATIC:
                // [FStatic:(s : String) -> Void]
                // 			fmt
				// 			println:(s : String) -> Void
                final data = StringTools.ltrim(header.dataLines[1]);
                final colonIndex = data.indexOf(":");
                if (colonIndex == -1)
                    throw "colon not found: " + data;
                EConst(CIdent(data.substr(0, colonIndex)));
            case CONST:
                switch header.defType {
                    case "String":
                        final len = header.dataLines[0].length - 1;
                        // space + "", end ""
                        EConst(CString(header.dataLines[0].substring(2, len)));
                    default:
                        trace("Const subType not implemented: |" + header.subType + "|");
                        EConst(CString('#UNKNOWN_DEFTYPE(${header.defType}'));
                }
            case META:
                return headerToExpr(header.headers[0]);
            case ARG:
                // TODO add arg info
                specialDef = Arg("");
                null;
            case RETURN:
                EReturn(headerToExpr(header.headers[0]));
            case BINOP:
                // TODO op not implemented
                EBinop(OpAdd, headerToExpr(header.headers[0]), headerToExpr(header.headers[1]));
            case FINSTANCE:
                specialDef = FInstance(header.dataLines[1].split(":")[0]);
                null;
            case UNOP:
                // TODO unop, and postFix, not implemented
                EUnop(OpIncrement, false, headerToExpr(header.headers[0]));
            case ARRAY:
                specialDef = DArray;
                null;
            case NEW:
                // TODO
                ENew(null, []);
            case OBJDECL:
                EObjectDecl([]);
            case VAR:
                EVars([]);
            case WHILE:
                EWhile(headerToExpr(header.headers[0]), headerToExpr(header.headers[1]), false);
            case LOCAL:
                specialDef = Local;
                null;
            case PARENTHESIS:
                EParenthesis(headerToExpr(header.headers[0]));
            default:
                // throw "not implemented expr: " + header.def;
                if (!nonImpl.contains(header.def)) nonImpl.push(header.def);
                EBlock([]);
        };
        return {
            t: header.defType,
            def: def,
            specialDef: specialDef,
            remapTo: null,
        };
    }
    function exprToValueString(expr:HaxeExpr):String {
        if (expr.specialDef != null)
            switch expr.specialDef {
                case FStatic(_, field):
                    field;
                case FInstance(inst):
                    inst;
                default:
                    throw "exprToValueString specialDef not covered: " + expr.specialDef;
            }
        if (expr.def == null)
            return "#NULL(expr.def)";
        return switch expr.def {
            case EConst(CIdent(s)):
                s;
            case EConst(CInt(v, _)):
                v;
            case EConst(CFloat(f, _)):
                f;
            default:
                throw "not a static expr to convert to a value";
        }
    }
    function printHeader(header:Header, depth:Int=0) {
        //trace([for (i in 0...depth * 2) " "].join("") + " " + header.def);
        //trace(header.subType == null ? "null" :ComplexTypeTools.toString(header.subType));
        for (subHeader in header.headers) {
            printHeader(subHeader, depth + 1);
        }
    }
    function getHeader():Header {
        if (lineIndex >= lines.length)
            return null;
        // get the starting [ character
        final headerStartIndex = lines[lineIndex].indexOf("[", stringIndex) + 1;
        // not -1, because we are adding headerStartIndex 
        // in order to skip over the char (. = cursor)
        // before: .[
        // after:   [.
        if (headerStartIndex == 0) {
            if (lastHeader != null) {
                lastHeader.dataLines.push(lines[lineIndex + 1]);
            }
            nextLine();
            return getHeader();
        }
        final headerEndIndex = lines[lineIndex].indexOf("]", headerStartIndex + 1);
        if (headerEndIndex < headerStartIndex) {
            // TODO more advanced check
            // Assume: cf_overloads = [];
            return null;
            //throw "invalid headerEndIndex: " + headerEndIndex + " start: " + headerStartIndex + " " + lines[lineIndex];
        }
        stringIndex = headerEndIndex + 1;
        final headerString = lines[lineIndex].substring(headerStartIndex, headerEndIndex);
        final header = parseHeader(headerStartIndex, headerString);
        // if there is one liner data, put it into data
        if (lines[lineIndex].charAt(lines[lineIndex].length - 1) == ";") {
            header.dataLines = [lines[lineIndex].substring(headerEndIndex + 1, lines[lineIndex].length - 1)];
        }
        lastHeader = header;
        return header;
    }
    function nextLine() {
        lineIndex++;
        stringIndex = 0;
        return lineIndex < lines.length;
    }
    function parseHeader(startIndex:Int, headerString:String):Header {
        final colonIndex = headerString.indexOf(":", 1);
        if (colonIndex == -1)
            throw "colon not found for given headerString: " + headerString;
        var defString = headerString.substr(0, colonIndex);
        var defTypeString = headerString.substring(colonIndex + 1);
        final defType = defTypeString;
        final spaceIndex = defString.indexOf(" ");
        var subTypeString = "";
        if (spaceIndex != -1) {
            // sub
            subTypeString = headerString.substring(spaceIndex + 1, colonIndex);
            defString = headerString.substring(0, spaceIndex);
        }
        final subType = subTypeString;
        switch defString {
            case "Meta":
                handleMetaAST();
            default:
        }
        return new Header(defString, defType, startIndex, subType);
    }

    function handleMetaAST() {
        final end = findCloseParen(lineIndex + 1);
        //trace("REMOVED");
        final removedLines = lines.splice(lineIndex + 1, end - lineIndex  - 1);
    }
}

@:structInit
class Header {
    public var def:ExprDefHeader;
    public var defType = "";
    public var subType = "";
    public var startIndex:Int = 0;
    public var headers:Array<Header> = [];
    public var dataLines:Array<String> = [];
    public function new(def,defType,startIndex,subType) {
        this.def = def;
        this.defType = defType;
        this.startIndex = startIndex;
        this.subType = subType;
    }
}


enum abstract ExprDefHeader(String) to String {
    var FUNCTION = "Function";
    var BLOCK = "Block";
    var CALL = "Call";
    var FIELD = "Field";
    var TYPEEXPR = "TypeExpr";
    var FSTATIC = "FStatic";
    var CONST = "Const";
    var META = "Meta";
    var NEW = "New";
    var FINSTANCE = "FInstance";
    var ARG = "Arg";
    var RETURN = "Return";
    var LOCAL = "Local";
    var VAR = "Var";
    var IF = "If";
    var PARENTHESIS = "Parenthesis";
    var THEN = "Then";
    var ELSE = "Else";
    var CAST = "Cast";
    var WHILE = "While";
    var BINOP = "Binop";
    var UNOP = "Unop";
    var UNARY = "Unary";
    var FOR = "For";
    var ARRAY = "Array";
    var BREAK = "Break";
    var CONTINUE = "Continue";
    var SWITCH = "Switch";
    var ENUMINDEX = "EnumIndex";
    var CASE = "Case";
    var ENUMPARAMETER = "EnumParameter";
    var FENUM = "FEnum";
    var ARRAYDECL = "ArrayDecl";
    var OBJDECL = "ObjectDecl";
    @:from
    static function fromString(s:String) {
        return switch s {
            case FUNCTION: FUNCTION;
            case BLOCK: BLOCK;
            case CALL: CALL;
            case FIELD: FIELD;
            case TYPEEXPR: TYPEEXPR;
            case FSTATIC: FSTATIC;
            case CONST: CONST;
            case META: META;
            case NEW: NEW;
            case FINSTANCE: FINSTANCE;
            case ARG: ARG;
            case RETURN: RETURN;
            case LOCAL: LOCAL;
            case VAR: VAR;
            case IF: IF;
            case PARENTHESIS: PARENTHESIS;
            case THEN: THEN;
            case ELSE: ELSE;
            case CAST: CAST;
            case WHILE: WHILE;
            case BINOP: BINOP;
            case ARRAY: ARRAY;
            case UNOP: UNOP;
            case BREAK: BREAK;
            case CONTINUE: CONTINUE;
            case SWITCH: SWITCH;
            case ENUMINDEX: ENUMINDEX;
            case CASE: CASE;
            case ENUMPARAMETER: ENUMPARAMETER;
            case FENUM: FENUM;
            case ARRAYDECL: ARRAYDECL;
            case OBJDECL: OBJDECL;
            default:
                throw "ExprDef not found: " + s;
        }
    }
}