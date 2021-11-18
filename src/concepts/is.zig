const concepts = @import("../concepts.zig");

const concept = "Is";

pub fn is(Types: anytype) void {
    const T = @TypeOf(Types);

    comptime {
        if (!concepts.traits.isTuple(T)) {
            concepts.err(concept, "expected tuple, found `" ++ @typeName(T) ++ "`");
        }

        if (Types.len != 2) {
            concepts.err(concept, "expected two-tuple, found `" ++ @typeName(T) ++ "`");
        }

        if (!concepts.traits.is(Types[0], type) or !concepts.trait.is(Types[1], type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(Types[0])) ++ "`");
        }
    }

    comptime {
        if (Types[0] != Types[1]) {
            concepts.fail(concept, "");
        }
    }
}
