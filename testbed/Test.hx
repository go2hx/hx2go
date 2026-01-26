import go.Result;
import go.ResultKind.*;
import go.Error;
import go.Fmt;

@:go.TypeAccess({ name: "*os.File", imports: ["os"] })
extern class File {}

@:go.TypeAccess({ name: "os", imports: ["os"] })
extern class OS {
    static function open(path: String): Result<File, Error>;
}

enum Cool {
    Foo(x: Int);
    Bar(y: Int);
    Baz(z: Int);
}

class Test {

    public static function main() {
        final res = OS.open("~/Documents/test.txt");
        final file = switch res {
            case Ok(r): Fmt.println("File opened :-)", r); r;
            case Err(e): Fmt.println("Failed :'(", e); null;
        }

        Fmt.println("Final result:", file);
    }

}

