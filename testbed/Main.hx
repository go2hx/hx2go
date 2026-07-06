import go.fmt.Fmt;
typedef Point2D = {
    x: Float,
    y: Float
};

typedef Point3D = Point2D & {
    z: Float
};

function main(): Void {
    var vec3: Point3D = { x: 1.0, y: 2.0, z: 3.0 };
    var vec2: Point2D = vec3;

    Fmt.println(vec2, vec3);
}