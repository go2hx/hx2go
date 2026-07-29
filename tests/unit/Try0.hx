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
                assert((e:Exception).toString() == "Error: " + goMessage);
            } else {
                assert((e:Exception).toString() == "Error: " + haxeMessage);
            }
        }
	}
}