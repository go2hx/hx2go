import go.Result;
import go.Error;
import go.Fmt;

@:go.TypeAccess({ name: "*os.File", imports: ["os"] })
extern class File {}

@:go.TypeAccess({ name: "os", imports: ["os"] })
extern class OS {
    static function open(path: String): Result<File, Error>;
}

class Test {

    public static function main() {
        final path = "/home/mikaib/Documents/test.txt";

        // using tuple()
        final tuple = OS.open(path).tuple();
        Fmt.println("Tuple result:", tuple.error, tuple.result);

        // using switch
        final file = switch OS.open(path) {
            case Ok(r): Fmt.println("File opened :-)", r); r;
            case Err(e): Fmt.println("Failed :'(", e); null;
        }
        Fmt.println("Switch result:", file);

        // using sure() or f()!
        Fmt.println("Sure() result:", OS.open(path).sure());
    }

}
