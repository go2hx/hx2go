package hx2go;

import hxb.Typed.HxbTypedExpr;

interface ICompilerPass {
    public function match(expr: HxbTypedExpr): Bool;
    public function execute(expr: HxbTypedExpr): Void;
}
