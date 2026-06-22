package hx2go.writers;

import hx2go.util.OutputBuffer;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.HxbType;
import hx2go.hxb.TypePath;
import hx2go.util.StringConversions;
import hx2go.hxb.Ast.HxbMetaEntry;
import hx2go.hxb.Ast.HxbExpr;
import hx2go.util.ObjectFieldHelper;

class TypeWriter extends WriterImpl {

    public function writeModuleTypeDecl(type: HxbModuleType): OutputBuffer {
        return switch type {
            case MClass(v): writer.classes.writeClass(v);
            case _: new OutputBuffer();
        }
    }

    public function writeExternType(meta: HxbMetaEntry): String {
        var name = "any";

        switch meta.params[0]?.expr {
            case EObjectDecl(options): for (opt in options) {
                switch opt.name {
                    case "name":
                        name = ObjectFieldHelper.readString(opt);
                }
            }

            case _: null;
        }

        return name; // TODO: import used module
    }

    public function writeModuleType(type: TypePath): String {
        var mod = writer.context.resolve(type);
        if (mod == null ){
            return "any";
        }

        var builtin: Null<String> = switch type {
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
            case { name: "Null", pack: [] }: "any"; // TODO: nullable types
            case { name: "String", pack: [] }: "string";
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

                return StringConversions.typePathTypedefName(type);
            }

            case MClass({ meta: meta }): {
                for (m in meta) {
                    switch m.name {
                        case ":go.Type": return writeExternType(m);
                    }
                }

                return StringConversions.typePathClassInstanceName(type);
            }

            case MEnum({ meta: meta }): {
                for (m in meta) {
                    switch m.name {
                        case ":go.Type": return writeExternType(m);
                    }
                }

                return StringConversions.typePathEnumName(type);
            }

            case MAbstract({ meta: meta }): {
                for (m in meta) {
                    switch m.name {
                        case ":go.Type": return writeExternType(m);
                    }
                }

                return StringConversions.typePathAbstractName(type);
            }
        }

        return "any";
    }

    public function writeHxbType(type: HxbType): OutputBuffer {
        if (type == null) {
            return new OutputBuffer("any");
        }

        return new OutputBuffer(switch type {
            case TVoid: "void";
            case TInt: "int";
            case TFloat: "float64";
            case TBool: "bool";
            case TString: "string";
            case TAnon(anon): 'struct { ${anon.fields.map(f -> '${StringConversions.nameToFieldName(f.name)} ${writeHxbType(f.type)}').join('; ') } }'; // TODO: anon.stauts, aka openness?
            case TAbstract(tp, _) | TInst(tp, _) | TType(tp, _) | TEnum(tp, _): writeModuleType(tp);
            case TFun(params, ret): 'func(${params.map(p -> writeHxbType(p.t)).join(', ')})${ret == TVoid ? '' : ' ${writeHxbType(ret)}'}';
            case _: "any";
        });
    }

}
