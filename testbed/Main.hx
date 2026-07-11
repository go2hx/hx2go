import go.Map;

function main() {
    var m: Map<String, Int> = new Map();
    m["John"] = 25;
    m["Alice"] = 30;

    for (name in m.keys().toArray()) {
        trace(name, 'is', m[name], 'years old');
    }

    for (v in m.values().toArray()) {
        trace('age', v);
    }

    trace(m.exists("John"));
    trace(m.exists("Bob"));

    trace(m, m.size());
    m.remove("Alice");
    trace(m, m.size());
    m.clear();
    trace(m, m.size());
}