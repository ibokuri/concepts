const traits = @import("../traits.zig");

const concept = "Tuple";

pub fn tuple(value: anytype) void {
    const T = @TypeOf(value);

    if (comptime !traits.isTuple(T)) {
        @compileError("concept " ++ concept ++ " was not satisfied");
    }
}
