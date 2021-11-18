const concepts = @import("../lib.zig");

const concept = "UnsignedIntegral";

pub fn unsignedIntegral(T: anytype) void {
    comptime {
        if (!concepts.traits.is(@TypeOf(T), type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(T)) ++ "`");
        }
    }

    comptime {
        if (!concepts.traits.isIntegral(T) or concepts.traits.isSignedIntegral(T)) {
            concepts.fail(concept, "");
        }
    }
}
