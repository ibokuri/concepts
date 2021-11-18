const concepts = @import("../lib.zig");

const concept = "SignedIntegral";

pub fn signedIntegral(T: anytype) void {
    comptime {
        if (!concepts.traits.is(@TypeOf(T), type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(T)) ++ "`");
        }
    }

    comptime {
        if (!concepts.traits.isSignedIntegral(T)) {
            concepts.fail(concept, "");
        }
    }
}
