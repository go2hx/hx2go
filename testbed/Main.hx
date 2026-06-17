import go.fmt.Fmt;

class Main {

    public static function main() {
        var a = 3;
        var b = 5.0;
        var sum = a + b;

        if (sum > 5) {
            Fmt.println("Sum is larger than 5");
        } else if (sum < 3) {
            Fmt.println("Sum is smaller than 3");
        } else {
            Fmt.println("Sum is between 3 and 5 inclusive");
        }

        while (sum > 0) {
            sum = sum - 1;
        }

        Fmt.println("Result is: " + sum);
    }

}