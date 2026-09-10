package go.haxe;

@:keep
class HxClass {

    private static var _registry: go.Map<String, HxClass> = new go.Map();

    public var name: String;
    public var staticFields: Array<String>;
    public var instanceFields: Array<String>;
    public var superClass: Null<HxClass>;
    public var interfaces: Array<HxClass>;
    public var createInstance: (Array<Dynamic>) -> Dynamic;
    public var createEmptyInstance: () -> Dynamic;
    public var __meta__: Dynamic;
    public var getStaticFieldPtr: (String) -> Dynamic;

    public function new(name: String, staticFields: Array<String>, instanceFields: Array<String>, superClass: HxClass, interfaces: Array<HxClass>, createInstance: (Array<Dynamic>) -> Dynamic, createEmptyInstance: () -> Dynamic, __meta__: Dynamic, getStaticFieldPtr: (String) -> Dynamic) {
        this.name = name;
        this.staticFields = staticFields;
        this.instanceFields = instanceFields;
        this.superClass = superClass;
        this.interfaces = interfaces;
        this.createInstance = createInstance;
        this.createEmptyInstance = createEmptyInstance;
        this.__meta__ = __meta__;
        this.getStaticFieldPtr = getStaticFieldPtr;
        _registry.set(name, this);
    }

    public static function getClass(name: String): Null<HxClass> {
        return _registry.exists(name) ? _registry.get(name) : null;
    }

}
