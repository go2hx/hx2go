package unit;


private typedef Point2D = {
    x: Float,
    y: Float
};

private typedef Point3D = Point2D & {
    z: Float
};

function main() {
    var vec3: Point3D = { x: 1.0, y: 2.0, z: 3.0 };
    var vec2: Point2D = vec3;

    assert(vec3.x == 1.0);
    assert(vec3.y == 2.0);
    assert(vec3.z == 3.0);
    assert(vec2.x == 1.0);
    assert(vec2.y == 2.0);
}
