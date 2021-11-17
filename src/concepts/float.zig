const traits = @import("../traits.zig");

const concept = "Float";

pub fn float(value: anytype) void {
    const T = @TypeOf(value);

    if (comptime !traits.isFloat(T)) {
        @compileError("concept " ++ concept ++ " was not satisfied");
    }
}
