package runtime;
import go.Syntax;

@:keep
class HxClass {

    private static var classes: Array<HxClass> = [];

    public var name: String;
    public var superClass: Null<HxClass>;

    public function new(name: String, ?superClass: HxClass) {
        this.name = name;
        this.superClass = superClass;

        HxClass.classes.push(this);
    }

    public static function findClass(name: String): Null<HxClass> {
        for (c in classes) {
            if (c.name != name) {
                continue;
            }

            return c;
        }

        return null;
    }

    public static function getAllClasses(): Array<HxClass> {
        return classes.copy();
    }

}