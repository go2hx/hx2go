package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.tools.TypedExprTools;
import hx2go.util.ExprHelper;

class RewriteSyntaxTypeSwitch extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'Syntax', pack: ['go'] }, { name: 'typeSwitch' })) }, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'Syntax', pack: ['go'] }, { name: 'typeSwitch' })) }, params): {
                var value = params.shift();
                var args: Array<HxbTypedExpr> = [hx2go.normaliser.ExprCopy.copy(value)];

                // slot creates {index} added into template, and then template passes in the args which get pulled by {index}
                function slot(e: HxbTypedExpr): String {
                    return '{${(args.push(hx2go.normaliser.ExprCopy.copy(e)) - 1)}}';
                }

                var template = 'switch _hx_arg := {0}.(type) {\n';

                for (param in params) {
                    switch unwrap(param).expr {
                        case TCall({ expr: TField(_, FStatic({ name: 'TypeSwitch' }, cf)) }, cargs): {
                            switch cf.name {
                                case "typeCase" if (cargs.length == 1):
                                    var fn = extractFn(cargs[0]);
                                    if (fn == null) continue;
                                    template += 'case ${caseType(fn)}:\n${caseBody(fn, slot)}';

                                case "defaultCase" if (cargs.length == 1):
                                    var fn = extractFn(cargs[0]);
                                    if (fn == null) continue;
                                    template += 'default:\n${caseBody(fn, slot)}';

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

    function caseBody(f: HxbTypedExpr, slot: HxbTypedExpr -> String): String {
        var name = argName(f);
        var head = if (name != null) {
            '$name := _hx_arg\n_ = $name\n';
        }else{
            '_ = _hx_arg\n';
        }
        var expr = switch f.expr {
            case TFunction(f):
                f.expr;
            default:
                f;
        }
        return head + '${slot(f)}(_hx_arg)\n';
    }

    function caseType(fn: HxbTypedExpr): String {
        return switch fn.expr {
            case TFunction(tf) if (tf.args.length == 1 && tf.args[0].v.type != null):
                context.getWriter().types.writeHxbType(tf.args[0].v.type).toString();
            case _: "any";
        }
    }

    static function argName(f: HxbTypedExpr): Null<String> {
        return switch f.expr {
            case TFunction(tf) if (tf.args.length == 1 && tf.args[0].v.name != "_"): tf.args[0].v.name;
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
