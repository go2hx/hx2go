package go.internal.synctest;

@:structInit
@:go.Type({ name: "Bubble", instanceName: "synctest.Bubble", imports: ["internal/synctest"] })
extern class Bubble {

    @:native("Release") function release(): Void;
    @:native("Run") function run(f: () -> Void): Void;

}