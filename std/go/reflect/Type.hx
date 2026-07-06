package go.reflect;

@:go.Type({name: "reflect.Type", imports: ["reflect"]})
extern class Type {
    function name(): String;
    function kind():Kind;
    function numIn(): Int;
    function isVariadic(): Bool;
    @:native("in") function inType(i: Int): Type;
}
