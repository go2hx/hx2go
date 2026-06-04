package hx2go;

import haxe.macro.Type.TypedExpr;

interface ICompilerPass {
    public function match(expr: TypedExpr): Bool;
    public function execute(expr: TypedExpr): TypedExpr;
}
