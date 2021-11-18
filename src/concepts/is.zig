const concepts = @import("../concepts.zig");

const concept = "Is";

pub fn is(value: anytype) void {
    const T = @TypeOf(value);

    comptime {
        if (!concepts.traits.isTuple(T)) {
            concepts.err(concept, "expected tuple, found `" ++ @typeName(T) ++ "`");
        }

        if (value.len != 2) {
            concepts.err(concept, "expected two-tuple, found `" ++ @typeName(T) ++ "`");
        }

        if (!concepts.traits.is(@TypeOf(value[1]), type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(value[0])) ++ "`");
        }
    }

    comptime {
        if (@TypeOf(value[0]) != value[1]) {
            concepts.fail(concept, "");
        }
    }
}
