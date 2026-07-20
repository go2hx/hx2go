package go.os;

@:go.Type({ name: "timeout", instanceName: "os.timeout", imports: ["os"] })
extern typedef Timeout = {

    @:native("Timeout") function timeout(): (Bool);

}