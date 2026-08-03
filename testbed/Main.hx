import sys.thread.Thread;

function main() {
    Thread.create("CoolThread", () -> {
        trace("Hello from Thread!");
    });
}