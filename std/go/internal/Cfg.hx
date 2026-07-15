package go.internal;

@:go.Type({ name: "cfg", instanceName: "cfg.cfg", imports: ["internal/cfg"] })
extern class Cfg {

    @:native("KnownEnv") static var KnownEnv: String;

}