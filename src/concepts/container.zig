const concepts = @import("../lib.zig");

const concept = "Container";

pub fn container(T: anytype) void {
    comptime {
        if (!concepts.traits.is(@TypeOf(T), type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(T) ++ "`");
        }
    }

    comptime {
        if (!concepts.traits.isContainer(T)) {
            concepts.fail(concept, "");
        }
    }
}
