package hx2go.writers;

import hx2go.util.OutputBuffer;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.HxbType;

class TypeWriter extends WriterImpl {

    public function writeModuleTypeDecl(type: HxbModuleType): OutputBuffer {
        return switch type {
            case MClass(v): writer.classes.writeClass(v);
            case _: new OutputBuffer();
        }
    }

    public function writeHxbType(type: HxbType): OutputBuffer {
        if (type == null) {
            return new OutputBuffer("any");
        }

        return new OutputBuffer(switch type {
            case TVoid | TAbstract({ moduleName: "Void", name: "Void", pack: [] }, _): "void";
            case TInt | TAbstract({ moduleName: "Int", name: "Int", pack: [] }, _): "int";
            case TFloat | TAbstract({ moduleName: "Float", name: "Float", pack: [] }, _): "float64";
            case TBool | TAbstract({ moduleName: "Bool", name: "Bool", pack: [] }, _): "bool";
            case TAbstract({ moduleName: "Single", name: "Single", pack: [] }, _): "float32";
            case TString: "string";
            case _: "any";
        });
    }

}
