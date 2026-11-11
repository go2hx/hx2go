import go.Context;
import go.Os;
import go.Slice;
import go.UInt64;
import go.github_com.tetratelabs.Wazero;
import go.github_com.tetratelabs.wazero.api.Module;
import go.github_com.tetratelabs.wazero.imports.Wasi_snapshot_preview1;

function main() {
    var ctx = Context.background();
    var runtime = Wazero.newRuntime(ctx);
    Wasi_snapshot_preview1.mustInstantiate(ctx, runtime);

    runtime.newHostModuleBuilder('env')
        .newFunctionBuilder()
            .withFunc((ctx: go.context.Context, client: Module, x: Int) -> {
                var stack = new Slice<UInt64>(1);
                stack[0] = x;

                client.exportedFunction('square').callWithStack(ctx, stack);
                trace('host: square($x) = ${stack[0]}');

                return x * 2;
            })
            .export('double')
        .instantiate(ctx)
        .sure();

    var config = Wazero.newModuleConfig()
        .withStdout(Os.stdout)
        .withStderr(Os.stderr);

    runtime.instantiateWithConfig(
        ctx,
        Os.readFile(Sys.args()[0]).sure(),
        config
    ).sure();
}