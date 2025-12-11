package parser.dump;

using StringTools;

import HaxeExpr.SpecialExprDef;
import HaxeExpr.HaxeExprDef;
import HaxeExpr.SpecialExprDef;
import haxe.macro.Expr.Unop;
import haxe.macro.Expr.Binop;
import haxe.iterators.StringIterator;
import haxe.macro.ComplexTypeTools;
import haxe.macro.Type;
import HaxeExpr;

@:structInit
class ExprParser {
    var lines:Array<String> = [];
    var lineIndex:Int = 0;
    var stringIndex:Int = 0;
    var lastObject:Object = null;
    var debug_path:String = "";
    var nonImpl: Array<String> = [];
    var objectMap:Map<Int, Object> = [];

    public function new(debug_path) {
        this.debug_path = debug_path;
    }

    public function parse(lines:Array<String>):HaxeExpr {
        // invalid expr
        if (lines.length == 0 || StringTools.contains(lines[0], "cf_expr = None;"))
            return null;
        this.lines = lines;
        objectMap = [];
        var firstObject:Object = null;
        // discard first Object for example: [Function:() -> Void], skip straight to Block
        getObject();
        // recursively get Object and add Objects to a parent Object depending on indention
        while (true) {
            final object = getObject();
            if (firstObject == null)
                firstObject = object;
            if (object == null)
                break;
            objectMap[object.startIndex] = object;
            // add to another object based on indentation
            if (objectMap.exists(object.startIndex - 1)) {
                objectMap[object.startIndex - 1].objects.push(object);
            }
        }
        if (firstObject == null) {
            // trace("lines parsed:\n" + lines.join("\n"));
            throw "first object not parsed";
        }
        printObject(firstObject);
        final expr = objectToExpr(firstObject);
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
    function objectToExpr(object:Object):HaxeExpr {
        var specialDef:SpecialExprDef = null;
        if (object == null) {
            trace('obj should not be null!');
            return { t: null, specialDef: null, def: EBlock([]) };
        }

        final def:HaxeExprDef = switch object.def {
            case BLOCK:
                EBlock(object.objects.map(object -> objectToExpr(object)));
            case CALL:
                // trace(object.objects.length);
                if (object.objects.length == 0) {
                    // trace(debug_path);
                    // trace(object.string());
                }
                ECall(objectToExpr(object.objects[0]), object.objects.slice(1).map(object -> objectToExpr(object)));
            case FIELD:
                if (object.objects.length == 0) {
                    // trace(debug_path);
                    // trace(object.string());
                    // throw "FIELD NEEDS MORE";
                }
                final field = exprToValueString(objectToExpr(object.objects[1]));
                EField(objectToExpr(object.objects[0]), field);
            case TYPEEXPR:
                EConst(CIdent(object.subType));
            case FSTATIC:
                // [FStatic:(s : String) -> Void]
                // 			fmt
				// 			println:(s : String) -> Void
                EConst(CIdent("#UNKNOWN_STATIC"));
                var field = object.objects[1].string();
                final colonIndex = field.indexOf(":");
                if (colonIndex == -1)
                    throw "colon not found: " + field;
                field = field.substr(0, colonIndex);
                EConst(CIdent(field));
            case CONST:
                // TODO should be redundant
                // but currently catches some semicolon suffixes that get missed
                final s = removeSemicolonSuffix(object.objects[0].string());
                switch object.defType {
                    case "String":
                        final len = s.length - 1;
                        // space + "", end ""
                        EConst(CString(s.substring(1, len)));
                    case "Int":
                        EConst(CInt(s));
                    case "Float":
                        EConst(CFloat(s));
                    default:
                        EConst(CIdent(s));
                }
            case META:
                return objectToExpr(object.objects[0]);
            case ARG:
                // TODO add arg info
                specialDef = Arg("");
                null;
            case RETURN:
                EReturn(objectToExpr(object.objects[0]));
            case BINOP:
                // TODO op not implemented
                //trace(StringTools.trim(object.dataLines[0]));
                EBinop(stringToBinop(object.objects[1].string()), objectToExpr(object.objects[0]), objectToExpr(object.objects[2]));
            case FINSTANCE:
                //specialDef = FInstance(object.dataLines[1].split(":")[0]);
                specialDef = FInstance("#UNKNOWN_STATIC");
                null;
            case UNOP:
                // TODO unop, and postFix, not implemented
                EUnop(stringToUnop(object.objects[0].string()), object.objects[1].string() != "Prefix", objectToExpr(object.objects[2]));
            case ARRAY:
                specialDef = DArray;
                null;
            case ARRAYDECL:
                EArray(objectToExpr(object.objects[0]), objectToExpr(object.objects[1]));
            case NEW:
                final ct = HaxeExprTools.stringToComplexType(object.objects[0].string());
                switch ct {
                    case TPath(p):
                        ENew(p, object.objects.slice(1).map(obj -> objectToExpr(obj)));
                    default:
                        throw "unknown ct for new: " + ct;
                }
            case OBJDECL:
                // trace("object decl not implemented");
                EObjectDecl([]);
            case VAR:
                EVars([{
                    name: object.subType.substr(0, object.subType.indexOf("<")),
                    type: HaxeExprTools.stringToComplexType(object.defType),
                    expr: object.objects.length == 0 ? null : objectToExpr(object.objects[0]),
                }]);
            case WHILE:
                EWhile(objectToExpr(object.objects[0]), objectToExpr(object.objects[1]), true);
            case DO:
                EWhile(objectToExpr(object.objects[0]), objectToExpr(object.objects[1]), false);
            case LOCAL:
                object.defType = object.subType;
                specialDef = Local;
                null;
            case PARENTHESIS:
                EParenthesis(objectToExpr(object.objects[0]));
            case THROW:
                EThrow(objectToExpr(object.objects[0]));
            case FANON:
                specialDef = FAnon("#UNKNOWN_FANON");
                null;
            case FOR:
                EFor(objectToExpr(object.objects[0]), objectToExpr(object.objects[1]));
            case IF:
                EIf(objectToExpr(object.objects[0]), objectToExpr(object.objects[1]), object.objects.length <= 2 ? null : objectToExpr(object.objects[2]));
            case THEN:
                if (object.objects.length == 0) {
                    EConst(CIdent("#THEN_INVALID"));
                }else{
                    object.objects[0].objects = object.objects.slice(1);
                    return objectToExpr(object.objects[0]);
                }
            case ELSE:
                if (object.objects.length == 0) {
                    EConst(CIdent("#ELSE_INVALID"));
                }else{
                    object.objects[0].objects = object.objects.slice(1);
                    return objectToExpr(object.objects[0]);
                }
            case STRING:
                EConst(CIdent("#STRING " + object.string()));
            default:
                //throw "not implemented expr: " + object.def;
                if (!nonImpl.contains(object.def)) nonImpl.push(object.def);
                EConst(CIdent("#objectToExpr_" + object.string()));
        };
        return {
            t: object.defType,
            def: def,
            specialDef: specialDef,
            remapTo: null,
        };
    }
    function emptyExpr():HaxeExpr {
        return {
            def: EBlock([]),
            t: "",
            specialDef: null,
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
                case FAnon(field):
                    field;
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
    function printObject(object:Object, depth:Int=0) {
        final tab = [for (i in 0...depth * 4) " "].join("");
        final objectStr = "(" + object.string() + ")";
        // trace(tab + object.def + "[" + object.defType + " " + object.subType + "]");
        if (object.def == STRING)
            // trace(tab + "    " + object.string());
        for (subObject in object.objects) {
            // printObject(subObject, depth + 1);
        }
    }


    function getObject():Object {
        final line = lines[lineIndex];
        if (lineIndex >= lines.length)
            return null;
        // get the starting [ character
        final quoteIndex = line.indexOf('"', stringIndex) + 1;
        var objectStartIndex = line.indexOf("[", stringIndex) + 1;
        // check if const string is quote
        if (quoteIndex != 0 && objectStartIndex > quoteIndex)
            objectStartIndex = 0;
        // not -1, because we are adding ObjectStartIndex
        // in order to skip over the char (. = cursor)
        // before: .[
        // after:   [.

        // Object header not found, jump to next line and try again
        if (objectStartIndex == 0) {
            // check if STRING object and same line object
            final trimmedString = StringTools.ltrim(line.substr(stringIndex));
            if (lastObject != null&& trimmedString.length > 0) {
                if (lastObject.lineIndex == lineIndex) {
                    if (trimmedString == ";") {
                        // trace("ENDING EXPR PARSER ON LINE (semicolon found): " + line);
                        return null;
                    }
                    final object = Object.fromString(lineIndex, 0, trimmedString);
                    lastObject.objects.push(object);
                }else{
                    // Next line arbitrary #STRING, for example: BINOP +
                    final startIndex = lines[lineIndex].length - trimmedString.length + 1;
                    final object = Object.fromString(lineIndex, startIndex, trimmedString);
                    // trace(lineIndex, startIndex, trimmedString);
                    nextLine();
                    return object;
                }
            }
            nextLine();
            return getObject();
        }
        // end position
        final objectEndIndex = line.indexOf("]", objectStartIndex + 1);

        if (objectEndIndex < objectStartIndex) {
            // TODO more advanced check
            // Assume: cf_overloads = [];
            // trace("ENDING EXPR PARSER ON LINE: " + line);
            return null;
        }
        stringIndex = objectEndIndex + 1;

        final objectString = line.substring(objectStartIndex, objectEndIndex);
        final object = parseObject(objectStartIndex, objectString);
        // check if same line object, if so always link to previous
        if (lastObject != null && lastObject.lineIndex == lineIndex) {
            object.startIndex = lastObject.startIndex + 1;
        }
        lastObject = object;
        return object;
    }
    function nextLine() {
        lineIndex++;
        stringIndex = 0;
        return lineIndex < lines.length;
    }
    private inline function removeSemicolonSuffix(s:String):String {
        if (s.charAt(s.length - 1) == ";") {
            return s.substr(0, s.length - 1);
        }else{
            return s;
        }
    }
    function parseObject(startIndex:Int, objectString:String):Object {
        final colonIndex = objectString.indexOf(":", 1);
        if (colonIndex == -1)
            throw "colon not found for given ObjectString: " + objectString;
        var defString = objectString.substr(0, colonIndex);
        var defTypeString = objectString.substring(colonIndex + 1);
        final defType = defTypeString;
        final spaceIndex = defString.indexOf(" ");
        var subTypeString = "";
        if (spaceIndex != -1) {
            // sub
            subTypeString = objectString.substring(spaceIndex + 1, colonIndex);
            defString = objectString.substring(0, spaceIndex);
        }
        final subType = subTypeString;
        switch defString {
            case "Meta":
                handleMetaAST();
            default:
        }
        return new Object(defString, defType, lineIndex, startIndex, subType, objectString);
    }

    function stringToUnop(un: String):Unop {
        return switch (un)  {
            case "++": OpIncrement;
            case "--": OpDecrement;
            case "!": OpNot;
            case "-": OpNeg;
            case "~": OpNegBits;
            case "...": OpSpread;
            default:
                throw "failed to stringToUnop: " + un;
        }
    }

    function stringToBinop(op: String, isOpAssignOp: Bool = false): Binop {
        return switch (op) {
            case "+": OpAdd;
            case "*": OpMult;
            case "/": OpDiv;
            case "-": OpSub;
            case "=": OpAssign;
            case "==": OpEq;
            case "!=": OpNotEq;
            case ">": OpGt;
            case ">=": OpGte;
            case "<": OpLt;
            case "<=": OpLte;
            case "&": OpAnd;
            case "|": OpOr;
            case "^": OpXor;
            case "&&": OpBoolAnd;
            case "||": OpBoolOr;
            case "<<": OpShl;
            case ">>": OpShr;
            case ">>>": OpUShr;
            case "%": OpMod;
            case "...": OpInterval;
            case "=>": OpArrow;
            case "in": OpIn;
            case "??": OpNullCoal;
            case _ if (!isOpAssignOp): OpAssignOp(stringToBinop(op.substr(0, 1), true));
            default:
                throw "failed to stringToBinop: " + op;
        }
    }

    function handleMetaAST() {
        final end = findCloseParen(lineIndex + 1);
        //trace("REMOVED");
        final removedLines = lines.splice(lineIndex + 1, end - lineIndex  - 1);
    }
}

@:structInit
class Object {
    public var def:ExprDefObject;
    var rawString = "";
    public var defType = "";
    public var subType = "";
    public var lineIndex:Int = 0;
    public var startIndex:Int = 0;
    public var objects:Array<Object> = [];

    public function new(def,defType,lineIndex,startIndex,subType,rawString) {
        this.def = def;
        this.defType = defType;
        this.lineIndex = lineIndex;
        this.startIndex = startIndex;
        this.subType = subType;
        this.rawString = rawString;
    }
    public function string():String
        return rawString;

    public static function fromString(lineIndex, startIndex, s:String):Object {
        return {
            def: STRING,
            defType: null,
            lineIndex: lineIndex,
            startIndex: startIndex,
            subType: "",
            rawString: s,
        }
    }
}


enum abstract ExprDefObject(String) to String {
    var STRING = "#STRING#";
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
    var DO = "Do";
    var ENUMPARAMETER = "EnumParameter";
    var FENUM = "FEnum";
    var ARRAYDECL = "ArrayDecl";
    var OBJDECL = "ObjectDecl";
    var THROW = "Throw";
    var FANON = "FAnon";
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
            case THROW: THROW;
            case FANON: FANON;
            case DO: DO;
            default:
                throw "ExprDef not found: " + s;
        }
    }
}
