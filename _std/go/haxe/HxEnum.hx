package go.haxe;

@:keep
class HxEnum {

    private static var _registry: go.Map<String, HxEnum> = new go.Map();

    public var name: String;
    public var constructorNames: Array<String>;
    public var constructorArgCounts: Array<Int>;
    public var createByIndex: (Int, Array<Dynamic>) -> HxEnumValue;
    public var __meta__: Dynamic;

    public function new(name: String, constructorNames: Array<String>, constructorArgCounts: Array<Int>, createByIndex: (Int, Array<Dynamic>) -> HxEnumValue, __meta__: Dynamic) {
        this.name = name;
        this.constructorNames = constructorNames;
        this.constructorArgCounts = constructorArgCounts;
        this.createByIndex = createByIndex;
        this.__meta__ = __meta__;
        _registry.set(name, this);
    }

    public static function getEnum(name: String): Null<HxEnum> {
        return _registry.exists(name) ? _registry.get(name) : null;
    }

}
