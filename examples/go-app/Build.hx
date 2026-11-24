function main() {
    var os = Sys.getEnv('GOOS');
    var arch = Sys.getEnv('GOARCH');

    Sys.putEnv('GOOS', 'wasip1');
    Sys.putEnv('GOARCH', 'wasm');
    Sys.command('go', ['-C', '../../output/examples/go-app/main', 'build', '-o', 'web/app.wasm', '.']);

    Sys.putEnv('GOOS', os);
    Sys.putEnv('GOARCH', arch);
    Sys.command('go', ['-C', '../../output/examples/go-app/main', 'run', '.']);
}