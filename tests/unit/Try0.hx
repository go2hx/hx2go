package unit;

import haxe.Exception;
import go.Syntax;

function main() {
    var x = foo();
    assert(x == true);
    assert(foo2() == false);
    while (true) {
        try {
            if (x) {
                break;
            }
        }
        assert(false);
        break;
    }
    var loop = true;
    var reached = false;
    while (loop) {
        loop = false;
        try {
            throw "issue";
        }catch(_) {
            reached = true;
            break;
        }
        assert(false);
        break;
    }
    assert(reached == true);
    
    for (i in 0...4) {
        try {
            if (x) {
                continue;
            }
        }
        assert(false);
        break;
    }

    for (i in 0...4) {
        try {
            if (x) {
                throw "issue";
            }
        }catch(_) {
            if (x) {
                continue;
            }
        }
        assert(false);
        break;
    }
    
    testGo();
    testTypedCatch();
    testLoopInsideTry();
}

// a break/continue belongs to the nearest enclosing loop, even when that loop sits inside a try --
// these used to unwind the whole try, dropping everything after the loop
function testLoopInsideTry() {
    assert(sumTo(4) == 6);

    var log = [];
    try {
        for (i in 0...5) {
            if (i == 1) continue;
            if (i == 3) break;
            log.push(i);
        }
        log.push(9);
    } catch (_) {
        log.push(-1);
    }
    assert(log.join(",") == "0,2,9");
}

function sumTo(n:Int):Int {
    try {
        var sum = 0;
        var i = 0;
        while (true) {
            if (i >= n) break;
            sum += i;
            i++;
        }
        return sum; // unreachable while `break` unwinds the try closure
    } catch (_) {
        return -1;
    }
}

class MyError {
    public var code:Int;
    public function new(code:Int) this.code = code;
}

class MyException extends Exception {}

// every throw is wrapped by Exception.thrown(), so a catch has to dig the value back out --
// these used to be recovered and silently dropped, leaving the try's result empty
function testTypedCatch() {
    var log = [];
    for (i in 0...5) {
        try {
            switch i {
                case 0: throw new MyError(7);
                case 1: throw new MyException("sub");
                case 2: throw new Exception("base");
                case 3: throw "str";
                case _: throw [1];
            }
        } catch (e:MyError) log.push('MyError${e.code}')
          catch (e:MyException) log.push('MyException${e.message}')
          // catches the last two too: a value throw arrives wrapped in a ValueException
          catch (e:Exception) log.push('Exception${e.message}');
    }
    assert(log.join(",") == "MyError7,MyExceptionsub,Exceptionbase,Exceptionstr,Exception[1]");

    // an unmatched catch must rethrow, not swallow
    var outer = "none";
    try {
        try {
            throw new MyError(1);
        } catch (e:String) outer = "wrong";
    } catch (e:MyError) outer = "rethrown";
    assert(outer == "rethrown");
}

function foo():Bool {
    try {
        return true;
    } catch(_) {
        return false;
    }
}

function foo2():Bool {
    try {
        try {
            throw "issue";
        }catch(_) {
            throw "issue";
        }
        return true;
    } catch(_) {
        return false;
    }
}

function testGo() {
	testTC(true,true); // Go code generation test - go internal error
    testTC(true,false); // Go code generation test - go string error
	testTC(false,false); // Haxe code generation test
}

var x:Int = 10;
var y:Int = 0;

function testTC(goCode:Bool, goError:Bool) {
    var haxeMessage:String = "This is a test error.";
    var goMessage:String = "This is a test string error from Go.";
	try {
		if (goCode) {
			// go.Fmt.printf("\nGo exception generation test\n");
            if (goError) {
                var result = Syntax.code("{0}/{1}", x, y); // This will cause a division by zero error
            } else {
        		go.Syntax.code("panic({0})", goMessage); // This will cause a panic with a string message
            }
		} else {
			// go.Fmt.printf("\nHaxe exception generation test\n");
			throw haxeMessage;
		}
	} catch (e:Dynamic) {
		var isException:Bool = false;
		go.Syntax.code("_, {0} = {1}.(*Hx_Obj_haxe_exception)", isException, e);
		assert(isException);

        if (goCode && goError) { // Check that the exception.native value is a Go error 
            var isGoError:Bool = false;
            var nativeError = (e:Exception).native;
            go.Syntax.code("_, {0} = {1}.(error)", isGoError, nativeError); 
            assert(isGoError);
        }

        if (!goError) { // Check that the correct message is returned
            if (goCode) {
                assert((e:Exception).toString() == goMessage);
            } else {
                assert((e:Exception).toString() == haxeMessage);
            }
        }
	}
}