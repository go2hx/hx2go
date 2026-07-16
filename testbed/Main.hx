import go.Net;

function main() {
    var dns = Net.lookupIP("google.com");
    var ips = dns.sure();

    for (ip in ips) {
        trace(ip.string());
    }

    var v: go.GoArray<Int, 4> = null;
    var x = v.toSlice();
}