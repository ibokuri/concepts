const traits = @import("../traits.zig");

const concept = "Packed";

pub fn @"packed"(value: anytype) void {
    const T = @TypeOf(value);

    if (comptime !traits.isPacked(T)) {
        @compileError("concept " ++ concept ++ " was not satisfied");
    }
}
