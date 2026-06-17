package hx2go.writers;

import hx2go.util.OutputBuffer;
import hx2go.hxb.HxbModuleType.HxbClass;
import hx2go.hxb.HxbClassField;
import hx2go.util.StringConversions;

class ClassWriter extends WriterImpl {

    public function writeClass(cls: HxbClass): OutputBuffer {
        var buf = new OutputBuffer();

        for (f in cls.statics) {
            buf.addBufferInline(writeStaticClassField(f, cls));
        }

        for (f in cls.fields) {
            buf.addBufferInline(writeMemberClassField(f, cls));
        }

        return buf;
    }

    public function writeStaticClassField(field: HxbClassField, cls: HxbClass): OutputBuffer {
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

    public function writeStaticClassFunction(field: HxbClassField, kind: HxbMethodKind, cls: HxbClass): OutputBuffer {
        var buf = new OutputBuffer();

        buf.add("");
        buf.addInline('func ${StringConversions.typePathFieldName(field.name, cls.path)}() ');

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
