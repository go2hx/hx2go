import go.fmt.Fmt;

class Main {

    public static function main() {
        var a = 3;
        var b = 5.0;
        var sum = a + b;

        if (sum > 5) {
            Fmt.println("Sum is larger than 5");
            Fmt.println("---");
        } else if (sum < 3) {
            Fmt.println("Sum is smaller than 3");
            Fmt.println("---");
        } else {
            Fmt.println("Sum is between 3 and 5 inclusive");
            Fmt.println("---");
        }

        while (sum > 0) {
            Fmt.println("Minus");
            sum = sum - 1;
        }

        Fmt.println("Result is: " + sum);
    }

}