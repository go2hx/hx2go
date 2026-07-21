package go;

@:go.Type({ name: "reflect", instanceName: "reflect.reflect", imports: ["reflect"] })
extern class Reflect {

    @:native("Array") static var Array: go.reflect.Kind;
    @:native("Bool") static var Bool: go.reflect.Kind;
    @:native("BothDir") static var BothDir: go.reflect.ChanDir;
    @:native("Chan") static var Chan: go.reflect.Kind;
    @:native("Complex128") static var Complex128: go.reflect.Kind;
    @:native("Complex64") static var Complex64: go.reflect.Kind;
    @:native("Float32") static var Float32: go.reflect.Kind;
    @:native("Float64") static var Float64: go.reflect.Kind;
    @:native("Func") static var Func: go.reflect.Kind;
    @:native("Int") static var Int: go.reflect.Kind;
    @:native("Int16") static var Int16: go.reflect.Kind;
    @:native("Int32") static var Int32: go.reflect.Kind;
    @:native("Int64") static var Int64: go.reflect.Kind;
    @:native("Int8") static var Int8: go.reflect.Kind;
    @:native("Interface") static var Interface: go.reflect.Kind;
    @:native("Invalid") static var Invalid: go.reflect.Kind;
    @:native("Map") static var Map: go.reflect.Kind;
    @:native("Pointer") static var Pointer: go.reflect.Kind;
    @:native("Ptr") static var Ptr: go.reflect.Kind;
    @:native("RecvDir") static var RecvDir: go.reflect.ChanDir;
    @:native("SelectDefault") static var SelectDefault: go.reflect.SelectDir;
    @:native("SelectRecv") static var SelectRecv: go.reflect.SelectDir;
    @:native("SelectSend") static var SelectSend: go.reflect.SelectDir;
    @:native("SendDir") static var SendDir: go.reflect.ChanDir;
    @:native("Slice") static var Slice: go.reflect.Kind;
    @:native("String") static var String: go.reflect.Kind;
    @:native("Struct") static var Struct: go.reflect.Kind;
    @:native("Uint") static var Uint: go.reflect.Kind;
    @:native("Uint16") static var Uint16: go.reflect.Kind;
    @:native("Uint32") static var Uint32: go.reflect.Kind;
    @:native("Uint64") static var Uint64: go.reflect.Kind;
    @:native("Uint8") static var Uint8: go.reflect.Kind;
    @:native("Uintptr") static var Uintptr: go.reflect.Kind;
    @:native("UnsafePointer") static var UnsafePointer: go.reflect.Kind;

    @:native("Append") static function append(s: go.reflect.Value, x: haxe.Rest<go.reflect.Value>): (go.reflect.Value);
    @:native("AppendSlice") static function appendSlice(s: go.reflect.Value, t: go.reflect.Value): (go.reflect.Value);
    @:native("ArrayOf") static function arrayOf(length: go.GoInt, elem: go.reflect.Type): (go.reflect.Type);
    @:native("ChanOf") static function chanOf(dir: go.reflect.ChanDir, t: go.reflect.Type): (go.reflect.Type);
    @:native("Copy") static function copy(dst: go.reflect.Value, src: go.reflect.Value): (go.GoInt);
    @:native("DeepEqual") static function deepEqual(x: Dynamic, y: Dynamic): (Bool);
    @:native("FuncOf") static function funcOf(_in: go.Slice<go.reflect.Type>, out: go.Slice<go.reflect.Type>, variadic: Bool): (go.reflect.Type);
    @:native("Indirect") static function indirect(v: go.reflect.Value): (go.reflect.Value);
    @:native("MakeChan") static function makeChan(typ: go.reflect.Type, buffer: go.GoInt): (go.reflect.Value);
    @:native("MakeFunc") static function makeFunc(typ: go.reflect.Type, fn: (args: go.Slice<go.reflect.Value>) -> (go.Slice<go.reflect.Value>)): (go.reflect.Value);
    @:native("MakeMap") static function makeMap(typ: go.reflect.Type): (go.reflect.Value);
    @:native("MakeMapWithSize") static function makeMapWithSize(typ: go.reflect.Type, n: go.GoInt): (go.reflect.Value);
    @:native("MakeSlice") static function makeSlice(typ: go.reflect.Type, len: go.GoInt, cap: go.GoInt): (go.reflect.Value);
    @:native("MapOf") static function mapOf(key: go.reflect.Type, elem: go.reflect.Type): (go.reflect.Type);
    @:native("New") static function _new(typ: go.reflect.Type): (go.reflect.Value);
    @:native("NewAt") static function newAt(typ: go.reflect.Type, p: go.unsafe.Pointer): (go.reflect.Value);
    @:native("PointerTo") static function pointerTo(t: go.reflect.Type): (go.reflect.Type);
    @:native("PtrTo") static function ptrTo(t: go.reflect.Type): (go.reflect.Type);
    @:go.Tuple("chosen", "recv", "recvOK") @:native("Select") static function select(cases: go.Slice<go.reflect.SelectCase>): (go.Tuple<{ chosen: go.GoInt, recv: go.reflect.Value, recvOK: Bool }>);
    @:native("SliceAt") static function sliceAt(typ: go.reflect.Type, p: go.unsafe.Pointer, n: go.GoInt): (go.reflect.Value);
    @:native("SliceOf") static function sliceOf(t: go.reflect.Type): (go.reflect.Type);
    @:native("StructOf") static function structOf(fields: go.Slice<go.reflect.StructField>): (go.reflect.Type);
    @:native("Swapper") static function swapper(slice: Dynamic): ((i: go.GoInt, j: go.GoInt) -> Void);
    @:go.Tuple("p0", "p1") @:native("TypeAssert") static function typeAssert<T: Dynamic>(v: go.reflect.Value): (go.Tuple<{ p0: T, p1: Bool }>);
    @:native("TypeFor") static function typeFor<T: Dynamic>(): (go.reflect.Type);
    @:native("TypeOf") static function typeOf(i: Dynamic): (go.reflect.Type);
    @:native("ValueOf") static function valueOf(i: Dynamic): (go.reflect.Value);
    @:native("VisibleFields") static function visibleFields(t: go.reflect.Type): (go.Slice<go.reflect.StructField>);
    @:native("Zero") static function zero(typ: go.reflect.Type): (go.reflect.Value);

}