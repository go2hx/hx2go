package unit;

function main() {
    #if go
    var server:go.net.http.Server = {addr: ":8080"};
    assert(server.addr == ":8080");
    #end
}
