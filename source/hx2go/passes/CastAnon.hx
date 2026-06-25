package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import hx2go.hxb.Typed.HxbVarKind;
import hx2go.hxb.Typed.HxbVar;
import hx2go.util.TypeHelper;
import hx2go.hxb.Typed.HxbTObjectField;
import hx2go.hxb.Typed.HxbFieldAccess;
import haxe.runtime.Copy;

class CastAnon extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        if (expr.t == null) {
            return false;
        }

        return switch [expr.expr, expr.t] {
            case [TCast({ t: fromT}, _), toT]:
                TypeHelper.follow(context, fromT).match(TAnon(_) | TDynamicAny | TDynamic(_)) &&
                TypeHelper.follow(context, toT).match(TAnon(_));

            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch [expr.expr, expr.t] {
            case [TCast(e, _), toT]: {
                var fromT = e.t;
                if (fromT == null) {
                    return;
                }

                var fromFields = switch TypeHelper.follow(context, fromT) {
                    case TAnon(x): x.fields;
                    case TDynamic(_) | TDynamicAny: [];
                    case _: null;
                }

                var toFields = switch TypeHelper.follow(context, toT) {
                    case TAnon(x): x.fields;
                    case _: null;
                }

                if (fromFields == null || toFields == null) {
                    return;
                }

                var original = new HxbVar(
                    -1,
                    'hx_anon',
                    VUser(TVOLocalVariable),
                    0,
                    [],
                    expr.pos,
                    fromT
                );

                var newFields: Array<HxbTObjectField> = [];
                var temp: HxbTypedExpr = new HxbTypedExpr(TVar(original, Copy.copy(e)), null, null);
                var temp_ident: HxbTypedExpr = new HxbTypedExpr(TLocal(original), null, null);

                for (to in toFields) {
                    var from = fromFields.filter(f -> f.name == to.name)[0];
                    var o = new HxbTypedExpr(TField(temp_ident, from == null ? FDynamic(to.name) : FAnon(from)), from?.type ?? TDynamicAny, null);

                    if (from?.type == null || !TypeHelper.compare(to.type, from.type)) {
                        o = ExprHelper.createCast(o, to.type); // NOTE: no submit since it's done later
                    }

                    newFields.push({
                        name: to.name,
                        pos: to.pos,
                        quotes: NoQuotes,
                        expr: o
                    });
                }

                var followed = TypeHelper.follow(context, toT);
                expr.t = followed;
                expr.expr = TBlock([
                    temp,
                    new HxbTypedExpr(TObjectDecl(newFields), followed, null)
                ]);

                if (!TypeHelper.compare(followed, toT)) {
                    var o = ExprHelper.createCast(expr, toT);
                    expr.expr = o.expr;
                    expr.t = o.t;
                }

                context.submitNode(expr, true, 1);
            }

            case _: null;
        }
    }

}