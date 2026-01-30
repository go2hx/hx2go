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
    var stopParser:Bool = false;
    var objectMap:Map<Int, Object> = [];

    public function new(debug_path) {
        this.debug_path = debug_path;
    }

    public function reset() {
        lineIndex = 0;
        stringIndex = 0;
        lastObject = null;
        objectMap.clear();
        stopParser = false;
        nonImpl = [];
    }

    public function parse(lines:Array<String>):HaxeExpr {
        final firstObject = parseObject(lines);
        final expr = objectToExpr(firstObject);
        // trace(new haxe.macro.Printer().printExpr(expr));
        return expr;
    }

    private function spacesToTabs(lines:Array<String>) {
        for (i in 0...lines.length) {
            lines[i] = StringTools.replace(lines[i], "    ", "\t");
        }
    }

    public function parseObject(lines:Array<String>):Object {
        spacesToTabs(lines);
        // invalid expr
        if (lines.length == 0 || StringTools.contains(lines[0], "cf_expr = None;"))
            return null;
        this.lines = lines;
        objectMap = [];
        var firstObject:Object = null;
        // recursively get Object and add Objects to a parent Object depending on indention
        while (true) {
            final object = getObject();
            if (firstObject == null)
                firstObject = object;
            if (object == null) {
                break;
            }
            objectMap[object.startIndex] = object;
            // add to another object based on indentation
            if (objectMap.exists(object.startIndex - 1)) {
                objectMap[object.startIndex - 1].objects.push(object);
            }else{
                // simply add it to the first object
                if (firstObject != object) {
                    firstObject.objects.push(object);
                }
            }
            if (stopParser) {
                stopParser = false;
                break;
            }
        }
        if (firstObject == null) {
            // trace("lines parsed:\n" + lines.join("\n"));
            throw "first object not parsed";
        }
        // printObject(firstObject);
        return firstObject;
    }

    function findCloseParen(startIndex):Int {
        var parenCount = 0;
        // look one line ahead
        for (i in startIndex...lines.length) {
            if (parenCount == 0 && i > startIndex + 1) {
                break;
            }
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
        if (object == null) {
            throw ('obj should not be null!');
            return { t: null, def: EBlock([])};
        }

        var specialDef: Null<SpecialExprDef> = null;
        final def:HaxeExprDef = switch object.def {
            case BLOCK:
                EBlock(object.objects.map(object -> objectToExpr(object)));
            case BREAK:
                EBreak;
            case CALL:
                // trace(object.objects.length);
                if (object.objects.length == 0) {
                    // trace(debug_path);
                    // trace(object.string());
                }
                final e = objectToExpr(object.objects[0]);
                final params = object.objects.slice(1).map(object -> objectToExpr(object));
                specialDef = e.special; // we copy the specialDef from objects[0]; required for FInstance.
                ECall(e, params);
            case FIELD:
                if (object.objects.length == 0) {
                    Logging.exprParser.error('Field failure at: $debug_path');
                    Logging.exprParser.error('Field failure on: ${object.string()}');
                    throw "FIELD NEEDS MORE";
                }
                final e = objectToExpr(object.objects[0]);
                final fexpr = objectToExpr(object.objects[1]);
                final field = exprToValueString(fexpr);
                specialDef = fexpr.special ?? e.special; // we copy the specialDef from objects[1]; required for FInstance.
                EField(e, field);
            case TYPEEXPR:
                EConst(CIdent(object.subType));
            case FSTATIC | FINSTANCE:
                // [FStatic:(s : String) -> Void]
                // 			fmt
				// 			println:(s : String) -> Void
                if (object.objects.length <= 1) {
                    Logging.exprParser.warn('Unexpected FSTATIC/FINSTANCE object length <= 1 at: $debug_path');
                    Logging.exprParser.warn('Object string: ${object.string()}');
                    Logging.exprParser.warn('Object file path: ${object.filePath}');
                    Logging.exprParser.warn('Object objects length: ${object.objects.length}');
                    Logging.exprParser.warn('First object string: ${object.objects[0].string()}');
                }

                var field = object.objects[1].string();
                var path = object.objects[0].string();

                final colonIndex = field.indexOf(":");
                if (colonIndex == -1)
                    throw "colon not found: " + field;
                field = field.substr(0, colonIndex);

                specialDef = switch object.def {
                    case FSTATIC:
                        FStatic(path, field);
                    case FINSTANCE:
                        FInstance(path);
                    case _:
                        null;
                };

                EConst(CIdent(field));
            case FANON:
                var field = object.objects[0].string();
                final colonIndex = field.indexOf(":");
                if (colonIndex == -1)
                    throw "colon not found: " + field;
                field = field.substr(0, colonIndex);
                EConst(CIdent(field));
            case CONST:
                if (object.objects.length == 0) {
                    Logging.exprParser.warn('no value for const at $debug_path, given ${object.string()}');
                }
                final s = object.objects[0].string();
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
                return objectToExpr(object.objects[object.objects.length - 1]);
            case ARG:
                // TODO add arg info
                throw "not allowed to have arg converted to expr";
            case RETURN:
                EReturn(object.objects.length > 0 ? objectToExpr(object.objects[0]) : null);
            case BINOP:
                EBinop(stringToBinop(object.objects[1].string()), objectToExpr(object.objects[0]), objectToExpr(object.objects[2]));
            case UNOP:
                // TODO unop, and postFix, not implemented
                if (object.objects.length != 3) {
                    emptyExpr().def;
                }else{
                    EUnop(stringToUnop(object.objects[0].string()), object.objects[1].string() != "Prefix", objectToExpr(object.objects[2]));
                }
            case ARRAY:
                var e1 = objectToExpr(object.objects[0]);
                var e2 = objectToExpr(object.objects[1]);
                EArray(e1, e2);
            case ARRAYDECL:
                final ct = HaxeExprTools.stringToComplexType(object.defType);
                EArrayDecl(object.objects.map(obj -> objectToExpr(obj)), ct);
            case NEW:
                final ct = HaxeExprTools.stringToComplexType(object.objects[0].string());
                switch ct {
                    case TPath(p):
                        ENew(p, object.objects.slice(1).map(obj -> objectToExpr(obj)));
                    default:
                        throw "unknown ct for new: " + ct;
                }
            case OBJDECL:
                final fields:Array<HaxeObjectField> = [];
                for (obj in object.objects) {
                    final fieldName = obj.string();
                    // shift object decl string back to field "field": value if multiple objects found connected to string
                    if (obj.objects.length > 1) {
                        obj.objects[0].objects = obj.objects.slice(1);
                    }
                    fields.push({
                        field: fieldName,
                        expr: objectToExpr(obj.objects[0]),
                    });
                }
                EObjectDecl(fields);
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
                // mikaib: why do we need this?
                // px: because it's required otherwise we get an invalid type
                // [Local this1(6035):haxe._Rest.NativeRest<haxe.Rest.T>:haxe._Rest.NativeRest<haxe.Rest.T>]
                object.defType = cutHalfComplexTypeString(object.defType);
                specialDef = Local;
                EConst(CIdent(object.subType.substr(0, object.subType.indexOf("("))));
            case PARENTHESIS:
                EParenthesis(objectToExpr(object.objects[0]));
            case SWITCH:
                var cases = object.objects.copy(); // [on, case, case]
                var on = objectToExpr(cases.shift()); // on, [case, case]

                // mikaib: haxe seems to be very eager on reordering switch cases, so thus far I've been unable to get a dump which defines a guard or more than 1 value per case.
                // it may only be generated in very specific situations, or perhaps the dump is in a form where that info is lost.
                // either way, I don't think it should be a huge deal, but, expect the following code to be incomplete in that regard.
                // if you are able to get a dump with such cases, please fix this implementation or send me the dump so I can.
                ESwitch(on, cases.map(c -> {
                    if (c.objects.length > 2) {
                        Util.backtrace("switch case with more than 2 objects", null, null, null, debug_path);
                    }

                    {
                        values: [ objectToExpr(c.objects[0]) ],
                        guard: emptyExpr(),
                        expr: c.objects.length > 1 ? objectToExpr(c.objects[1]) : emptyExpr(),
                    }
                }), null);

            case THROW:
                EThrow(objectToExpr(object.objects[0]));
            case FOR:
                EFor(objectToExpr(object.objects[0]), objectToExpr(object.objects[1]));
            case IF:
                final eelse = object.objects.length <= 2 ? null : objectToExpr(object.objects[2]);
                EIf(objectToExpr(object.objects[0]), objectToExpr(object.objects[1]), eelse);
            case THEN:
                if (object.objects.length == 0) {
                    EConst(CIdent("#THEN_INVALID"));
                }else{
                    if (object.objects[0].objects.length == 0)
                        object.objects[0].objects = object.objects.slice(1);
                    return objectToExpr(object.objects[0]);
                }
            case ELSE:
                if (object.objects.length == 0) {
                    EConst(CIdent("#ELSE_INVALID"));
                }else{
                    if (object.objects[0].objects.length == 0)
                        object.objects[0].objects = object.objects.slice(1);
                    return objectToExpr(object.objects[0]);
                }
            case STRING:
                EConst(CIdent("#STRING " + object.string()));
            case ENUMINDEX:
                EGoEnumIndex(objectToExpr(object.objects[0]));
            case ENUMPARAMETER:
                EGoEnumParameter(objectToExpr(object.objects[0]), object.objects[1].string(), Std.parseInt(object.objects[2].string()));
            case CAST:
                ECast(objectToExpr(object.objects[0]), HaxeExprTools.stringToComplexType(object.defType));
            case FUNCTION:
                final args:Array<HaxeFunctionArg> = [];
                if (object.objects.length == 2) {
                    // TODO
                    // only allow functions to have max 1 arg for now
                    final name = object.objects[0].subType.substr(0, object.objects[0].subType.indexOf("<"));
                    args.push({
                        name: name,
                        type: HaxeExprTools.stringToComplexType(object.objects[0].defType),
                    });
                }
                final ct = HaxeExprTools.stringToComplexType(object.defType);
                final ret = switch ct {
                    case TFunction(_, ret2):
                        ret2;
                    default:
                        Logging.exprParser.error('Expected function, but not TFunction: given $ct');
                        throw "ComplexType of type FUNCTION is not TFunction";
                }
                EFunction(null, {
                    args: args,
                    expr: objectToExpr(object.objects[object.objects.length - 1]),
                    ret: ret,
                });
                //objectToExpr(object.objects[object.objects.length - 1]).def;
            default:
                //throw "not implemented expr: " + object.def;
                if (!nonImpl.contains(object.def)) nonImpl.push(object.def);
                EConst(CIdent("#objectToExpr_" + object.string()));
        };

        return {
            t: object.defType,
            def: def,
            remapTo: null,
            special: specialDef
        };
    }
    // { y : Float, x : Int }:{ y : Float, x : Int }
    // into
    // { y : Float, x : Int }
    function cutHalfComplexTypeString(s:String):String {
        var indexes:Array<Int> = [];
        colonIndexes(s, 0, indexes);
        return s.substr(0, indexes[Std.int(indexes.length/2)]);
    }
    function colonIndexes(s:String, startingIndex:Int, list:Array<Int>) {
        final index = s.indexOf(":", startingIndex);
        if (index == -1)
            return;
        list.push(index);
        colonIndexes(s, index + 1, list);
    }
    function emptyExpr():HaxeExpr {
        return {
            def: EBlock([]),
            t: "",
            remapTo: null,
        };
    }
    function exprToValueString(expr:HaxeExpr):String {
        if (expr.def == null)
            return "#NULL(expr.def)";

        return switch expr.def {
            case EConst(CIdent(s)):
                s;
            case EConst(CInt(v, _)):
                v;
            case EConst(CFloat(f, _)):
                f;
            case EBlock(_.length => 0):
                "#EMPTY_EXPR";
            default:
                throw "not a static expr to convert to a value: " + expr.def;
        }
    }

    public function printObject(object:Object, depth:Int=0) {
        final tab = [for (i in 0...depth * 4) " "].join("");
        final objectStr = "(" + object.string() + ")";
        var str = tab + object.def + "[" + object.defType + " " + object.subType + "]";
        if (object.def == STRING)
            str += " " + object.string();
        Logging.exprParser.debug(str);
        for (subObject in object.objects) {
            printObject(subObject, depth + 1);
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
        // trace(line);
        // Object header not found, jump to next line and try again
        if (objectStartIndex == 0) {
            var trimmedString = getTrimmedString(line);
            if (hasSemicolonSuffix(trimmedString)) {
                // cut off semicolon
                trimmedString = trimmedString.substr(0, trimmedString.length - 1);
                stopParser = true;
            }
            // trace(stopParser, trimmedString);
            // check if STRING object and same line object
            if (lastObject != null && trimmedString.length > 0) {
                if (lastObject.lineIndex == lineIndex) {
                    final object = Object.fromString(lineIndex, 0, trimmedString, debug_path);
                    lastObject.objects.push(object);
                }else{
                    // Next line arbitrary #STRING, for example: BINOP +
                    // start index where the first non space char shows up
                    final startIndex = lines[lineIndex].length - StringTools.ltrim(lines[lineIndex]).length  + 1;
                    final object = Object.fromString(lineIndex, startIndex, trimmedString, debug_path);
                    // trace(lineIndex, startIndex, trimmedString);
                    if (stopParser)
                        return object;
                    nextLine();
                    return object;
                }
            }
            if (stopParser)
                return null;
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
        var colonIndex = line.indexOf(":", stringIndex);
        var parentObj = null;
        if (objectStartIndex > colonIndex) {
            // special designated expr object such as ObjectDecl
            // fileName: [CONST] #STRING
            // etc...
            var trimmedString = getTrimmedString(line);
            // recalculate colonIndex based on trimmed string
            colonIndex -= line.length - trimmedString.length;
            final startIndex = line.length - trimmedString.length + 1;
            trimmedString = trimmedString.substr(0, colonIndex);
            parentObj = Object.fromString(lineIndex, startIndex, trimmedString, debug_path);
        }
        stringIndex = objectEndIndex + 1;

        final objectString = line.substring(objectStartIndex, objectEndIndex);
        final object = parseObjectLine(objectStartIndex, objectString);
        final setStartingIndex = lastObject != null && lastObject.lineIndex == lineIndex;
        /*if (lastObject != null) {
            trace("-----");
            trace(object.def, object.string(), object.lineIndex, setStartingIndex);
            trace(lastObject != null, lastObject.lineIndex == lineIndex, parentObj != null);
            trace("past: " + lastObject.lineIndex);
            trace("========");
        }*/
        // check if same line object, if so always link to previous
        if (setStartingIndex) {
            object.startIndex = lastObject.startIndex + 1;
        }
        lastObject = object;
        if (parentObj != null) {
            object.startIndex = lastObject.startIndex + 1;
            parentObj.objects.push(object);
            return parentObj;
        }else{
            return object;
        }
    }
    function nextLine() {
        lineIndex++;
        stringIndex = 0;
        return lineIndex < lines.length;
    }


    private inline function hasSemicolonSuffix(s:String):Bool {
       return s.charAt(s.length - 1) == ";";
    }

    function getTrimmedString(line:String) {
        return StringTools.ltrim(line.substr(stringIndex));
    }

    function parseObjectLine(startIndex:Int, objectString:String):Object {
        var str = objectString;
        if (str.startsWith("[")) str = str.substring(1);
        if (str.endsWith("]")) str = str.substring(0, str.length - 1);

        function findColon(str:String, startPos:Int = 0):Int {
            var depth = 0;
            for (i in startPos...str.length) {
                var char = str.charAt(i);
                if (char == "<" || char == "(") depth++;
                else if (char == ">" || char == ")") depth--;
                else if (char == ":" && depth == 0) return i;
            }
            return -1;
        }

        final colIdx = findColon(str);
        if (colIdx == -1) throw "colon not found for given ObjectString: " + objectString;

        var defString = str.substring(0, colIdx);
        var remaining = str.substring(colIdx + 1);
        // px: I don't think this is required and was causing problems with some of the dump exprParser tests
        // var lastColIdx = findColon(remaining);
        // while (lastColIdx != -1) {
        //     remaining = remaining.substring(lastColIdx + 1);
        //     lastColIdx = findColon(remaining);
        // }

        final defTypeString = remaining;

        final sIdx = defString.indexOf(" ");
        var subTypeString = "";
        if (sIdx != -1) {
            subTypeString = defString.substring(sIdx + 1);
            defString = defString.substring(0, sIdx);
        }

        switch defString {
            case "Meta":
                handleMeta();
            default:
        }

        return new Object(defString, defTypeString, lineIndex, startIndex, subTypeString, objectString, debug_path);
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
    function handleMeta() {
        var end = findCloseParen(lineIndex + 1);
        // assume meta without parenthesis
        if (end == -1) {
            end = lineIndex + 1;
        }
        lines.splice(lineIndex + 1, end - lineIndex  - 1);
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
    public var filePath:String = "";

    public function new(def,defType,lineIndex,startIndex,subType,rawString, filePath) {
        this.def = def;
        this.defType = defType;
        this.lineIndex = lineIndex;
        this.startIndex = startIndex;
        this.subType = subType;
        this.rawString = rawString;
        this.filePath = filePath;
    }
    public function string():String
        return rawString.trim();

    public static function fromString(lineIndex, startIndex, s:String, filePath:String):Object {
        return {
            def: STRING,
            defType: null,
            lineIndex: lineIndex,
            startIndex: startIndex,
            subType: "",
            rawString: s,
            filePath: filePath,
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
    var IDENT = "Ident";
    var DEFAULT = "Default";
    var FDYNAMIC = "FDynamic";
    var TRY = "Try";
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
            case IDENT: IDENT;
            case DEFAULT: DEFAULT;
            case FDYNAMIC: FDYNAMIC;
            case TRY: TRY;
            default:
                throw "ExprDef not found: " + s;
        }
    }
}
