package hx2go.writers;

import hx2go.util.OutputBuffer;
import hxb.HxbModuleType;
import hxb.HxbType;
import hxb.TypePath;
import hx2go.util.StringConversions;
import hxb.Ast.HxbMetaEntry;
import hxb.Ast.HxbExpr;
import hx2go.util.ObjectFieldHelper;
import hx2go.util.TypeHelper;
import hxb.Typed.HxbTypedExpr;
import hx2go.util.ExprHelper;
import hxb.Typed.HxbTypedExprDef;

#if go
import go.Map;
#end

class EnumWriter extends WriterImpl {

    // NOTE: temporary, want to add a one-shot transformExpr function to Context for these cases...
    public function makeDynamicCall(t: HxbType, inner: HxbTypedExpr, call: String): HxbTypedExpr {
        var o = ExprHelper.createCast( // NOTE: extra cast if it is a specialized type (so not int, but int8 for example)
            ExprHelper.createCallStatic(
                writer.context,
                {
                    name: 'HxDynamic',
                    moduleName: 'HxDynamic',
                    pack: ['go', 'haxe']
                },
                call,
                [inner]
            )
            , t);

        return o;
    }

    // NOTE: temporary, want to add a one-shot transformExpr function to Context for these cases...
    public function dynamicTo(t: HxbType, e: HxbTypedExpr): String {
        var ti = switch writer.context.normalize(t) {
            case TAbstract({ name: "Null", pack: [] }, [inner]): { inner: inner, nullable: true };
            case _: { inner: t, nullable: false };
        }

        var ce = switch ti.inner {
            case TAbstract({ name: "Int64", pack: [] }, _): makeDynamicCall(ti.inner, e, 'toInt64');
            case TInt: makeDynamicCall(ti.inner, e, 'toInt');
            case TFloat: makeDynamicCall(ti.inner, e, 'toFloat');
            case TBool: makeDynamicCall(ti.inner, e, 'toBool');
            case TString: makeDynamicCall(ti.inner, e, 'toString');
            case _: ExprHelper.createUntyped('{0}.(${writer.types.writeHxbType(t)})', [e]);
        }

        if (ti.nullable) {
            ce = ExprHelper.createUntyped('${writer.types.writeHxbType(t)}{ Value: {0}, Valid: {1} != nil }', [ce, e]);
        }

        return writer.exprs.writeExpr(ce).toString();
    }

    public function writeEnum(e: HxbEnum): OutputBuffer {
        writer.context.resolve({ pack: ['go', 'haxe'], name: "HxEnum", moduleName: "HxEnum" });
        writer.context.resolve({ pack: ['go', 'haxe'], name: "HxEnumValue", moduleName: "HxEnumValue" });

        var buf = new OutputBuffer();

        buf.add('');
        buf.add('type ${StringConversions.typePathEnumName(e.path)} interface {');
        buf.add('Hx_Obj_VTable_go_haxe__hxenumvalue__hxenumvalue', 1);
        buf.add('M_${StringConversions.typePathEnumName(e.path)}()', 1);
        buf.add('}');

        var counts: Map<String, Int> = new Map();
        var types: Map<String, Array<HxbType>> = new Map();

        for (cs in e.constructors) {
            var ctorName = '${StringConversions.typePathEnumName(e.path)}_${cs.name}';
            var ctorArgCount = 0;
            var ctorArgVars: Array<String> = [];
            var ctorTypes: Array<HxbType> = [];
            buf.add('');

            switch cs.type {
                case TFun(params, _): {
                    buf.add('type ${ctorName} struct {');
                    for (p in params) {
                        var pName = StringConversions.nameToFieldName(p.name);
                        buf.add('${pName} ${writer.types.writeHxbType(p.t)}', 1);
                        ctorArgVars.push(pName);
                        ctorTypes.push(p.t);
                    }
                    buf.add('}');

                    ctorArgCount = params.length;
                }

                case _: buf.add('type ${ctorName} struct {}');
            }

            buf.add('');
            buf.add('func (this ${ctorName}) Hx_Field__RTTI() *Hx_Obj_go_haxe_hxclass { return nil }'); // TODO: Do we need this to not be nil?
            buf.add('func (this ${ctorName}) M_${StringConversions.typePathEnumName(e.path)}() {}');
            buf.add('func (this ${ctorName}) Hx_Field_enumIndex() int32 { return ${cs.index} }');
            buf.add('func (this ${ctorName}) Hx_Field_enumType() *Hx_Obj_go_haxe_hxenum { return ${StringConversions.typePathEnumName(e.path)}_RTTI }');
            buf.add('func (this ${ctorName}) Hx_Field_enumParams() any { return &([]any{ ${ctorArgCount == 0 ? "" : ctorArgVars.map(v -> 'any(this.$v)').join(", ") + " " }}) }');
            buf.add('func (this ${ctorName}) Hx_Field_enumParameter(index int32) any {');
            buf.add('switch index {', 1);

            for (i in 0...ctorArgCount) {
                buf.add('case ${i}: return any(this.${ctorArgVars[i]})', 2);
            }

            buf.add('default: return nil', 2);
            buf.add('}', 1);
            buf.add('}');

            counts[cs.name] = ctorArgCount;
            types[cs.name] = ctorTypes;
        }

        buf.add('');
        buf.add('var ${StringConversions.typePathEnumName(e.path)}_RTTI = Hx_Obj_go_haxe_hxenum_CreateInstance(');
        buf.add('"${e.path.toString()}",', 1);
        buf.add('HxMakeArray[string](${e.names.map(n -> '"$n"').join(", ")}),', 1);
        buf.add('HxMakeArray[int32](${e.names.map(n -> counts[n]).join(", ") }),', 1);
        buf.add('func (index int32, params any) Hx_Obj_VTable_go_haxe__hxenumvalue__hxenumvalue {', 1);
        buf.add('switch index {', 2);

        for (i in 0...e.names.length) {
            var name = '${StringConversions.typePathEnumName(e.path)}_${e.names[i]}';
            var args = [];

            for (j in 0...counts[e.names[i]]) {
                args.push(dynamicTo(types[e.names[i]][j], ExprHelper.createUntyped('Hx_Field_go_haxe_hxdynamic_getArrayIndex(params, $j)', [])));
            }

            buf.add('case ${i}: return ${name}{${args.join(', ')}}', 3);
        }

        buf.add('default: return nil', 3);
        buf.add('}', 2);
        buf.add('},', 1);
        buf.add(')');

        return buf;
    }

}
