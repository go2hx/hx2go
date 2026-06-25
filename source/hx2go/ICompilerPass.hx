package hx2go;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;

interface ICompilerPass {
    public function match(expr: HxbTypedExpr): Bool;
    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void;
}
