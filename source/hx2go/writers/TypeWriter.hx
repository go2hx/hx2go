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

        return name;
    }

    public function writeModuleType(type: TypePath): String {
        switch writer.context.resolve(type) {
            case MTypedef(info): {
                for (meta in info.meta) {
                    switch meta.name {
                        case ":go.Type":
                            return writeExternType(meta);
                    }
                }

                return StringConversions.typePathTypedefName(type);
            }

            case _:
                return "any";
        }

        return "any";
    }

    public function writeHxbType(type: HxbType): OutputBuffer {
        if (type == null) {
            return new OutputBuffer("any");
        }

        return new OutputBuffer(switch type {
            case TVoid | TAbstract({ name: "Void", pack: [] }, _): "void";
            case TInt | TAbstract({ name: "Int", pack: [] }, _) | TAbstract({ name: "GoInt", pack: ['go'] }, _): "int";
            case TAbstract({ name: "UInt", pack: [] }, _) | TAbstract({ name: "GoUInt", pack: ['go'] }, _): "uint";
            case TAbstract({ name: "Int8", pack: ['go'] }, _): "int8";
            case TAbstract({ name: "Int16", pack: ['go'] }, _): "int16";
            case TAbstract({ name: "Int32", pack: ['go'] }, _): "int32";
            case TAbstract({ name: "Int64", pack: ['go'] }, _): "int64";
            case TAbstract({ name: "UInt8", pack: ['go'] }, _): "uint8";
            case TAbstract({ name: "UInt16", pack: ['go'] }, _): "uint16";
            case TAbstract({ name: "UInt32", pack: ['go'] }, _): "uint32";
            case TAbstract({ name: "UInt64", pack: ['go'] }, _): "uint64";
            case TFloat | TAbstract({ name: "Float", pack: [] }, _): "float64";
            case TBool | TAbstract({ name: "Bool", pack: [] }, _): "bool";
            case TAbstract({ name: "Single", pack: [] }, _): "float32";
            case TAbstract({ name: "Null", pack: [] }, _): "any"; // TODO: nullable types
            case TString: "string";
            case TAbstract(tp, _) | TInst(tp, _) | TType(tp, _) | TEnum(tp, _): writeModuleType(tp);
            case _: "any";
        });
    }

}
