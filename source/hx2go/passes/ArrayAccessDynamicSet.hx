package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.flags.HxbClassFlag;
import hx2go.hxb.Typed.HxbFieldAccess;
import hx2go.hxb.Ast.HxbExpr;
import hx2go.hxb.Ast.HxbExprDef.EObjectDecl;
import hx2go.hxb.Ast.HxbExprDef.EConst;
import hx2go.hxb.Ast.HxbExprDef.EArrayDecl;
import hx2go.hxb.HxbModuleType;
import hx2go.util.ExprHelper;
import hx2go.util.StringConversions;
import hx2go.hxb.Ast.HxbObjectField;
import hx2go.util.ObjectFieldHelper;
import hx2go.hxb.HxbType;
import hx2go.util.TypeHelper;

class ArrayAccessDynamicSet extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpAssign | OpAssignOp(_), { expr: TArray({ t: t }, _) }, _):
                switch (TypeHelper.follow(context, t)) {
                    case TInst({ name: "Array", pack: [] }, [TDynamic(_) | TDynamicAny]) | TDynamic(_) | TDynamicAny: true;
                    case _: false;
                }
            case _: false;
        }
    }

    public function setArrayIndex(on: HxbTypedExpr, idx: HxbTypedExpr, value: HxbTypedExpr): HxbTypedExpr {
        return ExprHelper.createCallStatic(context, { name: 'HxDynamic', moduleName: 'HxDynamic', pack: ['go', 'haxe'] }, 'setArrayIndex', [on, idx, value]);
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var o = switch expr.expr {
            case TBinop(OpAssign, { expr: TArray(e, eidx) }, right):
                setArrayIndex(e, eidx, right);

            case _: expr;
        }

        expr.expr = o.expr;
        expr.t = o.t;
    }

}