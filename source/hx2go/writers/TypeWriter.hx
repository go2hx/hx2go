package hx2go.writers;

import hx2go.util.OutputBuffer;
import hx2go.hxb.HxbModuleType;

class TypeWriter extends WriterImpl {

    public function writeModuleType(type: HxbModuleType): OutputBuffer {
        return switch type {
            case MClass(v): writer.classes.writeClass(v);
            case _: new OutputBuffer();
        }
    }

}
