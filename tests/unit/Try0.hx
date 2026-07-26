package unit;

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