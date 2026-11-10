# Lowering Haxe coroutines onto Go goroutines + channels (hx2go)

## Context

I maintain [hx2go](https://github.com/go2hx/go2hx), a Haxe → Go target. The target is roughly 95% through its test suite and already carries a working concurrency surface that maps directly onto Go's runtime:

- `go.Syntax.go(fn)` → a real `go func() { ... }()` goroutine, capturing locals
- `go.Chan<T>` / `go.SendChan<T>` / `go.ReceiveChan<T>` → native `chan T`, with send-only / receive-only directions preserved into the typed AST
- `go.Syntax.select(...)` → a native `select { case ...: }`, with `Select.receive` / `Select.send` / `Select.defaultCase`
- `sys.thread.Thread` → goroutines (`sys.thread.Mutex`, `Condition`, `Tls` all map to their Go equivalents)

So on this target the "green threads vs OS threads" question doesn't arise — the Go scheduler already gives us cheap, preemptible, M:N-scheduled coroutines with first-class channels and `select`. That makes Go an unusually natural backend for Haxe's concurrency story, and I'd like to make sure the Haxe 5 coroutine design can take advantage of it rather than fight it.

## The question

As `haxe.coro` / the `coroutine` support lands, how should a backend that *already has* native coroutines (goroutines) and native channels lower the abstraction?

Concretely, I see two paths:

1. **CPS/state-machine lowering (the generic path).** Coroutines are transformed into state machines by the compiler/std, and every target runs the same lowered form. Portable, but on Go it means re-implementing a scheduler on top of a runtime that already has a better one — and losing the ability to hand a `select` or a blocking channel receive straight to the Go runtime.

2. **Backend-provided lowering (the native path).** The coroutine transform is pluggable, so a target like Go (or a hypothetical native-fiber target) can map `suspend`/`resume` directly onto its own primitives — a suspending call becomes a goroutine + channel handshake, `yield` becomes a channel send, structured-concurrency scopes become `context.Context` + `errgroup`.

My interest is in whether path 2 is a design goal — i.e. is there a seam where a target can say "I provide coroutines natively, don't lower them for me"? Even a partial seam (e.g. the suspension primitive is overridable while the surface syntax and type-checking stay shared) would let hx2go expose idiomatic Go concurrency without a second scheduler.

## Specific things I'd want to confirm

- **Suspension points.** Is the set of suspension points something a backend can observe/rewrite, or is the state-machine transform fixed before the generator sees it?
- **Channels.** Haxe-level channel/stream types in the coroutine API — can a target bind them to its own channel type instead of a std-provided one? hx2go already has direction-typed channels we'd want to reuse.
- **Structured concurrency / cancellation.** If there's a scope/nursery concept, is cancellation modelled in a way that can lower onto `context.Context`? That's the idiomatic Go spelling and it'd be a shame to shadow it.
- **`select` / racing.** Is there a first-class "wait on first of N" that could map to Go's `select`?

## Why I think it's worth doing now

Pinning even a minimal backend seam while the coroutine surface is still movable is much cheaper than retrofitting one later. And a concrete second implementation (Go) tends to surface leaks in an abstraction early — happy to be the guinea pig here and report back what does/doesn't lower cleanly.

Happy to put together a small worked example: the same Haxe coroutine code, shown lowered the generic way vs. mapped onto goroutines/channels, so the trade-off is concrete rather than hand-wavy. Would that be useful, and is there an existing design doc/thread I should read first so I'm not relitigating settled decisions?
