const concepts = @import("../lib.zig");

const concept = "Decl";

pub fn decl(value: anytype) void {
    const T = @TypeOf(value);

    comptime {
        if (!concepts.traits.isTuple(T)) {
            concepts.err(concept, "expected tuple, found `" ++ @typeName(T) ++ "`");
        }

        if (value.len != 2) {
            concepts.err(concept, "expected two-tuple, found `" ++ @typeName(T) ++ "`");
        }

        if (!concepts.traits.isString(@TypeOf(value[0]))) {
            concepts.err(concept, "expected comptime-known string, found `" ++ @typeName(@TypeOf(value[0])) ++ "`");
        }

        if (!concepts.traits.is(@TypeOf(value[1]), type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(value[1])) ++ "`");
        }
    }

    comptime {
        if (!concepts.traits.isContainer(value[1])) {
            concepts.fail(concept, "type `" ++ @typeName(value[1]) ++ "` is not a container");
        }

        if (!concepts.traits.containsDecl(value[0], value[1])) {
            concepts.fail(concept, "type `" ++ @typeName(value[1]) ++ "` has no `" ++ value[0] ++ "` declaration");
        }
    }
}
