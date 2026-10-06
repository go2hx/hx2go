package unit;

import haxe.xml.Printer;

@:generic
private class ManyTypes<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O> {
    public function new() {}
}

function main() {
    var value = new ManyTypes<Printer, Printer, Printer, Printer, Printer, Printer, Printer, Printer, Printer, Printer, Printer, Printer, Printer, Printer, Printer>();
    assert(value != null);
}
