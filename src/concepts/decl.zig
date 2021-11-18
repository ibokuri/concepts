const concepts = @import("../lib.zig");

const concept = "Decl";

pub fn decl(tuple: anytype) void {
    const T = @TypeOf(tuple);

    comptime {
        if (!concepts.traits.isTuple(T)) {
            concepts.err(concept, "expected tuple, found `" ++ @typeName(T) ++ "`");
        }

        if (tuple.len != 2) {
            concepts.err(concept, "expected two-tuple, found `" ++ @typeName(T) ++ "`");
        }

        if (!concepts.traits.isString(@TypeOf(tuple[0]))) {
            concepts.err(concept, "expected comptime-known string, found `" ++ @typeName(@TypeOf(tuple[0])) ++ "`");
        }

        if (!concepts.traits.is(@TypeOf(tuple[1]), type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(tuple[1])) ++ "`");
        }
    }

    comptime {
        if (!concepts.traits.isContainer(tuple[1])) {
            concepts.fail(concept, "type `" ++ @typeName(tuple[1]) ++ "` is not a container");
        }

        if (!concepts.traits.containsDecl(tuple[0], tuple[1])) {
            concepts.fail(concept, "type `" ++ @typeName(tuple[1]) ++ "` has no `" ++ tuple[0] ++ "` declaration");
        }
    }
}
