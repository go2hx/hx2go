function main(): Void {
    Sys.putEnv('GOOS', 'wasip1');
    Sys.putEnv('GOARCH', 'wasm');
    Sys.exit(Sys.command('go', ['-C', './output/client/main', 'build', '-o', '../../plugin.wasm', '.']));
}