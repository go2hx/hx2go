package hx2go.preprocessor;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.tools.TypedExprTools;
import hx2go.hxb.Typed.HxbTypedExprDef;
import haxe.runtime.Copy;
import hx2go.hxb.HxbType;

class Preprocessor {

    public static function run(expr: HxbTypedExpr, scope: Scope, context: Context): Void {
        new Preprocessor(context).processExpr(expr, scope, null);
    }

    private var context: Context;

    public function new(context: Context) {
        this.context = context;
    }

    public function iterateExpr(e: HxbTypedExpr, scope: Scope, ancestor: Null<Ancestor>) {
        var children = []; // copy to prevent issues if mutating
        TypedExprTools.iter(e, child -> children.push(child));

        for (idx in 0...children.length) {
            processExpr(children[idx], scope, { node: e, up: ancestor, indexInParent: idx });
        }
    }

    public function processExpr(expr: HxbTypedExpr, scope: Scope, ancestor: Null<Ancestor>): Void {
        if (ancestor != null && !Semantics.canHold(ancestor.node, expr)) {
            switch Semantics.getExprKind(expr) {
                case KExpr: toStmt(expr, scope, ancestor); // expr -> stmt (by `_ = expr`)
                case KStmt: toExpr(expr, scope, ancestor); // stmt -> expr (by kind-specific extraction)
                case KEither: expr;
            };
        }

        iterateExpr(expr, scope, ancestor);
    }

    public function toExpr(expr: HxbTypedExpr, scope: Scope, ancestor: Null<Ancestor>): Void {
        trace('conv to expr: $expr');
    }

    public function toStmt(expr: HxbTypedExpr, scope: Scope, ancestor: Null<Ancestor>): Void {
        expr.expr = TBinop(
            OpAssign,
            new HxbTypedExpr(TIdent('_'), TVoid, null),
            Copy.copy(expr)
        ); // TODO: if no side effects, it may be omitted.
    }

}
