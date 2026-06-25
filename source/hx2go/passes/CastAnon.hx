package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import hx2go.hxb.Typed.HxbVarKind;
import hx2go.hxb.Typed.HxbVar;
import hx2go.util.TypeHelper;

class CastAnon extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        if (expr.t == null) {
            return false;
        }

        return switch [expr.expr, expr.t] {
            case [TCast({ t: fromT}, _), toT]:
                TypeHelper.follow(context, fromT).match(TAnon(_)) &&
                TypeHelper.follow(context, toT).match(TAnon(_));

            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        switch [expr.expr, expr.t] {
            case [TCast({ t: fromT}, _), toT]: {
                var fromFields = switch TypeHelper.follow(context, fromT) {
                    case TAnon(x): x.fields;
                    case _: null;
                }

                var toFields = switch TypeHelper.follow(context, toT) {
                    case TAnon(x): x.fields;
                    case _: null;
                }

                if (fromFields == null || toFields == null) {
                    return;
                }

                for (to in toFields) {
                    var from = fromFields.filter(f -> f.name == to.name)[0];
                    trace(from.name, from.type, to.name, to.type);
                }
            }

            case _: null;
        }
    }

}