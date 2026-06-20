import go.fmt.Fmt;

@:dce(ignore)
@:analyzer(ignore)
class Main {
    public static function main() {
        Fmt.println(Uuid.newV7());

    }
}


