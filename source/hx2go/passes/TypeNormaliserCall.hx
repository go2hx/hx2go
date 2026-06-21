package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.hxb.HxbClassField;
import hx2go.hxb.HxbType;

class TypeNormaliserCall extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall(_): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        switch expr.expr {
            case TCall({ t: TFun(params, ret) }, args): {
                for (idx in 0...args.length) {
                    var arg = args[idx];
                    var param  = params[idx] ?? params[params.length - 1];
                    var toType = switch param.t {
                        case TAbstract({ pack: ['haxe'], name: 'Rest' }, params): params[0];
                        case _: param.t;
                    };

                    if (toType.match(TDynamicAny | TDynamic(_)) || TypeHelper.compare(arg.t, toType)) {
                        return;
                    }

                    trace('${arg.t} -> ${toType} (${arg.expr})');
                }
            };

            case _: null;
        }
    }

}