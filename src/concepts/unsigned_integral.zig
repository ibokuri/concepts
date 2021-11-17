const traits = @import("../traits.zig");

const concept = "UnsignedIntegral";

pub fn unsignedIntegral(value: anytype) void {
    const T = @TypeOf(value);

    if (comptime !traits.isIntegral(T) or traits.isSignedIntegral(T)) {
        @compileError("concept " ++ concept ++ " was not satisfied");
    }
}
