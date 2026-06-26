class Test {

    public var name: String;

    public function new(name: String) {
        this.name = name;
    }

    public function greet(): Void {
        trace('Hello, $name');
    }

}

class Main {

    public static function main() {
        var x = new Test('John');
        x.greet();
    }

}