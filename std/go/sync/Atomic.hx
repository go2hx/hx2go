package go.sync;

/**
    Package atomic provides low-level atomic memory primitives
    useful for implementing synchronization algorithms.
    
    These functions require great care to be used correctly.
    Except for special, low-level applications, synchronization is better
    done with channels or the facilities of the [sync] package.
    Share memory by communicating;
    don't communicate by sharing memory.
    
    The swap operation, implemented by the SwapT functions, is the atomic
    equivalent of:
    
    	old = *addr
    	*addr = new
    	return old
    
    The compare-and-swap operation, implemented by the CompareAndSwapT
    functions, is the atomic equivalent of:
    
    	if *addr == old {
    		*addr = new
    		return true
    	}
    	return false
    
    The add operation, implemented by the AddT functions, is the atomic
    equivalent of:
    
    	*addr += delta
    	return *addr
    
    The load and store operations, implemented by the LoadT and StoreT
    functions, are the atomic equivalents of "return *addr" and
    "*addr = val".
    
    In the terminology of [the Go memory model], if the effect of
    an atomic operation A is observed by atomic operation B,
    then A “synchronizes before” B.
    Additionally, all the atomic operations executed in a program
    behave as though executed in some sequentially consistent order.
    This definition provides the same semantics as
    C++'s sequentially consistent atomics and Java's volatile variables.
    
    [the Go memory model]: https://go.dev/ref/mem
**/
@:go.Type({ name: "atomic", instanceName: "atomic.atomic", imports: ["sync/atomic"] })
extern class Atomic {

    /**
        AddInt32 atomically adds delta to *addr and returns the new value.
        Consider using the more ergonomic and less error-prone [Int32.Add] instead.
    **/
    @:native("AddInt32") static function addInt32(addr: go.Pointer<go.Int32>, delta: go.Int32): (go.Int32);
    /**
        AddInt64 atomically adds delta to *addr and returns the new value.
        Consider using the more ergonomic and less error-prone [Int64.Add] instead
        (particularly if you target 32-bit platforms; see the bugs section).
    **/
    @:native("AddInt64") static function addInt64(addr: go.Pointer<go.Int64>, delta: go.Int64): (go.Int64);
    /**
        AddUint32 atomically adds delta to *addr and returns the new value.
        To subtract a signed positive constant value c from x, do AddUint32(&x, ^uint32(c-1)).
        In particular, to decrement x, do AddUint32(&x, ^uint32(0)).
        Consider using the more ergonomic and less error-prone [Uint32.Add] instead.
    **/
    @:native("AddUint32") static function addUint32(addr: go.Pointer<go.UInt32>, delta: go.UInt32): (go.UInt32);
    /**
        AddUint64 atomically adds delta to *addr and returns the new value.
        To subtract a signed positive constant value c from x, do AddUint64(&x, ^uint64(c-1)).
        In particular, to decrement x, do AddUint64(&x, ^uint64(0)).
        Consider using the more ergonomic and less error-prone [Uint64.Add] instead
        (particularly if you target 32-bit platforms; see the bugs section).
    **/
    @:native("AddUint64") static function addUint64(addr: go.Pointer<go.UInt64>, delta: go.UInt64): (go.UInt64);
    /**
        AddUintptr atomically adds delta to *addr and returns the new value.
        Consider using the more ergonomic and less error-prone [Uintptr.Add] instead.
    **/
    @:native("AddUintptr") static function addUintptr(addr: go.Pointer<go.UIntPtr>, delta: go.UIntPtr): (go.UIntPtr);
    /**
        AndInt32 atomically performs a bitwise AND operation on *addr using the bitmask provided as mask
        and returns the old value.
        Consider using the more ergonomic and less error-prone [Int32.And] instead.
    **/
    @:native("AndInt32") static function andInt32(addr: go.Pointer<go.Int32>, mask: go.Int32): (go.Int32);
    /**
        AndInt64 atomically performs a bitwise AND operation on *addr using the bitmask provided as mask
        and returns the old value.
        Consider using the more ergonomic and less error-prone [Int64.And] instead.
    **/
    @:native("AndInt64") static function andInt64(addr: go.Pointer<go.Int64>, mask: go.Int64): (go.Int64);
    /**
        AndUint32 atomically performs a bitwise AND operation on *addr using the bitmask provided as mask
        and returns the old value.
        Consider using the more ergonomic and less error-prone [Uint32.And] instead.
    **/
    @:native("AndUint32") static function andUint32(addr: go.Pointer<go.UInt32>, mask: go.UInt32): (go.UInt32);
    /**
        AndUint64 atomically performs a bitwise AND operation on *addr using the bitmask provided as mask
        and returns the old.
        Consider using the more ergonomic and less error-prone [Uint64.And] instead.
    **/
    @:native("AndUint64") static function andUint64(addr: go.Pointer<go.UInt64>, mask: go.UInt64): (go.UInt64);
    /**
        AndUintptr atomically performs a bitwise AND operation on *addr using the bitmask provided as mask
        and returns the old value.
        Consider using the more ergonomic and less error-prone [Uintptr.And] instead.
    **/
    @:native("AndUintptr") static function andUintptr(addr: go.Pointer<go.UIntPtr>, mask: go.UIntPtr): (go.UIntPtr);
    /**
        CompareAndSwapInt32 executes the compare-and-swap operation for an int32 value.
        Consider using the more ergonomic and less error-prone [Int32.CompareAndSwap] instead.
    **/
    @:native("CompareAndSwapInt32") static function compareAndSwapInt32(addr: go.Pointer<go.Int32>, old: go.Int32, _new: go.Int32): (Bool);
    /**
        CompareAndSwapInt64 executes the compare-and-swap operation for an int64 value.
        Consider using the more ergonomic and less error-prone [Int64.CompareAndSwap] instead
        (particularly if you target 32-bit platforms; see the bugs section).
    **/
    @:native("CompareAndSwapInt64") static function compareAndSwapInt64(addr: go.Pointer<go.Int64>, old: go.Int64, _new: go.Int64): (Bool);
    /**
        CompareAndSwapPointer executes the compare-and-swap operation for a unsafe.Pointer value.
        Consider using the more ergonomic and less error-prone [Pointer.CompareAndSwap] instead.
    **/
    @:native("CompareAndSwapPointer") static function compareAndSwapPointer(addr: go.Pointer<go.unsafe.Pointer>, old: go.unsafe.Pointer, _new: go.unsafe.Pointer): (Bool);
    /**
        CompareAndSwapUint32 executes the compare-and-swap operation for a uint32 value.
        Consider using the more ergonomic and less error-prone [Uint32.CompareAndSwap] instead.
    **/
    @:native("CompareAndSwapUint32") static function compareAndSwapUint32(addr: go.Pointer<go.UInt32>, old: go.UInt32, _new: go.UInt32): (Bool);
    /**
        CompareAndSwapUint64 executes the compare-and-swap operation for a uint64 value.
        Consider using the more ergonomic and less error-prone [Uint64.CompareAndSwap] instead
        (particularly if you target 32-bit platforms; see the bugs section).
    **/
    @:native("CompareAndSwapUint64") static function compareAndSwapUint64(addr: go.Pointer<go.UInt64>, old: go.UInt64, _new: go.UInt64): (Bool);
    /**
        CompareAndSwapUintptr executes the compare-and-swap operation for a uintptr value.
        Consider using the more ergonomic and less error-prone [Uintptr.CompareAndSwap] instead.
    **/
    @:native("CompareAndSwapUintptr") static function compareAndSwapUintptr(addr: go.Pointer<go.UIntPtr>, old: go.UIntPtr, _new: go.UIntPtr): (Bool);
    /**
        LoadInt32 atomically loads *addr.
        Consider using the more ergonomic and less error-prone [Int32.Load] instead.
    **/
    @:native("LoadInt32") static function loadInt32(addr: go.Pointer<go.Int32>): (go.Int32);
    /**
        LoadInt64 atomically loads *addr.
        Consider using the more ergonomic and less error-prone [Int64.Load] instead
        (particularly if you target 32-bit platforms; see the bugs section).
    **/
    @:native("LoadInt64") static function loadInt64(addr: go.Pointer<go.Int64>): (go.Int64);
    /**
        LoadPointer atomically loads *addr.
        Consider using the more ergonomic and less error-prone [Pointer.Load] instead.
    **/
    @:native("LoadPointer") static function loadPointer(addr: go.Pointer<go.unsafe.Pointer>): (go.unsafe.Pointer);
    /**
        LoadUint32 atomically loads *addr.
        Consider using the more ergonomic and less error-prone [Uint32.Load] instead.
    **/
    @:native("LoadUint32") static function loadUint32(addr: go.Pointer<go.UInt32>): (go.UInt32);
    /**
        LoadUint64 atomically loads *addr.
        Consider using the more ergonomic and less error-prone [Uint64.Load] instead
        (particularly if you target 32-bit platforms; see the bugs section).
    **/
    @:native("LoadUint64") static function loadUint64(addr: go.Pointer<go.UInt64>): (go.UInt64);
    /**
        LoadUintptr atomically loads *addr.
        Consider using the more ergonomic and less error-prone [Uintptr.Load] instead.
    **/
    @:native("LoadUintptr") static function loadUintptr(addr: go.Pointer<go.UIntPtr>): (go.UIntPtr);
    /**
        OrInt32 atomically performs a bitwise OR operation on *addr using the bitmask provided as mask
        and returns the old value.
        Consider using the more ergonomic and less error-prone [Int32.Or] instead.
    **/
    @:native("OrInt32") static function orInt32(addr: go.Pointer<go.Int32>, mask: go.Int32): (go.Int32);
    /**
        OrInt64 atomically performs a bitwise OR operation on *addr using the bitmask provided as mask
        and returns the old value.
        Consider using the more ergonomic and less error-prone [Int64.Or] instead.
    **/
    @:native("OrInt64") static function orInt64(addr: go.Pointer<go.Int64>, mask: go.Int64): (go.Int64);
    /**
        OrUint32 atomically performs a bitwise OR operation on *addr using the bitmask provided as mask
        and returns the old value.
        Consider using the more ergonomic and less error-prone [Uint32.Or] instead.
    **/
    @:native("OrUint32") static function orUint32(addr: go.Pointer<go.UInt32>, mask: go.UInt32): (go.UInt32);
    /**
        OrUint64 atomically performs a bitwise OR operation on *addr using the bitmask provided as mask
        and returns the old value.
        Consider using the more ergonomic and less error-prone [Uint64.Or] instead.
    **/
    @:native("OrUint64") static function orUint64(addr: go.Pointer<go.UInt64>, mask: go.UInt64): (go.UInt64);
    /**
        OrUintptr atomically performs a bitwise OR operation on *addr using the bitmask provided as mask
        and returns the old value.
        Consider using the more ergonomic and less error-prone [Uintptr.Or] instead.
    **/
    @:native("OrUintptr") static function orUintptr(addr: go.Pointer<go.UIntPtr>, mask: go.UIntPtr): (go.UIntPtr);
    /**
        StoreInt32 atomically stores val into *addr.
        Consider using the more ergonomic and less error-prone [Int32.Store] instead.
    **/
    @:native("StoreInt32") static function storeInt32(addr: go.Pointer<go.Int32>, val: go.Int32): Void;
    /**
        StoreInt64 atomically stores val into *addr.
        Consider using the more ergonomic and less error-prone [Int64.Store] instead
        (particularly if you target 32-bit platforms; see the bugs section).
    **/
    @:native("StoreInt64") static function storeInt64(addr: go.Pointer<go.Int64>, val: go.Int64): Void;
    /**
        StorePointer atomically stores val into *addr.
        Consider using the more ergonomic and less error-prone [Pointer.Store] instead.
    **/
    @:native("StorePointer") static function storePointer(addr: go.Pointer<go.unsafe.Pointer>, val: go.unsafe.Pointer): Void;
    /**
        StoreUint32 atomically stores val into *addr.
        Consider using the more ergonomic and less error-prone [Uint32.Store] instead.
    **/
    @:native("StoreUint32") static function storeUint32(addr: go.Pointer<go.UInt32>, val: go.UInt32): Void;
    /**
        StoreUint64 atomically stores val into *addr.
        Consider using the more ergonomic and less error-prone [Uint64.Store] instead
        (particularly if you target 32-bit platforms; see the bugs section).
    **/
    @:native("StoreUint64") static function storeUint64(addr: go.Pointer<go.UInt64>, val: go.UInt64): Void;
    /**
        StoreUintptr atomically stores val into *addr.
        Consider using the more ergonomic and less error-prone [Uintptr.Store] instead.
    **/
    @:native("StoreUintptr") static function storeUintptr(addr: go.Pointer<go.UIntPtr>, val: go.UIntPtr): Void;
    /**
        SwapInt32 atomically stores new into *addr and returns the previous *addr value.
        Consider using the more ergonomic and less error-prone [Int32.Swap] instead.
    **/
    @:native("SwapInt32") static function swapInt32(addr: go.Pointer<go.Int32>, _new: go.Int32): (go.Int32);
    /**
        SwapInt64 atomically stores new into *addr and returns the previous *addr value.
        Consider using the more ergonomic and less error-prone [Int64.Swap] instead
        (particularly if you target 32-bit platforms; see the bugs section).
    **/
    @:native("SwapInt64") static function swapInt64(addr: go.Pointer<go.Int64>, _new: go.Int64): (go.Int64);
    /**
        SwapPointer atomically stores new into *addr and returns the previous *addr value.
        Consider using the more ergonomic and less error-prone [Pointer.Swap] instead.
    **/
    @:native("SwapPointer") static function swapPointer(addr: go.Pointer<go.unsafe.Pointer>, _new: go.unsafe.Pointer): (go.unsafe.Pointer);
    /**
        SwapUint32 atomically stores new into *addr and returns the previous *addr value.
        Consider using the more ergonomic and less error-prone [Uint32.Swap] instead.
    **/
    @:native("SwapUint32") static function swapUint32(addr: go.Pointer<go.UInt32>, _new: go.UInt32): (go.UInt32);
    /**
        SwapUint64 atomically stores new into *addr and returns the previous *addr value.
        Consider using the more ergonomic and less error-prone [Uint64.Swap] instead
        (particularly if you target 32-bit platforms; see the bugs section).
    **/
    @:native("SwapUint64") static function swapUint64(addr: go.Pointer<go.UInt64>, _new: go.UInt64): (go.UInt64);
    /**
        SwapUintptr atomically stores new into *addr and returns the previous *addr value.
        Consider using the more ergonomic and less error-prone [Uintptr.Swap] instead.
    **/
    @:native("SwapUintptr") static function swapUintptr(addr: go.Pointer<go.UIntPtr>, _new: go.UIntPtr): (go.UIntPtr);

}