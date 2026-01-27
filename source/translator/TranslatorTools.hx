package translator;

function toPascalCase(s: String) {
    return s.charAt(0).toUpperCase() + s.substr(1);
}

function toCamelCase(s: String) {
    return s.charAt(0).toLowerCase() + s.substr(1);
}

function modulePathToPrefix(m: String): String {
    return m.split('.').map(x -> x.toLowerCase()).join('_');
}