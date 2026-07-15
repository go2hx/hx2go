package go.internal.singleflight;

@:structInit
@:go.Type({ name: "Group", instanceName: "singleflight.Group", imports: ["internal/singleflight"] })
extern class Group {

    @:go.Tuple("v", "err", "shared") @:native("Do") function _do(key: String, fn: () -> go.Result<Dynamic>): go.Tuple<{ v: Dynamic, err: go.Error, shared: Bool }>;
    @:native("DoChan") function doChan(key: String, fn: () -> go.Result<Dynamic>): go.Chan<go.internal.singleflight.Result>;
    @:native("ForgetUnshared") function forgetUnshared(key: String): Bool;

}