const concepts = @import("../lib.zig");

const concept = "Integral";

pub fn integral(T: anytype) void {
    comptime {
        if (!concepts.traits.is(@TypeOf(T), type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(T)) ++ "`");
        }
    }
    comptime {
        if (!concepts.traits.isIntegral(T)) {
            concepts.fail(concept, "");
        }
    }
}
