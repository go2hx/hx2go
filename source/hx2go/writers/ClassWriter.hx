package hx2go.writers;

import hx2go.util.OutputBuffer;
import hx2go.hxb.HxbModuleType.HxbClass;
import hx2go.hxb.HxbClassField;
import hx2go.util.StringConversions;
import hx2go.hxb.HxbType;
import hx2go.hxb.flags.HxbClassFieldFlag;
import hx2go.hxb.flags.HxbClassFlag;

class ClassWriter extends WriterImpl {

    public function writeClass(cls: HxbClass): OutputBuffer {
        var buf = new OutputBuffer();

        if (cls.flags & HxbClassFlag.CExtern != 0) {
            return buf;
        }

        for (f in cls.statics) {
            buf.addBufferInline(writeStaticClassField(f, cls));
        }

        for (f in cls.fields) {
            buf.addBufferInline(writeMemberClassField(f, cls));
        }

        return buf;
    }

    public function writeStaticClassField(field: HxbClassField, cls: HxbClass): OutputBuffer {
        if (field.flags & HxbClassFieldFlag.CfExtern != 0) {
            return new OutputBuffer();
        }

        return switch field.kind {
            case KMethod(kind): writeStaticClassFunction(field, kind, cls);
            case KVar(read, write): writeStaticClassVar(field, read, write, cls);
        }
    }

    public function writeMemberClassField(field: HxbClassField, cls: HxbClass): OutputBuffer {
        return switch field.kind {
            case KMethod(kind): writeMemberClassFunction(field, kind, cls);
            case KVar(read, write): writeMemberClassVar(field, read, write, cls);
        }
    }

    public function writeFunctionArgs(type: HxbType): { buf: OutputBuffer, returnType: HxbType } {
        var buf = new OutputBuffer();
        var ret: HxbType = TVoid;

        switch type {
            case TFun(args, returnType):
                for (idx in 0...args.length) {
                    var arg = args[idx];
                    buf.addInline('${arg.name} ${writer.types.writeHxbType(arg.t)}'); // TODO: optional args

                    if (idx < args.length - 1) {
                        buf.addInline(', ');
                    }
                }

                ret = returnType;

            case _: null;
        }

        return { buf: buf, returnType: ret };
    }

    public function writeStaticClassFunction(field: HxbClassField, kind: HxbMethodKind, cls: HxbClass): OutputBuffer {
        var buf = new OutputBuffer();
        var fTypes = writeFunctionArgs(field.type);

        if (field.flags & HxbClassFieldFlag.CfExtern != 0 || (cls.flags & HxbClassFlag.CExtern != 0)) {
            return buf;
        }

        buf.add("");
        buf.addInline('func ${StringConversions.typePathStaticFieldName(field.name, cls.path)}(');
        buf.addBufferInline(fTypes.buf);
        buf.addInline(') ');

        if (fTypes.returnType != TVoid) {
            buf.addBufferInline(writer.types.writeHxbType(fTypes.returnType));
            buf.addInline(' ');
        }

        if (field.expr?.expr != null) buf.addBuffer(writer.exprs.writeExpr(field.expr.expr))
        else buf.add("{}");

        return buf;
    }

    public function writeStaticClassVar(field: HxbClassField, read: HxbVarAccess, write: HxbVarAccess, cls: HxbClass): OutputBuffer {
        return new OutputBuffer();
    }

    public function writeMemberClassFunction(field: HxbClassField, kind: HxbMethodKind, cls: HxbClass): OutputBuffer {
        return new OutputBuffer();
    }

    public function writeMemberClassVar(field: HxbClassField, read: HxbVarAccess, write: HxbVarAccess, cls: HxbClass): OutputBuffer {
        return new OutputBuffer();
    }

}
