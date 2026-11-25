package unit;

function main() {
    var x = [1, 2, 3];
    var x_dyn: Dynamic = x;
    var push = x.push;
    var pop = x.pop;
    var push_dyn = x_dyn.push;
    var pop_dyn = x_dyn.pop;
    
    assert(push == x.push);
    assert(pop == x.pop);
    assert(push_dyn == x.push);
    assert(pop_dyn == x.pop);
    assert(push == push_dyn);
    assert(pop == pop_dyn);
}