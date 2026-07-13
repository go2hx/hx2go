package unit;

function main() {
    assert(get(97) == 'a');
}

inline function get(c) {
    return String.fromCharCode(c);
}