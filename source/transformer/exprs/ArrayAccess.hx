package transformer.exprs;

import haxe.macro.Expr.ComplexType;
import HaxeExpr.HaxeVar;

function transformArrayAccess(t:Transformer, e: HaxeExpr, e1:HaxeExpr, e2:HaxeExpr) {
    final ct = HaxeExprTools.stringToComplexType(e1.t);
    switch (ct) {
        case TPath(p):
            switch [p.name, p.pack, p.params] {
                case ["Array", [], [TPType(_)]]:
                    e1.def = EGoCode("(*{0})", [e1.copy()]);

                case ["Dynamic", [], _]:
                    switch e.parent?.def {
                        case EBinop(OpAssignOp(_), _, _):
                            Logging.transformer.warn("ArrayAccess set on OpAssignOp was not expected!");

                        case EBinop(OpAssign, _, right):
                            e.parent.def = t.createCallStatic("runtime.HxDynamic", "setArrayIndex", [e1, e2, right]);
                            t.transformExpr(e.parent);

                        case _:
                            e.def = t.createCallStatic("runtime.HxDynamic", "getArrayIndex", [e1, e2]);
                            t.transformExpr(e);
                    }

                case _:
                    Logging.transformer.warn('ArrayAccess on unsupported type: $p in ${t.module.path}');
            }

        case _:
    }

    t.iterateExpr(e);
}
