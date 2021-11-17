const traits = @import("../traits.zig");

const concept = "String";

pub fn string(value: anytype) void {
    const T = @TypeOf(value);

    if (comptime !traits.isString(T)) {
        @compileError("concept " ++ concept ++ " was not satisfied");
    }
}
