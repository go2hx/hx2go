package hx2go.writers;

import hx2go.util.OutputBuffer;
import hx2go.hxb.HxbModuleType.HxbClass;
import hx2go.hxb.HxbClassField;
import hx2go.util.StringConversions;
import hx2go.hxb.HxbType;
import hx2go.hxb.flags.HxbClassFieldFlag;
import hx2go.hxb.flags.HxbClassFlag;
import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.normaliser.Normaliser;
import hx2go.normaliser.Normaliser.Normaliser.run;

class ClassWriter extends WriterImpl {

    public function ensureBody(expr: HxbTypedExpr): HxbTypedExpr {
        return switch expr.expr {
            case TBlock(_): expr;
            case _: new HxbTypedExpr(TBlock([ expr ]), null, null);
        }
    }

    public function writeClass(cls: HxbClass): OutputBuffer {
        var buf = new OutputBuffer();

        if (cls.flags & HxbClassFlag.CExtern != 0) {
            return buf;
        }

        buf.add('');
        buf.add('type ${StringConversions.typePathClassVTableName(cls.path)} interface {');

        for (f in cls.fields.filter(f -> f.kind.match(KMethod(_)))) {
            var vBuf = new OutputBuffer();
            var fTypes = writeFunctionArgs(f.type);

            vBuf.addInline('${StringConversions.nameToFieldName(f.name)}(');
            vBuf.addBufferInline(fTypes.buf);
            vBuf.addInline(') ');

            if (fTypes.returnType != TVoid) {
                vBuf.addBufferInline(writer.types.writeHxbType(fTypes.returnType));
                vBuf.addInline(' ');
            }

            buf.addBuffer(vBuf, 1);
        }

        buf.add('}');
        buf.add('');

        buf.add('type ${StringConversions.typePathClassInstanceName(cls.path)} struct {');
        buf.add('VTable ${StringConversions.typePathClassVTableName(cls.path)}', 1);

        for (f in cls.fields.filter(f -> f.kind.match(KVar(_)))) {
            var vBuf = new OutputBuffer();
            vBuf.addInline(StringConversions.nameToFieldName(f.name));
            vBuf.addInline(' ');
            vBuf.addBufferInline(writer.types.writeHxbType(f.type));
            buf.addBuffer(vBuf, 1);
        }

        buf.add('}');

        var ctor = cls.constructor != null ? writeFunctionArgs(cls.constructor.type) : {
            buf: new OutputBuffer(),
            returnType: TVoid,
            args: []
        };

        buf.add('');
        buf.add('func ${StringConversions.typePathClassInstanceName(cls.path)}_CreateEmptyInstance() *${StringConversions.typePathClassInstanceName(cls.path)} {');
        buf.add('obj := &${StringConversions.typePathClassInstanceName(cls.path)}{}', 1);
        buf.add('obj.VTable = obj', 1);
        buf.add('return obj', 1);
        buf.add('}');

        buf.add('');
        buf.add('func ${StringConversions.typePathClassInstanceName(cls.path)}_CreateInstance(${ctor.buf.toString()}) *${StringConversions.typePathClassInstanceName(cls.path)} {');
        buf.add('obj := ${StringConversions.typePathClassInstanceName(cls.path)}_CreateEmptyInstance()', 1);

        if (cls.constructor != null) {
            buf.add('obj.Hx_New(${ctor.args.map(a -> a.name).join(", ")})', 1);
        }

        buf.add('return obj', 1);
        buf.add('}');

        if (cls.constructor != null) {
            buf.add('');
            buf.addInline('func (this *${StringConversions.typePathClassInstanceName(cls.path)}) Hx_New(${ctor.buf.toString()}) ');
            buf.addBufferInline(writer.exprs.writeExpr(cls.constructor.expr.expr, true));
            buf.add('');
        }

        for (f in cls.statics) {
            var res = writeStaticClassField(f, cls);
            if (res.isEmpty()) {
                continue;
            }

            buf.addBuffer(res);
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

    public function writeFunctionArgs(type: HxbType): { buf: OutputBuffer, returnType: HxbType, args: Array<HxbFunArg> } {
        var buf = new OutputBuffer();
        var fArgs: Array<HxbFunArg> = [];
        var ret: HxbType = TVoid;

        switch type {
            case TFun(args, returnType):
                for (idx in 0...args.length) {
                    var arg = args[idx];
                    buf.addInline('${arg.name} ${writer.types.writeHxbType(arg.t)}'); // TODO: optional args

                    if (idx < args.length - 1) {
                        buf.addInline(', ');
                    }

                    fArgs.push(arg);
                }

                ret = returnType;

            case _: null;
        }

        return { buf: buf, returnType: ret, args: fArgs };
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

        if (field.expr?.expr != null) buf.addBufferInline(writer.exprs.writeExpr(field.expr.expr, true))
        else buf.addInline("{}");

        return buf;
    }

    public function writeStaticClassVar(field: HxbClassField, read: HxbVarAccess, write: HxbVarAccess, cls: HxbClass): OutputBuffer {
        var buf = new OutputBuffer();

        if (field.flags & HxbClassFieldFlag.CfExtern != 0 || cls.flags & HxbClassFlag.CExtern != 0 || field.kind.match(KVar(AccCall, _)) || field.kind.match(KVar(_, AccCall))) {
            return buf;
        }

        buf.add("");
        buf.addInline('var ${StringConversions.typePathStaticFieldName(field.name, cls.path)} ${writer.types.writeHxbType(field.type)}');

        if (field.expr?.expr != null) {
            var initName = 'Hx_Init_${StringConversions.typePathStaticFieldName(field.name, cls.path)}';
            var initExpr = ensureBody(new HxbTypedExpr(TReturn(field.expr.expr), null, null));
            Normaliser.run(initExpr, {}, writer.context); // TODO: bit hacky, will do for now.

            buf.add(' = ${initName}()');
            buf.addInline('func ${initName}() ${writer.types.writeHxbType(field.type)} ');
            buf.addBufferInline(writer.exprs.writeExpr(initExpr, true));
        } else buf.addInline("");

        return buf;
    }

    public function writeMemberClassFunction(field: HxbClassField, kind: HxbMethodKind, cls: HxbClass): OutputBuffer {
        return new OutputBuffer();
    }

    public function writeMemberClassVar(field: HxbClassField, read: HxbVarAccess, write: HxbVarAccess, cls: HxbClass): OutputBuffer {
        return new OutputBuffer();
    }

}
