package sys.net;

import go.encoding.Binary;
import go.net.IP;
import go.Net;
import go.Os;
import go.Syntax;

class Host {

    public var host(default, null): String;
    public var ip(default, null): Int;

    public static function localhost(): String {
        return Os.hostname().sure();
    }

    public function new(name: String): Void {
        var parsed = Net.parseIP(name);
        if (parsed == null) {
            var addrs = Net.lookupHost(name).sure();
            host = addrs[0];
            parsed = Net.parseIP(host);
        } else {
            host = name;
        }
        ip = parsed == null ? 0 : ipToInt(parsed);
    }

    public function toString(): String {
        return host;
    }

    public function reverse(): String {
        return Net.lookupAddr(host).sure()[0];
    }

    static function ipToInt(ip: IP): Int {
        var v4 = ip.to4();
        if (v4 == null) return 0;
        var bytes:go.Slice<go.Byte> = Syntax.code("[]byte({0})", v4);
        return (Binary.bigEndian.uint32(bytes) : Int);
    }

}
