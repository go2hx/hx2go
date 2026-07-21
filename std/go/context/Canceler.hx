package go.context;

@:go.Type({ name: "canceler", instanceName: "context.canceler", imports: ["context"] })
extern typedef Canceler = {

    @:native("Done") function done(): (go.Chan<Dynamic>);

}