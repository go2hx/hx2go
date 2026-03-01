package transformer.exprs;

import haxe.macro.Expr.Binop;
import haxe.macro.Expr.TypePath;
import haxe.macro.ComplexTypeTools;
import haxe.macro.Expr.ComplexType;
import preprocessor.Preprocessor;
import haxe.EnumTools.EnumValueTools;
import preprocessor.Semantics;
import HaxeExpr.HaxeExprDef;
import HaxeExpr.SpecialExprDef;

function transformBinop(t:Transformer, e:HaxeExpr, op:Binop, e1:HaxeExpr, e2:HaxeExpr) {
    if (handleSideTransform(t, e, op, e1, e2)) return;
    if (handleSideTransform(t, e, op, e2, e1)) return;

    if ((e1.t != e2.t || op == OpDiv || e1.t == "Dynamic" || e2.t == "Dynamic") && op != OpAssign) {
        promoteBinop(t, e1, e2, e, op);
        return;
    }

    if (e1.t != e2.t && op == OpAssign) {
        if (e1?.t == null) {
            Logging.transformer.debug('Cannot resolve resulting type: ${e1?.t} -> ${e2?.t}');
            t.iterateExpr(e);
            return;
        }

        final ct = HaxeExprTools.stringToComplexType(e1.t);
        e2.def = ECast(e2.copy(), ct);
        e2.t = e1.t;
        t.iterateExpr(e);

        return;
    }

    t.iterateExpr(e);
}

function exprToInt(e: HaxeExpr): Int {
    return switch e.def {
        case EConst(CInt(s, _)): Std.parseInt(s);
        case _: 0;
    }
}

function handleSideTransform(t:Transformer, e:HaxeExpr, op:Binop, side:HaxeExpr, otherSide:HaxeExpr):Bool {
    return switch side?.def {
        case EGoEnumIndex(expr): {
            if (expr?.t == null)
                return false;

            switch HaxeExprTools.stringToComplexType(expr.t) {
                case TPath({ pack: ["go"], name: "Result", params: [_, TPType(errType)] }) if (op == OpEq || op == OpNotEq): handleResultBinop(t, e, op, expr, otherSide, errType);
                case _: false;
            }
        }

        case _: false;
    }
}

function handleResultBinop(t:Transformer, e:HaxeExpr, op:Binop, side:HaxeExpr, otherSide:HaxeExpr, errType:ComplexType):Bool {
    final enumIdx = exprToInt(otherSide);
    final cmpError = (op == OpEq) == (enumIdx == 0) ? OpEq : OpNotEq;

    e.def = EBinop(cmpError, {
        t: null,
        def: EField(side, "Error")
    }, {
        t: ComplexTypeTools.toString(errType),
        def: EConst(CIdent("null"))
    });

    t.iterateExpr(e);

    return true;
}

function unpackNull(ct: ComplexType) { // avoid usage of this if you can...
    if (ct == null) {
        return null;
    }

    return switch ct {
        case TPath({ pack: [], name: "Null", params: [TPType(inner)] }): inner;
        case _: ct;
    }
}

function promoteBinop(t: Transformer, e1:HaxeExpr, e2:HaxeExpr, e:HaxeExpr, op: Binop) {
    if (e.t == null) {
        Logging.transformer.warn("unknown return type of binop");
        t.iterateExpr(e);
        return;
    }

    // special case to prevent division from being floored in Go if an integer
    // TODO: this is not correct, for example: dynamic, abstracts, etc ~mikaib
    if (op == OpDiv) {
        e1.t = "Float";
        e2.t = "Float";
    }

    final resultCt = HaxeExprTools.stringToComplexType(e.t);
    final leftCt = unpackNull(e1.t != null ? HaxeExprTools.stringToComplexType(e1.t) : null);
    final rightCt = unpackNull(e2.t != null ? HaxeExprTools.stringToComplexType(e2.t) : null);

    // TODO: review whenever we properly introduce Null<T>

    final typeEq = (a: ComplexType, b: ComplexType) -> {
        if (a == null || b == null || op == OpDiv) {
            return false;
        }

        return ComplexTypeTools.toString(a) == ComplexTypeTools.toString(b);
    }

    switch [leftCt, rightCt] {
        case [TPath({ pack: [], name: "Dynamic" }), _] | [_, TPath({ pack: [], name: "Dynamic" })]: // cast if any type is dynamic, regardless of result type
            var dyn = toDynamicOp(e1, e2, op);

            e.def = switch resultCt {
                case TPath({ pack: [], name: "Float" }): makeHxDynamicCall("toFloat", [dyn]);
                case TPath({ pack: [], name: "Int" }): makeHxDynamicCall("toInt", [dyn]);
                case TPath({ pack: [], name: "Bool" }): makeHxDynamicCall("toBool", [dyn]);
                case _: dyn.def;
            }

            t.transformExpr(e);
            return;

        case _:
    }

    switch resultCt {
        case TPath({ pack: [], name: "Bool" }): { // compare
            // all go.* types are already handled, so we only need to care about basic types
            switch [leftCt, rightCt] {
                case [TPath({ pack: [], name: "Int" }), TPath({ pack: [], name: "Float" })]:
                    e1.def = ECast(e1.copy(), rightCt);
                    e1.t = e2.t; // this will copy over the Null<T> property if it exists, but that doesn't matter

                case [TPath({ pack: [], name: "Float" }), TPath({ pack: [], name: "Int" })]:
                    e2.def = ECast(e2.copy(), leftCt);
                    e2.t = e1.t; // this will copy over the Null<T> property if it exists, but that doesn't matter

                case _: // any other comparison we ignore for now...
            }
        }

        case _: { // generic
            if (!typeEq(resultCt, leftCt)) {
                e1.def = ECast(e1.copy(), resultCt);
                e1.t = e.t; // this will copy over the Null<T> property if it exists, but that doesn't matter
            }

            if (!typeEq(resultCt, rightCt)) {
                e2.def = ECast(e2.copy(), resultCt);
                e2.t = e.t; // this will copy over the Null<T> property if it exists, but that doesn't matter
            }
        }
    }

    t.iterateExpr(e);
}

function makeHxDynamicCall(funcName: String, params: Array<HaxeExpr>): HaxeExprDef {
    return ECall({
        t: null,
        def: EField({
            t: null,
            def: EField({
                t: null,
                def: EConst(CIdent("runtime")),
            }, "HxDynamic"),
        }, funcName),
        special: FStatic("runtime.HxDynamic", funcName)
    }, params);
}

function toDynamicOp(left: HaxeExpr, right: HaxeExpr, op: Binop): HaxeExpr {
    var funcName = switch op {
        case OpAdd: "add";
        case OpMult: "multiply";
        case OpDiv: "divide";
        case OpSub: "subtract";
        case OpEq: "equals";
        case OpNotEq: "nequals";
        case OpGt: "gt";
        case OpGte: "gtequals";
        case OpLt: "lt";
        case OpLte: "ltequals";
        case OpAnd: "bitand";
        case OpOr: "bitor";
        case OpXor: "bitxor";
        case OpBoolAnd: "and";
        case OpBoolOr: "or";
        case OpShl: "lbitshift";
        case OpShr: "rbitshift";
        case OpUShr: "urbitshift";
        case OpMod: "modulo";
        case OpAssign, OpInterval, OpArrow, OpIn, OpNullCoal: Logging.transformer.error("Invalid promoteBinop with Dynamic (toDynamicOp)"); "#ERROR";
        case OpAssignOp(innerOp): {
            return { t: null, def: EBinop(OpAssign, left.copy(), toDynamicOp(left, right, innerOp)) };
        }
    }

    return { t: null, def: makeHxDynamicCall(funcName, [left, right]) };
}

