package go.haxe;

@:keep
@:structInit
class HxEnum {
    public var name: String;
    public var constructorNames: Array<String>;
    public var constructorArgCounts: Array<Int>;
    public var createByIndex: (Int, Array<Dynamic>) -> HxEnumValue;
}
