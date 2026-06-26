package go.reflect;

@:go.Type({name: "reflect.Value", imports: ["reflect"] })
extern class Value {
    function type():Type;
    function addr(): Value;
    function kind():Kind;
    function elem():Value;
    function isValid(): Bool;
    function numField(): GoInt;
    function field(i: GoInt): Value;
    function len(): GoInt;
    function index(i: GoInt): Value;
    function grow(n: GoInt): Void;
    function setLen(n: GoInt): Void;
    function canInterface():Bool;
    @:native("Interface") function iface(): Dynamic; // interface is a Haxe keyword, so name had to change
    function set(v: Value): Void;
    function canFloat(): Bool;
    function float(): Float64;
    function canInt(): Bool;
    function int(): Int64;
    function canUint(): Bool;
    function uint(): UInt64;
    function string(): String;
    function bool(): Bool;
    function isNil(): Bool;
    function canSet(): Bool;
    function mapIndex(i: Value): Value;
    function setMapIndex(key: Value, element: Value): Void;
    function mapKeys(): Slice<Value>;
    function fieldByName(n: String): Value;
    function convert(t: Type): Value;
}
