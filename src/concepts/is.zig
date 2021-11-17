const concepts = @import("../concepts.zig");
const traits = @import("../traits.zig");

const concept = "Is";

pub fn is(value: anytype) void {
    concepts.tuple(value);

    const T = @TypeOf(value);
    const Got = @TypeOf(value[0]);
    const Expected = value[1];

    if (value.len != 2) {
        @compileError("expected two-tuple, found `" ++ @typeName(T) ++ "`");
    }

    if (comptime !traits.is(@TypeOf(Expected), type)) {
        @compileError("expected type, found `" ++ @typeName(T) ++ "`");
    }

    if (Got != Expected) {
        @compileError("concept " ++ concept ++ " was not satisfied");
    }
}
