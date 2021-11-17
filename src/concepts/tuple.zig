const traits = @import("../traits.zig");

const concept = "Tuple";

pub fn tuple(value: anytype) void {
    const T = @TypeOf(value);

    switch (comptime traits.isTuple(T)) {
        true => {},
        false => @compileError("concept " ++ concept ++ " was not satisfied"),
    }
}
