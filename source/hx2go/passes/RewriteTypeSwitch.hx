package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.Typed.HxbFieldAccess;
import hx2go.util.ExprHelper;
import haxe.runtime.Copy;
import hx2go.util.OutputBuffer;
import hx2go.util.StringConversions;
import hx2go.hxb.HxbType;
import hx2go.hxb.Typed.HxbVar;

class RewriteTypeSwitch extends CompilerPass {

    private var typeSwitchId: Int = 0;

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TSwitch({ expr: TParenthesis({ expr: TCall({ expr: TField(_, FStatic({ name: 'Syntax', pack: ['go'] }, { name: 'type' })) }, params) }) }, _, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TSwitch({ expr: TParenthesis({ expr: TCall({ expr: TField(_, FStatic({ name: 'Syntax', pack: ['go'] }, { name: 'type' })) }, params) }) }, cases, edef): {
                var buf = new OutputBuffer(); // big hack coming up
                var arr = [ params[0] ];

                buf.add('switch {0}.(type) {');

                for (c in cases) {
                    switch c.patterns[0].expr {
                        case TTypeExpr(ref): {
                            buf.add('case {${arr.length}}:', 1);
                            arr.push(c.patterns[0]);
                            buf.add('{${arr.length}}', 2);
                            arr.push(c.expr);
                        }

                        case _: throw 'not a valid pattern for type switch at ${c.expr?.pos}';
                    }
                }

                if (edef != null) {
                    buf.add('default:', 1);
                    buf.add('{${arr.length}}', 2);
                    arr.push(edef);
                }

                buf.add('}');

                var o = ExprHelper.createUntyped(buf.toString(), arr);
                expr.expr = o.expr;
            };

            case _: null;
        }
    }

}