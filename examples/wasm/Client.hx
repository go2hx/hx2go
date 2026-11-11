@:go.WasmImport('env', 'double')
extern function double(x: Int): Int;

@:go.WasmExport('square')
function square(x: Int): Int {
    return x * x;
}

function main() {
    trace('client: double(21) = ${double(21)}');
}