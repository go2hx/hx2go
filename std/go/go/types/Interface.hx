package go.go.types;

@:structInit
@:go.Type({ name: "Interface", instanceName: "types.Interface", imports: ["go/types"] })
extern class Interface {

    @:native("Complete") function complete(): (go.Pointer<go.go.types.Interface>);
    @:native("Embedded") function embedded(i: go.GoInt): (go.Pointer<go.go.types.Named>);
    @:native("EmbeddedType") function embeddedType(i: go.GoInt): (go.go.types.Type);
    @:native("EmbeddedTypes") function embeddedTypes(): (go.iter.Seq<go.go.types.Type>);
    @:native("Empty") function empty(): (Bool);
    @:native("ExplicitMethod") function explicitMethod(i: go.GoInt): (go.Pointer<go.go.types.Func>);
    @:native("ExplicitMethods") function explicitMethods(): (go.iter.Seq<go.Pointer<go.go.types.Func>>);
    @:native("IsComparable") function isComparable(): (Bool);
    @:native("IsImplicit") function isImplicit(): (Bool);
    @:native("IsMethodSet") function isMethodSet(): (Bool);
    @:native("MarkImplicit") function markImplicit(): Void;
    @:native("Method") function method(i: go.GoInt): (go.Pointer<go.go.types.Func>);
    @:native("Methods") function methods(): (go.iter.Seq<go.Pointer<go.go.types.Func>>);
    @:native("NumEmbeddeds") function numEmbeddeds(): (go.GoInt);
    @:native("NumExplicitMethods") function numExplicitMethods(): (go.GoInt);
    @:native("NumMethods") function numMethods(): (go.GoInt);
    @:native("String") function string(): (String);
    @:native("Underlying") function underlying(): (go.go.types.Type);

}