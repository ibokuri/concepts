const traits = @import("../traits.zig");

const concept = "Extern";

pub fn @"extern"(value: anytype) void {
    const T = @TypeOf(value);

    if (comptime !traits.isExtern(T)) {
        @compileError("concept " ++ concept ++ " was not satisfied");
    }
}
