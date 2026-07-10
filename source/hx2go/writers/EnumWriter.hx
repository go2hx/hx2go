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

class EnumWriter extends WriterImpl {

    public function writeEnum(e: HxbEnum): OutputBuffer {
        writer.context.resolve({ pack: ['go', 'haxe'], name: "HxEnum", moduleName: "HxEnum" });
        writer.context.resolve({ pack: ['go', 'haxe'], name: "HxEnumValue", moduleName: "HxEnumValue" });

        var buf = new OutputBuffer();

        buf.add('');
        buf.add('type ${StringConversions.typePathEnumName(e.path)} interface {');
        buf.add('Hx_Obj_VTable_go_haxe__hxenumvalue__hxenumvalue', 1);
        buf.add('M_${StringConversions.typePathEnumName(e.path)}()', 1);
        buf.add('}');

        var counts: Map<String, Int> = [];
        for (cs in e.constructors) {
            var ctorName = '${StringConversions.typePathEnumName(e.path)}_${cs.name}';
            var ctorArgCount = 0;
            buf.add('');

            switch cs.type {
                case TFun(params, _): {
                    buf.add('type ${ctorName} struct {');
                    for (p in params) {
                        buf.add('${StringConversions.nameToFieldName(p.name)} ${writer.types.writeHxbType(p.t)}', 1);
                    }
                    buf.add('}');

                    ctorArgCount = params.length;
                }

                case _: buf.add('type ${ctorName} struct {}');
            }

            buf.add('');
            buf.add('func (${ctorName}) M_${StringConversions.typePathEnumName(e.path)}() {}');
            buf.add('func (${ctorName}) Hx_Field_enumIndex() int { return ${cs.index} }');
            buf.add('func (${ctorName}) Hx_Field_enumType() *Hx_Obj_go_haxe_hxenum { return ${StringConversions.typePathEnumName(e.path)}_Desc }');
            buf.add('func (${ctorName}) Hx_Field_enumParams() any { return &([]any{ }) }');

            counts[cs.name] = ctorArgCount;
        }

        buf.add('');
        buf.add('var ${StringConversions.typePathEnumName(e.path)}_Desc = Hx_Obj_go_haxe_hxenum_CreateInstance(');
        buf.add('"${e.path.toString()}",', 1);
        buf.add('&([]string{ ${e.names.map(n -> '"$n"').join(", ")} }),', 1);
        buf.add('&([]int{ ${e.names.map(n -> counts[n]).join(", ") } }),', 1);
        buf.add('func (index int, params any) Hx_Obj_VTable_go_haxe__hxenumvalue__hxenumvalue {', 1);
        buf.add('return nil', 2);
        buf.add('},', 1);
        buf.add(')');

        return buf;
    }

}
