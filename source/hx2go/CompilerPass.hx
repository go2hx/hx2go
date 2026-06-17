package hx2go;

abstract class CompilerPass implements ICompilerPass {

    private var context: Context;

    public function new(context: Context) {
        this.context = context;
    }

}
