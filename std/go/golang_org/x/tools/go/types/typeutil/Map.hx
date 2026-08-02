package go.golang_org.x.tools.go.types.typeutil;

@:structInit
@:go.Type({ name: "Map", instanceName: "typeutil.Map", imports: ["golang.org/x/tools/go/types/typeutil"] })
extern class Map {

    @:native("At") function at(key: go.go.types.Type): (Dynamic);
    @:native("Delete") function delete(key: go.go.types.Type): (Bool);
    @:native("Iterate") function iterate(f: (key: go.go.types.Type, value: Dynamic) -> Void): Void;
    @:native("Keys") function keys(): (go.Slice<go.go.types.Type>);
    @:native("KeysString") function keysString(): (String);
    @:native("Len") function len(): (go.GoInt);
    @:native("Set") function set(key: go.go.types.Type, value: Dynamic): (Dynamic);
    @:native("SetHasher") function setHasher(p0: go.golang_org.x.tools.go.types.typeutil.Hasher): Void;
    @:native("String") function string(): (String);

}