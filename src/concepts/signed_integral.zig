const traits = @import("../traits.zig");

const concept = "SignedIntegral";

pub fn signedIntegral(value: anytype) void {
    const T = @TypeOf(value);

    switch (comptime traits.isSignedIntegral(T)) {
        true => {},
        false => @compileError("concept " ++ concept ++ " was not satisfied"),
    }
}
