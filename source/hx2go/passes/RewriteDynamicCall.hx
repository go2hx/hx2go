package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.util.ExprHelper;
import hx2go.hxb.HxbType;
import hx2go.hxb.Ast.HxbBinop;

class RewriteDynamicCall extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall(e, _) if (e.t != null && e.t.match(TDynamicAny | TDynamic(_))): true;
            case _: false;
        }
    }

    public function makeDynamicCall(params: Array<HxbTypedExpr>, call: String): HxbTypedExpr {
        var e = ExprHelper.createCallStatic(
            context,
            {
                name: 'HxDynamic',
                moduleName: 'HxDynamic',
                pack: ['go', 'hx2go']
            },
            call,
            params
        );
        e.t = TDynamicAny;

        return e;
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
//            case TCall({ expr: TField(e, FDynamic(field)) }, params) if (e.t != null && e.t.match(TDynamic(_) | TDynamicAny)): {
//                var o = makeDynamicCall([e, new HxbTypedExpr(TConst(TString(field)), TString, expr.pos), new HxbTypedExpr(TArrayDecl(params), TInst({ name: "Array", moduleName: "Array", pack: [] }, [TDynamicAny]), expr.pos)], 'callMethod');
//                expr.expr = o.expr;
//                expr.t = o.t;
//            }

            case TCall(e, params): {
                var o = makeDynamicCall([e, new HxbTypedExpr(TArrayDecl(params), TInst({ name: "Array", moduleName: "Array", pack: [] }, [TDynamicAny]), expr.pos)], 'call');
                expr.expr = o.expr;
                expr.t = o.t;
            }

            case _: null;
        }
    }

}