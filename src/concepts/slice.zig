const traits = @import("../traits.zig");

const concept = "Slice";

pub fn slice(value: anytype) void {
    const T = @TypeOf(value);

    if (comptime !traits.isSlice(T)) {
        @compileError("concept " ++ concept ++ " was not satisfied");
    }
}
