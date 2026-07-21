package go.golang_org.x.sync;

@:go.Type({ name: "errgroup", instanceName: "errgroup.errgroup", imports: ["golang.org/x/sync/errgroup"] })
extern class Errgroup {

    @:go.Tuple("p0", "p1") @:native("WithContext") static function withContext(ctx: go.context.Context): (go.Tuple<{ p0: go.Pointer<go.golang_org.x.sync.errgroup.Group>, p1: go.context.Context }>);

}