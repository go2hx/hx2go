package go.context;

@:go.Type({ name: "afterFuncer", instanceName: "context.afterFuncer", imports: ["context"] })
extern typedef AfterFuncer = {

    @:native("AfterFunc") function afterFunc(p0: () -> Void): (() -> (Bool));

}