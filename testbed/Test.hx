@:analyzer(ignore)
class Test {

    public static function main(): Void {
        var cwd = Os.getwd();
        Sys.println(cwd);
        Sys.println(cwd.tuple());
        // Sys.println(cwd.sure());
    }

}
