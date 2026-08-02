package go.net.http;

@:structInit
@:go.Type({ name: "fakeLocker", instanceName: "http.fakeLocker", imports: ["net/http"] })
extern class FakeLocker {

    @:native("Lock") function lock(): Void;
    @:native("Unlock") function unlock(): Void;

}