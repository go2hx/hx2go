package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.tools.TypedExprTools;
import hx2go.util.ExprHelper;
import haxe.runtime.Copy;

class RewriteSyntaxSelect extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'Syntax', pack: ['go'] }, { name: 'select' })) }, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'Syntax', pack: ['go'] }, { name: 'select' })) }, params): {
                var template = 'select {\n';
                var args: Array<HxbTypedExpr> = [];

                function slot(e: HxbTypedExpr): String {
                    return '{${(args.push(Copy.copy(e)) - 1)}}';
                }

                for (param in params) {
                    switch unwrap(param).expr {
                        case TCall({ expr: TField(_, FStatic({ name: 'Select' }, cf)) }, cargs): {
                            switch cf.name {
                                // Select.receive(chan, f) -> `case v := <-chan: f(v)`. The
                                case "receive" if (cargs.length == 2):
                                    var fn = extractFn(cargs[1]);
                                    if (fn == null) continue;
                                    var ch = slot(cargs[0]);
                                    template += 'case _hx_recv := <- $ch:\n${slot(fn)}(_hx_recv)\n';

                                // Select.send(chan, value, f) -> `case chan <- value: f()`.
                                case "send" if (cargs.length == 3):
                                    var fn = extractFn(cargs[2]);
                                    if (fn == null) continue;
                                    var ch = slot(cargs[0]);
                                    var val = slot(cargs[1]);
                                    template += 'case $ch <- $val:\n${slot(fn)}()\n';

                                // Select.defaultCase(f) -> `default: f()`.
                                case "defaultCase" if (cargs.length == 1):
                                    var fn = extractFn(cargs[0]);
                                    if (fn == null) continue;
                                    template += 'default:\n${slot(fn)}()\n';

                                case _:
                            }
                        }
                        case _:
                    }
                }

                template += '}';

                var o = ExprHelper.createUntyped(template, args);
                expr.expr = o.expr;
                context.submitNode(expr, true);
            }

            case _: null;
        }
    }

    static function unwrap(e: HxbTypedExpr): HxbTypedExpr {
        return switch e.expr {
            case TParenthesis(inner) | TMeta(_, inner) | TCast(inner, _): unwrap(inner);
            case _: e;
        }
    }

    static function extractFn(e: HxbTypedExpr): Null<HxbTypedExpr> {
        if (e == null || e.expr == null) {
            return null;
        }

        switch e.expr {
            case TFunction(_): return e;
            case _:
        }

        var res: Null<HxbTypedExpr> = null;
        TypedExprTools.iter(e, c -> {
            if (res == null) {
                res = extractFn(c);
            }
        });
        return res;
    }

}