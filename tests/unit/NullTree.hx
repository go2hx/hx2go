package unit;

function main() {
    assert(new Tree<String>().get() == null);
}
class Tree<T> {
    public function new() {}
    public function get(): Null<T>
        return null;
}