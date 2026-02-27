import go.Fmt;

@:analyzer(ignore)
class Test {

    public static function main(): Void {
        var cwd = Os.getwd();
        Fmt.println(cwd);
        Fmt.println(cwd.tuple());
        Fmt.println(cwd.sure());
    }

}
