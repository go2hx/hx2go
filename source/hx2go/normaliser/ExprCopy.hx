package hx2go.normaliser;

import hxb.Typed.HxbTypedExpr;
import hxb.Typed.HxbTypedExprDef;
import hxb.Typed.HxbTFunc;

class ExprCopy {

    public static function copy(e:HxbTypedExpr):HxbTypedExpr {
        if (e == null) return null;
        return new HxbTypedExpr(copyDef(e.expr), e.t, e.pos);
    }

    public static function copyList(el:Array<HxbTypedExpr>):Array<HxbTypedExpr> {
        return copyArray(el);
    }

    static function copyNullable(e:Null<HxbTypedExpr>):Null<HxbTypedExpr> {
        return e == null ? null :copy(e);
    }

    static function copyArray(el:Array<HxbTypedExpr>):Array<HxbTypedExpr> {
        var out = new Array<HxbTypedExpr>();
        for (x in el) out.push(x == null ? null :copy(x));
        return out;
    }

    static function copyDef(def:HxbTypedExprDef):HxbTypedExprDef {
        return switch def {
            case TConst(_) | TLocal(_) | TTypeExpr(_) | TIdent(_) | TBreak | TContinue:
                def;

            case TArray(e1, e2):
                TArray(copy(e1), copy(e2));

            case TBinop(op, e1, e2):
                TBinop(op, copy(e1), copy(e2));

            case TField(e, fa):
                TField(copy(e), fa);

            case TParenthesis(e):
                TParenthesis(copy(e));

            case TObjectDecl(fields):
                TObjectDecl([ for (f in fields) { name: f.name, pos: f.pos, quotes: f.quotes, expr:copy(f.expr) } ]);

            case TArrayDecl(el):
                TArrayDecl(copyArray(el));

            case TCall(e, el):
                TCall(copy(e), copyArray(el));

            case TNew(c, params, el):
                TNew(c, params, copyArray(el));

            case TUnop(op, postFix, e):
                TUnop(op, postFix, copy(e));

            case TFunction(tfunc):
                TFunction(new HxbTFunc(
                    [ for (a in tfunc.args) { v:a.v, value:copyNullable(a.value) } ],
                    tfunc.t,
                    copy(tfunc.expr)
                ));

            case TVar(v, expr):
                TVar(v, copyNullable(expr));

            case TBlock(el):
                TBlock(copyArray(el));

            case TIf(econd, eif, eelse):
                TIf(copy(econd), copy(eif), copyNullable(eelse));

            case TWhile(econd, e, normalWhile):
                TWhile(copy(econd), copy(e), normalWhile);

            case TSwitch(subject, cases, edef):
                TSwitch(
                    copy(subject),
                    [ for (c in cases) { patterns:copyArray(c.patterns), expr:copy(c.expr) } ],
                    copyNullable(edef)
                );

            case TTry(e, catches):
                TTry(copy(e), [ for (c in catches) { v:c.v, expr:copy(c.expr) } ]);

            case TReturn(e):
                TReturn(copyNullable(e));

            case TThrow(e):
                TThrow(copy(e));

            case TCast(e, m):
                TCast(copy(e), m);

            case TMeta(m, e):
                TMeta(m, copy(e));

            case TEnumParameter(e, ef, index):
                TEnumParameter(copy(e), ef, index);

            case TEnumIndex(e):
                TEnumIndex(copy(e));
        }
    }
}
