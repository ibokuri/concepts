const traits = @import("../traits.zig");

const concept = "UnsignedIntegral";

pub fn unsignedIntegral(value: anytype) void {
    const T = @TypeOf(value);

    switch (comptime traits.isIntegral(T) and !traits.isSignedIntegral(T)) {
        true => {},
        false => @compileError("concept " ++ concept ++ " was not satisfied"),
    }
}
