const concepts = @import("../concepts.zig");
const traits = @import("../traits.zig");

const concept = "Is";

pub fn is(value: anytype) void {
    concepts.tuple(value);

    const Value = @TypeOf(value);

    if (value.len != 2) {
        @compileError("expected two-tuple, found `" ++ @typeName(Value) ++ "`");
    }

    const T = @TypeOf(value[0]);
    const Expected = value[1];

    if (comptime !traits.is(@TypeOf(Expected), type)) {
        @compileError("expected type, found `" ++ @typeName(Value) ++ "`");
    }

    if (T != Expected) {
        @compileError("concept " ++ concept ++ " was not satisfied");
    }
}
