package go.context;

@:go.Type({ name: "stringer", instanceName: "context.stringer", imports: ["context"] })
extern typedef Stringer = {

    @:native("String") function string(): (String);

}