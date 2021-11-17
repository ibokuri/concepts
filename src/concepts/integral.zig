const traits = @import("../traits.zig");

const concept = "Integral";

pub fn integral(value: anytype) void {
    const T = @TypeOf(value);

    switch (comptime traits.isIntegral(T)) {
        true => {},
        false => @compileError("concept " ++ concept ++ " was not satisfied"),
    }
}
