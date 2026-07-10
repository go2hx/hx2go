package hx2go;

import hx2go.writers.ClassWriter;
import hx2go.writers.TypeWriter;
import hx2go.writers.ExprWriter;
import hx2go.writers.EnumWriter;

class Writer {

    public var context: Context;
    public var classes: ClassWriter;
    public var types: TypeWriter;
    public var exprs: ExprWriter;
    public var enums: EnumWriter;

    public function new(context: Context) {
        this.context = context;

        // writers
        this.classes = new ClassWriter(this);
        this.types   = new TypeWriter(this);
        this.exprs   = new ExprWriter(this);
        this.enums   = new EnumWriter(this);
    }
}
