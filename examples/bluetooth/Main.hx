import go.Syntax;
import go.tinygo_org.x.Bluetooth;

function main() {
    var adapter = Bluetooth.defaultAdapter;
    adapter.enable().sure();

    Syntax.go(() -> {
        Sys.sleep(10);
        adapter.stopScan();
    });

    trace('scanning devices');

    var seen: Map<String, Bool> = [];
    adapter.scan((_, device) -> {
        var address: String = device.address.string();
        if (seen.exists(address)) {
            return;
        }

        seen[address] = true;

        var name: String = device.localName();
        trace('${device.RSSI} strength at $address  ${name == "" ? "(no name)" : name}');
    });

    trace('found ${Lambda.count(seen)} devices');
}