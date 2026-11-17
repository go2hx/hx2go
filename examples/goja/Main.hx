import go.Pointer;
import go.github_com.dop251.Goja;

function main() {
    var vm = Goja._new();
    vm.set('log', (msg: String) -> trace('[js] $msg'));

    vm.runString("
        log('hello from JavaScript');

        function greet(name) {
            return `Hello, ${name}! Doubled: ${[1, 2, 3].map(n => n * 2).join(', ')}`;
        }
    ").sure();

    var answer = vm.runString('6 * 7').sure();
    trace('6 * 7 = ${answer.toInteger()}');

    var greet: String->String = null;
    vm.exportTo(vm.get('greet'), Pointer.addressOf(greet));

    trace(greet('Haxe'));
}