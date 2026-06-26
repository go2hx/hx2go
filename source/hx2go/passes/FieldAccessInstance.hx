package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.Typed.HxbFieldAccess;
import hx2go.util.ExprHelper;
import hx2go.hxb.flags.HxbClassFieldFlag;
import hx2go.hxb.flags.HxbClassFlag;
import hx2go.util.StringConversions;
import haxe.runtime.Copy;

class FieldAccessInstance extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TField(_, FInstance(_)): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TField(e, FInstance(tp, params, cf)): {

                var mt = context.resolve(tp);
                if (mt == null) {
                    return;
                }

                var cls = switch mt {
                    case MClass(x): x;
                    case _: null;
                }

                if (cls == null) {
                    return;
                }

                if (cls.flags & HxbClassFlag.CExtern != 0) {
                    return;
                }

                var field = cls.fields.filter(f -> f.name == cf.name)[0];
                if (field == null) {
                    return;
                }

                if (field.flags & HxbClassFieldFlag.CfExtern != 0) {
                    return;
                }

                switch field.type {
                    case TFun(_): {
                        e.expr = TField(Copy.copy(e), FInstance(tp, params, {
                            name: 'VTable',
                            owner: cf.owner,
                            kind: cf.kind,
                            depth: cf.depth
                        }));

                        context.submitNode(e, true);
                    }

                    case _: null;
                }

                expr.expr = TField(e, FInstance(tp, params, {
                    name: StringConversions.nameToFieldName(cf.name),
                    owner: cf.owner,
                    kind: cf.kind,
                    depth: cf.depth
                }));
            }

            case _: null;
        }
    }

}