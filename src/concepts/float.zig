const concepts = @import("../lib.zig");

const concept = "Float";

pub fn float(T: anytype) void {
    comptime {
        if (!concepts.traits.is(@TypeOf(T), type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(T)) ++ "`");
        }
    }

    comptime {
        if (!concepts.traits.isFloat(T)) {
            concepts.fail(concept, "");
        }
    }
}
