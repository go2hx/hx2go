package hx2go.writers;

using StringTools;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.util.OutputBuffer;
import hx2go.hxb.Typed.HxbTFunc;
import hx2go.hxb.Typed.HxbTConstant;
import hx2go.hxb.Typed.HxbFieldAccess;
import hx2go.util.StringConversions;
import hx2go.hxb.Typed.HxbVar;
import hx2go.hxb.Typed.HxbModuleTypeRef;
import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.Typed.HxbTypedExprDef.TConst;
import hx2go.hxb.Ast.HxbBinop;
import hx2go.util.TypeHelper;
import hx2go.hxb.Ast.HxbUnop;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.Typed.HxbTObjectField;
import hx2go.hxb.HxbType;
import hx2go.hxb.TypePath;
import hx2go.hxb.tools.TypedExprTools;
import hx2go.hxb.EnumFieldRef;
import hx2go.hxb.Typed.HxbTCase;
import hx2go.normaliser.Semantics;

class ExprWriter extends WriterImpl {

    public function writeExpr(expr: HxbTypedExpr, topLevel: Bool = false): OutputBuffer {
        if (expr == null) {
            return new OutputBuffer();
        }

        return switch expr.expr {
            case TFunction(func): writeFunction(expr, func, topLevel);
            case TBlock(exprs): writeBlock(expr, exprs);
            case TCall({ expr: TField({ expr: TTypeExpr(MTEnum(_)) }, FEnum(tp, ref)) }, params): writeEnumConstructor(tp, ref.name, params);
            case TField({ expr: TTypeExpr(MTEnum(_)) }, FEnum(tp, ref)): writeEnumConstructor(tp, ref.name, []);
            case TCall(e, args): writeCall(expr, e, args);
            case TConst(c): writeConst(expr, c);
            case TField(e, fa): writeField(expr, e, fa);
            case TLocal(v): writeLocalAccess(expr, v);
            case TTypeExpr(ref): writeTypeAccess(expr, ref);
            case TMeta(m, e): writeExpr(e);
            case TIdent(v): writeIdent(expr, v);
            case TCast(e, ref): writeCast(expr, e, ref);
            case TVar(v, e): writeVarDecl(expr, v, e);
            case TUnop(op, postFix, e): writeUnop(expr, op, postFix, e);
            case TParenthesis(e): writeParenthesis(expr, e);
            case TWhile(econd, ebody, normal): writeWhile(expr, econd, ebody, normal);
            case TIf(econd, eif, eelse): writeIfStmt(expr, econd, eif, eelse);
            case TTry(e, catches): writeTry(e, catches);
            case TBinop(op, left, right): writeBinop(expr, op, left, right);
            case TReturn(e): writeReturn(e);
            case TObjectDecl(fields): writeObjectDecl(expr, fields);
            case TArrayDecl(elements): writeArrayDecl(expr, elements);
            case TArray(e, idx): writeArrayAccess(expr, e, idx);
            case TNew(tp, params, el): writeNew(expr, tp, params, el);
            case TEnumIndex(e): writeEnumIndex(expr, e);
            case TEnumParameter(e, ef, index): writeEnumParameter(expr, e, ef, index);
            case TSwitch(subject, cases, edef): writeSwitch(expr, subject, cases, edef);
            case TBreak: new OutputBuffer("break");
            case TContinue: new OutputBuffer("continue");
            case _: new OutputBuffer();
        }
    }

    public function writeSwitch(expr: HxbTypedExpr, subject: HxbTypedExpr, cases: Array<HxbTCase>, edef: Null<HxbTypedExpr>): OutputBuffer {
        var buf = new OutputBuffer();

        buf.addInline('switch ');
        buf.addBufferInline(writeExpr(subject));
        buf.addInline(' {');

        for (c in cases) {
            buf.add('');
            buf.add('case ', 1, false);
            buf.addInline(c.patterns.map(p -> writeExpr(p).toString()).join(', '));
            buf.add(':');
            buf.addBuffer(writeExpr(c.expr), 2);
        }

        if (edef != null) {
            buf.add('');
            buf.add('default: ', 1);
            buf.addBuffer(writeExpr(edef), 2, false);
        } else if ({
            var p = Semantics.allPathsReturn(expr);
            p.allPathsReturn && !p.isVoidType;
        }) {
            buf.add('');
            buf.add('default: ', 1);
            buf.add('panic("exhaustiveness check mismatch, you shouldn\'t be able to reach this! please report!")', 2, false);
        }

        buf.add('');
        buf.addInline('}');

        return buf;
    }

    public function writeEnumParameter(expr: HxbTypedExpr, e: HxbTypedExpr, ef: EnumFieldRef, index: Int): OutputBuffer {
        var buf = new OutputBuffer();

        buf.addInline('(');
        buf.addBufferInline(writeExpr(e));
        buf.addInline('.Hx_Field_enumParameter($index)).(${writer.types.writeHxbType(expr.t)})');

        return buf;
    }

    public function writeEnumIndex(expr: HxbTypedExpr, e: HxbTypedExpr): OutputBuffer {
        var buf = new OutputBuffer();

        if (e.t != null && e.t.match(TDynamic(_) | TDynamicAny)) {
            // Dynamic may hold a reflect.Value
            // unwrap it to the concrete enum before asserting the enumIndex interface
            buf.addInline('Hx_Field_go_haxe_hxdynamic_ensureInterface(');
            buf.addBufferInline(writeExpr(e));
            buf.addInline(').(Hx_Obj_VTable_go_haxe__hxenumvalue__hxenumvalue).Hx_Field_enumIndex()');
            return buf;
        }

        buf.addBufferInline(writeExpr(e));
        buf.addInline('.Hx_Field_enumIndex()');

        return buf;
    }

    public function writeEnumConstructor(tp: TypePath, name: String, params: Array<HxbTypedExpr>): OutputBuffer {
        var mt = writer.context.resolve(tp);
        var path = StringConversions.moduleTypeGetTypePath(mt);
        var ctorName = '${StringConversions.typePathEnumName(path)}_${name}';

        return new OutputBuffer(
            params.length > 0 ?
            '$ctorName{ ${params.map(p -> writeExpr(p).toString()).join(", ") } }' :
            '$ctorName{}'
        );
    }

    public function writeNew(expr: HxbTypedExpr, tp: TypePath, params: Array<HxbType>, el: Array<HxbTypedExpr>): OutputBuffer {
        var buf = new OutputBuffer();

        buf.addInline('${writer.context.resolvedInstanceName(tp)}_CreateInstance(');

        for (argIdx in 0...el.length) {
            var arg = el[argIdx];
            buf.addBufferInline(writeExpr(arg));

            if (argIdx != el.length - 1) {
                buf.addInline(", ");
            }
        }

        buf.addInline(')');

        return buf;
    }

    public function writeArrayDecl(expr: HxbTypedExpr, elements: Array<HxbTypedExpr>): OutputBuffer {
        var buf = new OutputBuffer();

        buf.addInline("&([]");
        buf.addBufferInline(switch expr.t {
            case TInst(_, params): writer.types.writeHxbType(params[0]);
            case TDynamic(_) | TDynamicAny: writer.types.writeHxbType(expr.t);
            case _: throw "type is not array type for arrayDecl?";
        });

        if (elements.length == 0) buf.addInline('{}');
        else {
            buf.addInline('{ ');

            for (idx in 0...elements.length) {
                buf.addBufferInline(writeExpr(elements[idx]));
                if (idx < elements.length - 1) {
                    buf.addInline(', ');
                }
            }

            buf.addInline(' }');
        }

        buf.addInline(')');

        return buf;
    }

    public function writeArrayAccess(expr: HxbTypedExpr, e: HxbTypedExpr, eidx: HxbTypedExpr): OutputBuffer {
        var buf = new OutputBuffer();
        var scalarConv = scalarElementConversion(expr, e);

        if (scalarConv == null && expr.t != null) {
            var elem = writer.types.writeHxbType(expr.t).toString();

            buf.addInline('func() ${elem} { _hx_a := ');
            buf.addBufferInline(writeExpr(e));
            buf.addInline('; _hx_i := ');
            buf.addBufferInline(writeExpr(eidx));
            buf.addInline('; if _hx_i >= 0 && _hx_i < len((*_hx_a)) { return (*_hx_a)[_hx_i] }; var _hx_z ${elem}; return _hx_z }()');

            return buf;
        }

        if (scalarConv != null) {
            buf.addInline('${scalarConv}(');
        }

        buf.addInline('(*');
        buf.addBufferInline(writeExpr(e));
        buf.addInline(')');
        buf.addInline('[');
        buf.addBufferInline(writeExpr(eidx));
        buf.addInline(']');

        if (scalarConv != null) {
            buf.addInline(')');
        }

        return buf;
    }

    function writeLvalue(expr: HxbTypedExpr): OutputBuffer {
        return switch expr.expr {
            case TArray(e, eidx): writePlainArrayAccess(expr, e, eidx);
            case _: writeExpr(expr);
        }
    }

    function writePlainArrayAccess(expr: HxbTypedExpr, e: HxbTypedExpr, eidx: HxbTypedExpr): OutputBuffer {
        var buf = new OutputBuffer();

        buf.addInline('(*');
        buf.addBufferInline(writeExpr(e));
        buf.addInline(')');
        buf.addInline('[');
        buf.addBufferInline(writeExpr(eidx));
        buf.addInline(']');

        return buf;
    }

    function scalarElementConversion(expr: HxbTypedExpr, e: HxbTypedExpr): Null<String> {
        var want = switch expr.t {
            case TInt: "int";
            case TFloat: "float64";
            case _: return null;
        }

        var elem = concreteArrayElement(e.t);
        if (elem == null) {
            return null;
        }

        return want == writer.types.writeHxbType(elem).toString() ? null : want;
    }

    function concreteArrayElement(t: HxbType): Null<HxbType> {
        if (t == null) {
            return null;
        }

        return switch TypeHelper.followToDef(writer.context, t) {
            case TInst({ name: 'Array', pack: [] }, [el]):
                (el == null || el.match(TDynamic(_) | TDynamicAny)) ? null : el;
            case _: null;
        }
    }

    public function writeObjectDecl(expr: HxbTypedExpr, fields: Array<HxbTObjectField>): OutputBuffer {
        var buf = new OutputBuffer();
        buf.addInline('any(map[string]any{ ');

        for (i in 0...fields.length) {
            var field = fields[i];

            buf.addInline('"${field.name}": ');
            buf.addBufferInline(writeExpr(field.expr));

            if (i < fields.length - 1) {
                buf.addInline(', ');
            }
        }

        buf.addInline(' })');

        return buf;
    }

    public function writeFunction(expr: HxbTypedExpr, func: HxbTFunc, topLevel: Bool): OutputBuffer {
        if (topLevel) return writeExpr(func.expr);
        else {
            var buf = new OutputBuffer();
            var returnType: HxbType = TVoid;

            switch expr.t {
                case TFun(params, ret): buf.addInline('func(${params.map(p -> '${p.name} ${writer.types.writeHxbType(p.t)}').join(', ')}) ${ret == TVoid ? '' : '${writer.types.writeHxbType(ret)} '}');
                case _: null;
            }

            buf.addBufferInline(writeExpr(func.expr));

            return buf;
        }
    }

    public function writeReturn(expr: Null<HxbTypedExpr>): OutputBuffer {
        var buf = new OutputBuffer("return");

        if (expr != null) {
            buf.addInline(' ');
            buf.addBufferInline(writeExpr(expr));
        }

        return buf;
    }

    public function writeBlock(expr: HxbTypedExpr, exprs: Array<HxbTypedExpr>): OutputBuffer {
        var buf = new OutputBuffer();
        buf.add("{");

        for (e in exprs) {
            if (buf.endedWithBlock()) {
                buf.add(''); // makes code more readable when you deal with nesting
            }

            buf.addBuffer(writeExpr(e), 1);
        }

        buf.addInline("}");

        return buf;
    }

    public function writeCast(expr: HxbTypedExpr, e: HxbTypedExpr, ref: HxbModuleTypeRef): OutputBuffer {
        var buf = new OutputBuffer();

        if (e.t == null) {
            return writeExpr(e);
        }

        switch [e.t, expr.t] {
            case [(TDynamic(_) | TDynamicAny), (TDynamic(_) | TDynamicAny)]:
                buf.addBufferInline(writeExpr(e));

            case [(TDynamic(_) | TDynamicAny), _] if (concreteArrayElement(expr.t) != null):
                // converting each element out of its any box
                var elemGo = writer.types.writeHxbType(concreteArrayElement(expr.t)).toString();
                var inHxDynamic = expr.pos?.file.endsWith("HxDynamic.hx") == true;
                buf.addInline('func() *[]${elemGo} { _hx_d := ');
                buf.addInline(inHxDynamic ? '(' : 'Hx_Field_go_haxe_hxdynamic_ensureInterface(');
                buf.addBufferInline(writeExpr(e));
                buf.addInline('); if _hx_c, _hx_ok := _hx_d.(*[]${elemGo}); _hx_ok { return _hx_c }; ');
                buf.addInline('_hx_src := *(_hx_d.(*[]any)); _hx_out := make([]${elemGo}, len(_hx_src)); ');
                buf.addInline('for _hx_i, _hx_v := range _hx_src { _hx_out[_hx_i] = _hx_v.(${elemGo}) }; return &_hx_out }()');

            case [(TDynamic(_) | TDynamicAny), _]:
                buf.addInline(expr.pos?.file.endsWith("HxDynamic.hx") ? '(' : 'Hx_Field_go_haxe_hxdynamic_ensureInterface('); // this is a really bad hack, I know...
                buf.addBufferInline(writeExpr(e));
                buf.addInline(').(');
                buf.addBufferInline(writer.types.writeHxbType(expr.t));
                buf.addInline(')');

            case _:
                buf.addInline('(');
                buf.addInline('(');
                buf.addBufferInline(writer.types.writeHxbType(expr.t));
                buf.addInline(')');
                buf.addInline('(');
                buf.addBufferInline(writeExpr(e));
                buf.addInline(')');
                buf.addInline(')');

        }

        return buf;
    }

    public function writeTry(e: HxbTypedExpr, catches:Array<hx2go.hxb.Typed.HxbTCatch>):OutputBuffer {
        var buf = new OutputBuffer();
        buf.add('func() {');

        for (c in catches) {
            buf.add('defer func() {', 1);
            var catchName = Context.sanitiseString(c.v.name);
            buf.add('if ${catchName} := recover(); ${catchName} != nil ', 2, false);
            buf.addBuffer(writeExpr(c.expr), 2);
            buf.add('}()', 1, false);
            buf.add('');
        }
        
        buf.addBuffer(writeExpr(e), 1);
        buf.addInline('}()');

        return buf;
    }

    public function writeIfStmt(expr: HxbTypedExpr, econd: HxbTypedExpr, eif: HxbTypedExpr, eelse: Null<HxbTypedExpr>): OutputBuffer {
        var buf = new OutputBuffer();

        buf.addInline('if ');
        buf.addBufferInline(writeExpr(econd));
        buf.addInline(' ');
        buf.addBufferInline(writeExpr(eif));

        if (eelse != null) {
            buf.addInline(' else ');
            buf.addBufferInline(writeExpr(eelse));
        }

        return buf;
    }

    public function writeWhile(expr: HxbTypedExpr, econd: HxbTypedExpr, ebody: HxbTypedExpr, normalWhile: Bool): OutputBuffer {
        var buf = new OutputBuffer(); // TODO: handle normalWhile (do {} while(...) vs while (...) {})

        buf.addInline('for ');
        if (!econd.expr.match(TParenthesis({expr: TConst(TBool(true))}))) {
            buf.addBufferInline(writeExpr(econd));
        }
        buf.addInline(' ');
        buf.addBufferInline(writeExpr(ebody));

        return buf;
    }

    public function writeParenthesis(expr: HxbTypedExpr, e: HxbTypedExpr): OutputBuffer {
        var buf = new OutputBuffer();

        buf.addInline('(');
        buf.addBufferInline(writeExpr(e));
        buf.addInline(')');

        return buf;
    }

    public function writeCall(expr: HxbTypedExpr, ecall: HxbTypedExpr, args: Array<HxbTypedExpr>): OutputBuffer {
        var buf = new OutputBuffer();
        var estr = writeExpr(ecall);

        if (estr.toString() == "__go__") { // untyped __go__();
            var cpy = args.copy();
            return writeRaw(cpy.shift(), cpy);
        }

        buf.addBufferInline(estr);
        buf.addInline("(");

        for (argIdx in 0...args.length) {
            var arg = args[argIdx];
            buf.addBufferInline(writeExpr(arg));

            if (argIdx != args.length - 1) {
                buf.addInline(", ");
            }
        }

        buf.addInline(")");

        return buf;
    }

    public function writeVarDecl(expr: HxbTypedExpr, v: HxbVar, vexpr: HxbTypedExpr): OutputBuffer {
        var buf = new OutputBuffer();

        var hasInit = vexpr != null
            && !vexpr.expr.match(TConst(TNull) | TCast({ expr: TConst(TNull) }, _));

        buf.addInline('var ${v.name} ');
        buf.addBufferInline(writer.types.writeHxbType(v.type));
        if (v.name != "_") {
            buf.addInline('; _ = ${v.name}');
        }

        if (hasInit) {
            buf.addInline('\n${v.name} = ');
            buf.addBufferInline(writeExpr(vexpr));
        }

        return buf;
    }

    public function writeBinop(expr: HxbTypedExpr, op: HxbBinop, left: HxbTypedExpr, right: HxbTypedExpr): OutputBuffer {
        var buf = new OutputBuffer();
        var opStr = switch (op) {
            case OpAdd: "+";
            case OpSub: "-";
            case OpMult: "*";
            case OpDiv: "/";
            case OpAssign: "=";
            case OpEq: "==";
            case OpNotEq: "!=";
            case OpGt: ">";
            case OpGte: ">=";
            case OpLt: "<";
            case OpLte: "<=";
            case OpAnd: "&";
            case OpOr: "|";
            case OpXor: "^";
            case OpBoolAnd: "&&";
            case OpBoolOr: "||";
            case OpShl: "<<";
            case OpShr: ">>";
            case OpUShr: ""; // throw "OpUShr not supported"; // TODO: preprocess as this isn't valid
            case OpMod: "%";
            case OpInterval: throw "OpInterval not supported";  // TODO: preprocess as this isn't valid
            case OpArrow: throw "OpArrow not supported"; // TODO: preprocess as this isn't valid
            case OpIn: throw "OpIn not supported"; // TODO: preprocess as this isn't valid
            case OpNullCoal: throw "OpNullCoal not supported"; // TODO: preprocess as this isn't valid

            case OpAssignOp(inner):
                switch (inner) {
                    case OpAdd: "+=";
                    case OpSub: "-=";
                    case OpMult: "*=";
                    case OpDiv: "/=";
                    case OpAnd: "&=";
                    case OpOr: "|=";
                    case OpXor: "^=";
                    case OpShl: "<<=";
                    case OpShr: ">>=";
                    case OpUShr: throw "OpUShr not supported";  // TODO: preprocess as this isn't valid
                    case OpMod: "%=";
                    default:
                        throw 'Unsupported assignment operator: $inner';
                }
        };

        if (op != OpAssign) {
            buf.addInline('(');
        }

        buf.addBufferInline(op.match(OpAssign | OpAssignOp(_)) ? writeLvalue(left) : writeExpr(left));
        buf.addInline(' $opStr ');
        buf.addBufferInline(writeExpr(right));

        if (op != OpAssign) {
            buf.addInline(')');
        }

        return buf;
    }

    public function writeUnop(expr: HxbTypedExpr, op: HxbUnop, postFix: Bool, e: HxbTypedExpr): OutputBuffer {
        var buf = new OutputBuffer();
        var opStr = switch op {
            case OpIncrement: "++";
            case OpDecrement: "--";
            case OpNot: "!";
            case OpNeg: "-";
            case OpNegBits: "^";
            case OpSpread: "";
        }

        if (!postFix) {
            buf.addInline(opStr);
        }

        buf.addBufferInline(op == OpIncrement || op == OpDecrement ? writeLvalue(e) : writeExpr(e));

        if (postFix) {
            buf.addInline(opStr);
        }

        return buf;
    }

    public function writeConst(expr: HxbTypedExpr, c: HxbTConstant): OutputBuffer {
        var str = switch c {
            case TNull: switch expr.t {
                case TString: "``";
                case _: "nil";
            }
            case TThis: "this";
            case TSuper: "super";
            case TBool(v): Std.string(v);
            case TInt(v): Std.string(v);
            case TFloat(v): v;
            case TString(v): StringConversions.quoteString(v);
        }

        return new OutputBuffer(str);
    }

    public function writeField(expr: HxbTypedExpr, e: HxbTypedExpr, fa: HxbFieldAccess): OutputBuffer {
        var estr = writeExpr(e);
        var str = switch fa {
            case FInstance(c, params, cf): '${estr}.${cf.name}';
            case FStatic(c, cf): {
                var m = writer.context.resolve(c);
                if (m == null) {
                    throw 'Could not resolve module for type path: ${c}';
                }

                var tp = StringConversions.moduleTypeGetTypePath(m);
                StringConversions.typePathStaticFieldName(cf.name, tp);
            }
            case FAnon(cf): '${estr}.${StringConversions.toPascalCase(cf.name)}';
            case FClosureInstance(c, params, cf): '${estr}.${cf.name}';
            case FClosureAnon(cf): '${estr}.${cf.name}';
            case FEnum(e, ef): '${estr}.${ef.name}';
            case FDynamic(s): '${estr}.${s}';
        }

        return new OutputBuffer(str);
    }

    public function writeLocalAccess(expr: HxbTypedExpr, v: HxbVar): OutputBuffer {
        return new OutputBuffer(v.name);
    }

    public function writeTypeAccess(expr: HxbTypedExpr, ref: HxbModuleTypeRef): OutputBuffer {
        var str = switch ref {
            case MTTypedef(tp) | MTUnknown(tp): writer.types.writeModuleType(tp);

            case MTAbstract(tp): {
                var m = writer.context.resolve(tp);
                if (m == null ) ""
                else {
                    var ntp = StringConversions.moduleTypeGetTypePath(m);
                    // Class<T> / Enum<T> are both @:coreType and therefore have no RTTI
                    switch ntp {
                        case { name: "Class", pack: [] } | { name: "Enum", pack: [] }: "nil";
                        case _: '${StringConversions.typePathAbstractName(ntp)}_RTTI';
                    }
                }
            }

            case MTClass(tp): {
                var m = writer.context.resolve(tp);
                if (m == null ) ""
                else {
                    var ntp = StringConversions.moduleTypeGetTypePath(m);
                    ntp = switch ntp {
                        case { name: "String", pack: [] }: new TypePath(["go", "haxe"], "HxString", "HxString");
                        case { name: "Array", pack: [] }: new TypePath(["go", "haxe"], "HxArray", "HxArray");
                        case _: ntp;
                    }
                    '${StringConversions.typePathClassInstanceName(ntp)}_RTTI';
                }
            }

            case MTEnum(tp): {
                var m = writer.context.resolve(tp);
                if (m == null ) ""
                else {
                    var ntp = StringConversions.moduleTypeGetTypePath(m);
                    '${StringConversions.typePathEnumName(ntp)}_RTTI';
                }
            }
        }

        return new OutputBuffer(str);
    }

    public function writeRaw(template: HxbTypedExpr, args: Array<HxbTypedExpr>): OutputBuffer {
        var tmpstr = switch template?.expr {
            case TConst(TString(x)): x;
            case _: "";
        }

        for (idx in 0...args.length) {
            tmpstr = tmpstr.replace('{$idx}', writeExpr(args[idx]).toString());
        }

        return new OutputBuffer(tmpstr);
    }

    public function writeIdent(expr: HxbTypedExpr, ident: String): OutputBuffer {
        return new OutputBuffer(ident);
    }

}
