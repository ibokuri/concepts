const traits = @import("../traits.zig");

const concept = "SignedIntegral";

pub fn signedIntegral(value: anytype) void {
    const T = @TypeOf(value);

    if (comptime !traits.isSignedIntegral(T)) {
        @compileError("concept " ++ concept ++ " was not satisfied");
    }
}
