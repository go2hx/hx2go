package hx2go;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;

interface ICompilerPass {
    public function match(expr: HxbTypedExpr): Bool;
    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void;
}
