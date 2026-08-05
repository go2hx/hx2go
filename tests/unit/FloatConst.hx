package unit;
function main() {
    #if !hl
    assert(std.Type.typeof(0f64) == std.Type.ValueType.TFloat);
    #end
}