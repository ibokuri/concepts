const traits = @import("../traits.zig");

const concept = "Integral";

pub fn integral(value: anytype) void {
    const T = @TypeOf(value);

    if (comptime !traits.isIntegral(T)) {
        @compileError("concept " ++ concept ++ " was not satisfied");
    }
}
