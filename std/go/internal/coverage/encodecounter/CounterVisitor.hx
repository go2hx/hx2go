package go.internal.coverage.encodecounter;

@:go.Type({ name: "CounterVisitor", instanceName: "encodecounter.CounterVisitor", imports: ["internal/coverage/encodecounter"] })
extern typedef CounterVisitor = {

    @:native("VisitFuncs") function visitFuncs(f: go.internal.coverage.encodecounter.CounterVisitorFn): go.Error;

}