function main(): Void { // script is needed for cross-platform setting of env vars
    Sys.putEnv('GOOS', 'wasip1');
    Sys.putEnv('GOARCH', 'wasm');
    Sys.exit(Sys.command('go', ['-C', './output/client/main', 'build', '-o', '../../plugin.wasm', '.']));
}