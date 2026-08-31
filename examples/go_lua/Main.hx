import go.github_com.shopify.go_lua.Lua;

function main() {
    var l = Lua.newState();
    Lua.openLibraries(l);
    Lua.doString(l, 'print("hello world")').sure();
}