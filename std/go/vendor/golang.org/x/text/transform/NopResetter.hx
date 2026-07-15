package go.vendor.golang.org.x.text.transform;

@:structInit
@:go.Type({ name: "NopResetter", instanceName: "transform.NopResetter", imports: ["vendor/golang.org/x/text/transform"] })
extern class NopResetter {

    @:native("Reset") function reset(): Void;

}