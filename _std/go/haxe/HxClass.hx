package go.haxe;

@:keep
class HxClass {

    private static var _registry: go.Map<String, HxClass> = new go.Map();

    public var name: String;
    public var staticFields: Array<String>;
    public var instanceFields: Array<String>;
    public var superClass: Null<HxClass>;
    public var createInstance: (Array<Dynamic>) -> Dynamic;
    public var createEmptyInstance: () -> Dynamic;

    public function new(name: String, staticFields: Array<String>, instanceFields: Array<String>, superClass: HxClass, createInstance: (Array<Dynamic>) -> Dynamic, createEmptyInstance: () -> Dynamic) {
        this.name = name;
        this.staticFields = staticFields;
        this.instanceFields = instanceFields;
        this.superClass = superClass;
        this.createInstance = createInstance;
        this.createEmptyInstance = createEmptyInstance;
        _registry.set(name, this);
    }

    public static function getClass(name: String): Null<HxClass> {
        return _registry.exists(name) ? _registry.get(name) : null;
    }

}
