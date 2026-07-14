package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.Typed.HxbFieldAccess;
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
                   return '{${(args.push(e) - 1)}}';
               }

               for (param in params) {
                switch param.expr {
                    case TCall({expr: TField(_, FStatic(_, cf))}, params2):
                        switch cf.name {
                            case "receive" if (params2.length == 2):
                                switch params2[1].expr {
                                    case TFunction({args: _, t: _, expr: fe}):
                                        var ch = slot(Copy.copy(params2[0]));
                                        var body = slot(Copy.copy(fe));
                                        var vars = "value := ";
                                        template += 'case $vars<- $ch:\n$body\n';
                                    default:
                                }
                            case "send" if (params2.length == 2):
                                
                            case "defaultCase" if (params2.length == 0):
                                switch params2[1].expr {
                                    case TFunction({args: _, t: _, expr: fe}):
                                        var body = slot(Copy.copy(fe));
                                        template += 'default:\n$body\n';
                                    default:
                                }
                        }
                    default:
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

}