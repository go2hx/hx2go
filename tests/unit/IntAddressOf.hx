package unit;

function main() {
    #if go
    var x = go.Pointer.addressOf(10);
    Sys.println(x);
    #end
}