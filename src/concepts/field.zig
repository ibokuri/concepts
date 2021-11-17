const concepts = @import("../concepts.zig");
const traits = @import("../traits.zig");

const concept = "Field";

pub fn field(value: anytype) void {
    concepts.tuple(value);

    const Value = @TypeOf(value);

    if (value.len != 2) {
        @compileError("expected two-tuple, found `" ++ @typeName(Value) ++ "`");
    }

    const T = value[0];
    const name = value[1];

    if (comptime !traits.is(@TypeOf(T), type)) {
        @compileError("expected type, found `" ++ @typeName(@TypeOf(T)) ++ "`");
    }

    concepts.string(name);

    if (comptime !traits.containsField(T, name)) {
        @compileError("concept " ++ concept ++ " was not satisfied");
    }
}
