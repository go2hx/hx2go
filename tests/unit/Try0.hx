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
        throw "impossible";
    }

    while (true) {
        try {
            throw "issue";
        }catch(_) {
            break;
        }
        throw "impossible";
    }

    for (i in 0...4) {
        try {
            if (x) {
                continue;
            }
        }
        throw "impossible";
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
        throw "impossible";
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