package unit;


function main() {
    var stat_closure = announce;
    var stat_closure_bound = stat_closure.bind("Bob");

    assert(stat_closure("Elisa") == "Elisa has been announced");
    assert(stat_closure_bound() == "Bob has been announced");
}

function announce(name: String): String {
    return '$name has been announced';
}
