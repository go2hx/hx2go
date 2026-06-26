class Test {

    public var name: String;
    public var age: Null<Int>;

    public function new(name: String, ?age: Int) {
        this.name = name;
        this.age = age;
    }

    public function greet(): Void {
        trace('Hello, $name. You are $age years old.');
    }

}

class Main {

    public static function main() {
        var john = new Test('John');
        john.greet();

        var jane = new Test('Jane', 24);
        jane.greet();
    }

}