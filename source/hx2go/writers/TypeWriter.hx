package hx2go.writers;

import hx2go.util.OutputBuffer;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.HxbType;
import hx2go.hxb.TypePath;
import hx2go.util.StringConversions;
import hx2go.hxb.Ast.HxbMetaEntry;
import hx2go.hxb.Ast.HxbExpr;
import hx2go.util.ObjectFieldHelper;
import hx2go.util.TypeHelper;

class TypeWriter extends WriterImpl {

    public function writeModuleTypeDecl(type: HxbModuleType): OutputBuffer {
        return switch type {
            case MClass(v): writer.classes.writeClass(v);
            case MTypedef(t): writer.types.writeTypedef(t);
            case MEnum(e): writer.enums.writeEnum(e);
            case _: new OutputBuffer();
        }
    }

    public function writeTypedef(t: HxbTypedef): OutputBuffer {
        var buf = new OutputBuffer();

        for (m in t.meta) {
            if (m.name == ":go.Type") return buf; // skip externs
        }

        buf.add("");
        buf.add('type ${StringConversions.typePathTypedefName(t.path)} = ${writeHxbType(t.type)}');

        return buf;
    }

    public function writeExternType(meta: HxbMetaEntry): String {
        var name = "any";
        var hasInstanceName: Bool = false;

        switch meta.params[0]?.expr {
            case EObjectDecl(options): for (opt in options) {
                switch opt.name {
                    case "name" if (!hasInstanceName):
                        name = ObjectFieldHelper.readString(opt);

                    case "instanceName":
                        name = ObjectFieldHelper.readString(opt);
                        hasInstanceName = true;
                }
            }

            case _: null;
        }

        return name; // TODO: import used module
    }

    public function writeModuleType(type: TypePath): String {
        var mod = writer.context.resolve(type);
        if (mod == null) {
            return '*' + StringConversions.typePathClassInstanceName(type);
        }

        var tp = StringConversions.moduleTypeGetTypePath(mod);
        var builtin: Null<String> = switch type {
            case { name: "EnumValue", pack: [] }: "Hx_Obj_VTable_go_haxe__hxenumvalue__hxenumvalue";
            case { name: "Enum", pack: [] }: "*Hx_Obj_go_haxe_hxenum";
            case { name: "Void", pack: [] }: "void";
            case { name: "Int", pack: [] } | { name: "GoInt", pack: ['go'] }: "int";
            case { name: "UInt", pack: [] } | { name: "GoUInt", pack: ['go'] }: "uint";
            case { name: "Int8", pack: ['go'] }: "int8";
            case { name: "Int16", pack: ['go'] }: "int16";
            case { name: "Int32", pack: ['go'] }: "int32";
            case { name: "Int64", pack: ['go'] }: "int64";
            case { name: "UInt8", pack: ['go'] }: "uint8";
            case { name: "UInt16", pack: ['go'] }: "uint16";
            case { name: "UInt32", pack: ['go'] }: "uint32";
            case { name: "UInt64", pack: ['go'] }: "uint64";
            case { name: "Float", pack: [] } | { name: "Float64", pack: ['go'] }: "float64";
            case { name: "Bool", pack: [] }: "bool";
            case { name: "Single", pack: [] } | { name: "Float32", pack: ['go'] }: "float32";
            case { name: "String", pack: [] }: "string";
            case { name: "Byte", pack: ['go'] }: "byte";
            case { name: "Class", pack: [] }: "*Hx_Obj_go_haxe_hxclass";
            case { name: "Rest", pack: ['haxe'] }: "any";
            case _: null;
        }

        if (builtin != null) {
            return builtin;
        }

        switch mod {
            case MTypedef({ meta: meta }): {
                for (m in meta) {
                    switch m.name {
                        case ":go.Type": return writeExternType(m);
                    }
                }

                return StringConversions.typePathTypedefName(tp);
            }

            case MClass({ meta: meta }): {
                for (m in meta) {
                    switch m.name {
                        case ":go.Type": return writeExternType(m);
                    }
                }

                return '*' + StringConversions.typePathClassInstanceName(tp);
            }

            case MEnum({ meta: meta }): {
                for (m in meta) {
                    switch m.name {
                        case ":go.Type": return writeExternType(m);
                    }
                }

                return StringConversions.typePathEnumName(tp);
            }

            case MAbstract({ meta: meta }): {
                for (m in meta) {
                    switch m.name {
                        case ":go.Type": return writeExternType(m);
                    }
                }

                return StringConversions.typePathAbstractName(tp);
            }
        }

        return "any";
    }

    public function writeHxbType(type: HxbType): OutputBuffer {
        if (type == null) {
            return new OutputBuffer("any");
        }

        var norm = writer.context.normalize(type);
        var buf = new OutputBuffer(switch norm {
            case TVoid: "void";
            case TInt: "int";
            case TFloat: "float64";
            case TBool: "bool";
            case TString: "string";
            case TAbstract({ pack: ['go'], name: 'Map' }, params): 'map[${writeHxbType(params[0])}]${writeHxbType(params[1])}';
            case TAbstract({ pack: ['go'], name: 'Pointer' }, params): '*${writeHxbType(params[0])}';
            case TAbstract({ pack: ['go'], name: 'Result'}, params) | TEnum({ pack: ['go'], name: 'ResultKind'}, params): 'struct { Error ${writeHxbType(params[1])}; Result ${writeHxbType(params[0])} }';
            case TType({ pack: ['go'], name: 'Tuple'}, [TAnon(anon)]): 'struct { ${anon.fields.map(f -> '${StringConversions.toPascalCase(f.name)} ${writeHxbType(f.type)}').join('; ')} }';
            case TAbstract({ pack: [], name: 'Null' }, params): 'struct { Value ${writeHxbType(params[0])}; Valid bool }';
            case TInst({ pack: [], name: 'Array' }, params): '*[]${writeHxbType(params[0])}';
            case TAbstract({ pack: ['go'], name: 'Slice' }, params): '[]${writeHxbType(params[0])}';
            case TAbstract({ pack: ['go'], name: 'Chan' }, params): 'chan ${writeHxbType(params[0])}';
            case TAbstract({ pack: ['go'], name: 'SendChan' }, params): 'chan<- ${writeHxbType(params[0])}';
            case TAbstract({ pack: ['go'], name: 'ReceiveChan' }, params): '<-chan ${writeHxbType(params[0])}';
            case TAnon(anon): 'any'; // TODO: anon.stauts, aka openness?
            case TAbstract(tp, _) | TInst(tp, _) | TType(tp, _) | TEnum(tp, _): writeModuleType(tp);
            case TFun(params, ret): 'func(${params.map(p -> writeHxbType(p.t)).join(', ')})${ret == TVoid ? '' : ' ${writeHxbType(ret)}'}';
            case TEnumStatic(_): "*Hx_Obj_go_haxe_hxenum";
            case TClassStatic(_): "*Hx_Obj_go_haxe_hxclass";
            case _: "any";
        });

        return buf;
    }

}
