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
import haxe.runtime.Copy;
import hx2go.hxb.TypePath;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.Typed.HxbFieldAccess;
import hx2go.normaliser.Scope;

class ClassWriter extends WriterImpl {

    public function ensureBody(expr: HxbTypedExpr): HxbTypedExpr {
        return switch expr.expr {
            case TBlock(_): expr;
            case _: new HxbTypedExpr(TBlock([ expr ]), null, null);
        }
    }

    public function writeClass(cls: HxbClass): OutputBuffer {
        writer.context.resolve({ pack: ['go', 'haxe'], name: "HxClass", moduleName: "HxClass" });

        var buf = new OutputBuffer();

        if (cls.flags & HxbClassFlag.CExtern != 0) {
            return buf;
        }

        var fields: Map<String, HxbClassField> = [];
        var vtables: Array<String> = [];
        var current: HxbClass = cls;
        var hasInterfaces: Map<String, Bool> = [];
        var dynMethods: Array<{ inst: HxbClass, field: HxbClassField }> = [];
        var canOmitVTable: Bool = writer.context.omitVTable(cls);
        var isInterface = cls.flags & HxbClassFlag.CInterface != 0;

        buf.add('');
        buf.add('var ${StringConversions.typePathClassInstanceName(cls.path)}_RTTI = Hx_Obj_go_haxe_hxclass_CreateInstance(');
        buf.add('"${cls.path.dotPath()}",', 1);
        buf.add(')');

        if (!canOmitVTable) {
            buf.add('');
            buf.add('type ${StringConversions.typePathClassVTableName(cls.path)} interface {');

            while (current != null) {
                for (f in current.fields.filter(f -> f.kind.match(KMethod(_)) && !fields.exists(f.name))) {
                    if (f.kind.match(KMethod(MethDynamic))) {
                        dynMethods.push({ inst: current, field: f });
                    }

                    fields.set(f.name, f);
                }

                if (current?.superClass?.t == null) {
                    break;
                }

                var mod = writer.context.resolve(current.superClass.t);

                current = switch mod {
                    case MClass(x): x;
                    case _: null;
                }

                if (current == null) {
                    break;
                }

                for (iface in current.interfaces) {
                    var dot = iface.t.dotPath();
                    if (hasInterfaces.exists(dot)) {
                        continue;
                    }

                    hasInterfaces.set(dot, true);

                    vtables.push('obj.${writer.context.resolvedInstanceName(iface.t)}.VTable = obj');
                }

                vtables.push('obj.${StringConversions.typePathClassInstanceName(current.path)}.VTable = obj');
            }

            for (f in fields) {
                if (f.flags & HxbClassFieldFlag.CfExtern != 0) {
                    continue;
                }

                var vBuf = new OutputBuffer();
                var fTypes = writeFunctionArgs(f.type);

                vBuf.addInline('${StringConversions.nameToFieldName(f.name)}(');
                vBuf.addBufferInline(fTypes.buf);
                vBuf.addInline(')');

                if (fTypes.returnType != TVoid) {
                    vBuf.addInline(' ');
                    vBuf.addBufferInline(writer.types.writeHxbType(fTypes.returnType));
                }

                buf.addBuffer(vBuf, 1);
            }

            if (!isInterface) {
                buf.add('Hx_Field__RTTI() *Hx_Obj_go_haxe_hxclass', 1);
            }

            buf.add('}');
        }

        buf.add('');

        buf.add('type ${StringConversions.typePathClassInstanceName(cls.path)} struct {');

        if (cls.superClass != null) {
            buf.add(writer.context.resolvedInstanceName(cls.superClass.t), 1);
        }

        for (iface in cls.interfaces.filter(i -> !hasInterfaces.exists(i.t.dotPath()))) {
            var ifName = writer.context.resolvedInstanceName(iface.t);

            buf.add(ifName, 1);
            vtables.push('obj.${ifName}.VTable = obj');
        }

        if (!canOmitVTable) {
            buf.add('VTable ${StringConversions.typePathClassVTableName(cls.path)}', 1);
        }

        for (f in cls.fields) {
            var fRes: { name: String, type: HxbType } = switch f.kind {
                case _ if (!shouldGenVar(f.kind)): continue;
                case KVar(_): { name: StringConversions.nameToFieldName(f.name), type: f.type };
                case KMethod(MethDynamic): { name: StringConversions.nameToFieldName(f.name) + "_Dyn", type: appendThis(f.type, cls) };
                case _: continue;
            }

            var vBuf = new OutputBuffer();
            vBuf.addInline(fRes.name);
            vBuf.addInline(' ');
            vBuf.addBufferInline(writer.types.writeHxbType(fRes.type));
            buf.addBuffer(vBuf, 1);
        }

        buf.add('}');

        if (!isInterface) {
            var ctor = cls.constructor != null ? writeFunctionArgs(cls.constructor.type) : {
                buf: new OutputBuffer(),
                returnType: TVoid,
                args: []
            };

            buf.add('');
            buf.add('func ${StringConversions.typePathClassInstanceName(cls.path)}_CreateEmptyInstance() *${StringConversions.typePathClassInstanceName(cls.path)} {');
            buf.add('obj := &${StringConversions.typePathClassInstanceName(cls.path)}{}', 1);

            if (!canOmitVTable) {
                buf.add('obj.VTable = obj', 1);
            }

            for (f in dynMethods) {
                var local = Copy.copy(f.field.expr.expr);
                local.t = appendThis(local.t, f.inst);

                buf.add('obj.${StringConversions.nameToFieldName(f.field.name)}_Dyn = ${writer.exprs.writeExpr(local)}', 1);
            }

            for (v in vtables) {
                buf.add(v, 1);
            }

            buf.add('return obj', 1);
            buf.add('}');

            buf.add('');
            buf.add('func ${StringConversions.typePathClassInstanceName(cls.path)}_CreateInstance(${ctor.buf.toString()}) *${StringConversions.typePathClassInstanceName(cls.path)} {');
            buf.add('obj := ${StringConversions.typePathClassInstanceName(cls.path)}_CreateEmptyInstance()', 1);

            var fieldInits = cls.fields.filter(f -> f.kind.match(KVar(_)) && shouldGenVar(f.kind) && f.expr?.expr != null);
            var needsHxNew = cls.constructor?.expr != null || fieldInits.length > 0;

            if (needsHxNew) {
                buf.add('obj.Hx_New(${ctor.args.map(a -> a.name).join(", ")})', 1);
            }

            buf.add('return obj', 1);
            buf.add('}');

            if (needsHxNew) {
                buf.add('');
                buf.add('func (this *${StringConversions.typePathClassInstanceName(cls.path)}) Hx_New(${ctor.buf.toString()}) {');
                for (f in fieldInits) {
                    var einit = ensureBody(new HxbTypedExpr(TBinop(OpAssign, new HxbTypedExpr(TField(new HxbTypedExpr(TConst(TThis), null, null), FInstance(cls.path, [], { owner: cls.path, kind: null, name: StringConversions.nameToFieldName(f.name), depth: 0 })), null, null), Copy.copy(f.expr.expr)), null, null));
                    Normaliser.run(einit, {}, writer.context);

                    buf.addBuffer(writer.exprs.writeExpr(einit), 1);
                }
                if (cls.constructor?.expr != null) {
                    buf.addBuffer(writer.exprs.writeExpr(cls.constructor.expr.expr, true), 1);
                    buf.add('');
                }
                buf.add('}');
            }

            buf.add('');
            buf.add('func (this *${StringConversions.typePathClassInstanceName(cls.path)}) Hx_Field__RTTI() *Hx_Obj_go_haxe_hxclass {');
            buf.add('return ${StringConversions.typePathClassInstanceName(cls.path)}_RTTI', 1);
            buf.add('}');

            for (f in cls.fields.filter(f -> f.kind.match(KMethod(_)))) {
                var res = writeMemberClassField(f, cls);
                if (res.isEmpty()) {
                    continue;
                }

                buf.addBuffer(res);
            }
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

    public function appendThis(t: HxbType, c: HxbClass): HxbType {
        return switch t {
            case TFun(args, ret): TFun([({
                name: "this",
                opt: false,
                t: TInst(c.path, [])
            } : HxbFunArg)].concat(args), ret);
            case _: t;
        }
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

        if (field.expr == null) {
            return buf;
        }

        buf.add("");

        if (kind == MethDynamic) {
            buf.addInline('var ${StringConversions.typePathStaticFieldName(field.name, cls.path)} = func (');
            buf.addBufferInline(fTypes.buf);
            buf.addInline(') ');
        } else {
            buf.addInline('func ${StringConversions.typePathStaticFieldName(field.name, cls.path)}(');
            buf.addBufferInline(fTypes.buf);
            buf.addInline(') ');
        }

        if (fTypes.returnType != TVoid) {
            buf.addBufferInline(writer.types.writeHxbType(fTypes.returnType));
            buf.addInline(' ');
        }

        if (field.expr?.expr != null) buf.addBufferInline(writer.exprs.writeExpr(field.expr.expr, true))
        // allow empty block to work with non void return func
        else if (fTypes.returnType != TVoid) buf.addInline('{ panic("abstract method: ${field.name}") }');
        else buf.addInline("{}");

        return buf;
    }

    public function shouldGenVar(k: HxbFieldKind): Bool {
        return switch k {
            case KVar(AccCall, AccNormal | AccNo) | KVar(AccNormal | AccNo, AccCall): true;
            case KVar(AccCall, _) | KVar(_, AccCall): false;
            case _: true;
        }
    }
    public function writeStaticClassVar(field: HxbClassField, read: HxbVarAccess, write: HxbVarAccess, cls: HxbClass): OutputBuffer {
        var buf = new OutputBuffer();
        if (field.flags & HxbClassFieldFlag.CfExtern != 0 || cls.flags & HxbClassFlag.CExtern != 0 || !shouldGenVar(field.kind)) {
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
        var buf = new OutputBuffer();
        var fTypes = writeFunctionArgs(field.type);

        if (field.flags & HxbClassFieldFlag.CfExtern != 0 || (cls.flags & HxbClassFlag.CExtern != 0)) {
            return buf;
        }

        buf.add("");
        buf.addInline('func (this *${StringConversions.typePathClassInstanceName(cls.path)}) ${StringConversions.nameToFieldName(field.name)}(');
        buf.addBufferInline(fTypes.buf);
        buf.addInline(') ');

        if (fTypes.returnType != TVoid) {
            buf.addBufferInline(writer.types.writeHxbType(fTypes.returnType));
            buf.addInline(' ');
        }

        if (kind == MethDynamic) {
            buf.add('{');
            if (fTypes.returnType != TVoid) buf.add("return ", 1, false);
            buf.add('this.${StringConversions.nameToFieldName(field.name)}_Dyn(${["this"].concat(fTypes.args.map(a -> a.name)).join(", ")})', fTypes.returnType != TVoid ? 0 : 1);
            buf.addInline('}');
        } else {
            if (field.expr?.expr != null) buf.addBufferInline(writer.exprs.writeExpr(field.expr.expr, true))
            // allow empty block to work with non void return func
            else if (fTypes.returnType != TVoid) buf.addInline('{ panic("abstract method: ${field.name}") }');
            else buf.addInline("{}");
        }

        return buf;
    }

    public function writeMemberClassVar(field: HxbClassField, read: HxbVarAccess, write: HxbVarAccess, cls: HxbClass): OutputBuffer {
        return new OutputBuffer();
    }

}