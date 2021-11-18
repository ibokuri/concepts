const concepts = @import("../lib.zig");

const concept = "Decl";

pub fn decl(tuple: anytype) void {
    const T = @TypeOf(tuple);

    comptime {
        // Invariants
        concepts.tuple(T);

        if (tuple.len != 2) {
            concepts.err(concept, "expected two-tuple, found `" ++ @typeName(T) ++ "`");
        }

        concepts.is(.{ @TypeOf(tuple[0]), type });
        concepts.string(@TypeOf(tuple[1]));

        // Constraints
        if (!concepts.traits.isContainer(tuple[0])) {
            concepts.fail(concept, "type `" ++ @typeName(tuple[0]) ++ "` is not a container");
        }

        if (!concepts.traits.containsDecl(tuple[0], tuple[1])) {
            concepts.fail(concept, "type `" ++ @typeName(tuple[0]) ++ "` has no `" ++ tuple[1] ++ "` declaration");
        }
    }
}
