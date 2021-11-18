const concepts = @import("../lib.zig");

const concept = "Is";

pub fn is(tuple: anytype) void {
    const T = @TypeOf(tuple);

    comptime {
        // Invariants
        concepts.tuple(T);

        if (tuple.len != 2) {
            concepts.err(concept, "expected two-tuple, found `" ++ @typeName(T) ++ "`");
        }

        if (@TypeOf(tuple[0]) != type) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(tuple[0])) ++ "`");
        }

        if (@TypeOf(tuple[1]) != type) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(tuple[1])) ++ "`");
        }

        // Constraints
        if (tuple[0] != tuple[1]) {
            concepts.fail(concept, "`" ++ @typeName(tuple[0]) ++ "` is not `" ++ @typeName(tuple[1]) ++ "`");
        }
    }
}
