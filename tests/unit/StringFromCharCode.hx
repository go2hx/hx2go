package unit;

function main() {
    trace(get(97) == 'a');
}

inline function get(c) {
    return String.fromCharCode(c);
}