import go.Fmt;

@:analyzer(ignore)
class Test {

    public static function main(): Void {
        var arr = ["Hello", "World", "Hx2go"];
        for (word in arr) {
            Fmt.println(word);
        }

        Fmt.println(arr.join(", "));
    }

}

