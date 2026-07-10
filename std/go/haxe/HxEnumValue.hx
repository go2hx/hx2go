package go.haxe;

@:keep
@:analyzer(ignore)
private interface _HxEnumValue {
    public function enumIndex(): Int;
    public function enumParams(): Array<Dynamic>;
    public function enumType(): HxEnum;
}

@:coreType
@:go.Type({ name: 'Hx_Obj_VTable_go_haxe__hxenumvalue__hxenumvalue' })
extern abstract HxEnumValue from _HxEnumValue to _HxEnumValue {}