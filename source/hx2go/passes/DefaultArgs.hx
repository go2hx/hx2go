package hx2go.passes;

import hx2go.writers.TypeWriter;
import hx2go.writers.ExprWriter;
import hxb.Typed.HxbTypedExpr;
import hxb.Typed.HxbTypedExprDef;
import hxb.Typed.HxbVar;
import hxb.Typed.HxbTConstant;
import hxb.Ast.HxbBinop;
import hxb.HxbType;
import hx2go.util.ExprHelper;
import hx2go.normaliser.ExprCopy;

class DefaultArgs extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TFunction(func): func.args.filter(a -> a.value != null).length > 0;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TFunction(func):
                // reverse so arg0's guard ends up first after each unshift
                var i = func.args.length;
                while (i-- > 0) {
                    var arg = func.args[i];
                    if (arg.value == null) continue;

                    var v: HxbVar = arg.v;

					if (v.type == null) continue;

                    var notNullable = !v.type.match(TAbstract({name: "Null", pack: []}, _)) ;

                    if (notNullable) {
                        switch (expr.t) {
                            case TFun(fargs, _): 
                                if(fargs[i].name != hx2go.util.StringConversions.makeDefaultArgName(v.name)){
                                    //trace('Default argument name mismatch: ' + fargs[i].name, v.name);
                                    notNullable = false;  // must match the default argument name
                                }
                            case _: 
                        }
                    }
                    var testVarExp = new HxbTypedExpr(TLocal(v), v.type, v.pos);
                    var testVarOp = OpEq;
                    if (notNullable) {
                            testVarExp = new HxbTypedExpr(TIdent(hx2go.util.StringConversions.makeDefaultArgName(v.name)), TDynamic(v.type), null);  
                            testVarOp = OpNotEq;
                    }
                    var cond = new HxbTypedExpr(
                        TBinop(
                            testVarOp,
                            testVarExp,
                            new HxbTypedExpr(TConst(TNull), v.type, v.pos)
                        ),
                        TBool,
                        v.pos
                    );

                    var assignValue = ExprHelper.createCast(arg.value, v.type); 
                    if (notNullable) {
                        assignValue = ExprHelper.createCast(testVarExp, v.type);
                    }

                    var assign = new HxbTypedExpr(
                        TBinop(
                            OpAssign,
                            new HxbTypedExpr(TLocal(v), v.type, v.pos),
                            assignValue
                        ),
                        v.type,
                        v.pos
                    );
                    var body = new HxbTypedExpr(TBlock([ assign ]), TVoid, v.pos);
                    var guard = new HxbTypedExpr(TIf(cond, body, null), TVoid, v.pos);

                    ExprHelper.addExprToBlock(func.expr, guard);
                    context.submitNode(guard, true); // register into remaining passes

                    if (notNullable) {
                            var realVarDeclExp = new HxbTypedExpr(TVar(v, arg.value), v.type, v.pos);
                            ExprHelper.addExprToBlock(func.expr, realVarDeclExp);
                            context.submitNode(realVarDeclExp, true); // register into remaining passes
                    }

                }
            default:
        }
    }
}