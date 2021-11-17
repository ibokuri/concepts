const concepts = @import("../lib.zig");

const concept = "Field";

pub fn field(value: anytype) void {
    const Value = @TypeOf(value);

    comptime {
        if (!concepts.traits.isTuple(@TypeOf(value))) {
            concepts.err(concept, "expected tuple, found `" ++ @typeName(Value) ++ "`");
        }

        if (value.len != 2) {
            concepts.err(concept, "expected two-tuple, found `" ++ @typeName(Value) ++ "`");
        }

        if (!concepts.traits.is(@TypeOf(value[0]), type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(value[0])) ++ "`");
        }

        if (!concepts.traits.isString(@TypeOf(value[1]))) {
            concepts.err(concept, "expected comptime-known string, found `" ++ @typeName(@TypeOf(value[1])) ++ "`");
        }
    }

    comptime {
        // TODO: container check

        if (!concepts.traits.containsField(value[0], value[1])) {
            concepts.fail(concept, "`" ++ value[1] ++ "` is not a field in type `" ++ @typeName(value[0]) ++ "`");
        }
    }
}
