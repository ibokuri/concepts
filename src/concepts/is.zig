const concepts = @import("../concepts.zig");

const concept = "Is";

pub fn is(tuple: anytype) void {
    const T = @TypeOf(tuple);

    comptime {
        if (!concepts.traits.isTuple(T)) {
            concepts.err(concept, "expected tuple, found `" ++ @typeName(T) ++ "`");
        }

        if (tuple.len != 2) {
            concepts.err(concept, "expected two-tuple, found `" ++ @typeName(T) ++ "`");
        }

        if (!concepts.traits.is(tuple[0], type) or !concepts.trait.is(tuple[1], type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(tuple[0])) ++ "`");
        }
    }

    comptime {
        if (tuple[0] != tuple[1]) {
            concepts.fail(concept, "");
        }
    }
}
