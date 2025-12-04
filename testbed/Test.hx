// NOTE: @:native causes the name to change in the dump file
// We only want to use the metadata to point to the Go reference api
@:go.package("fmt")
extern class Fmt {
	public static function println(s: String):Void;
	
}
class Test {
    public static function main() {
        Fmt.println("hello");
    }
}