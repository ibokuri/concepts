const concepts = @import("../lib.zig");

const concept = "SignedIntegral";

pub fn signedIntegral(value: anytype) void {
    comptime {
        if (!concepts.traits.isSignedIntegral(@TypeOf(value))) {
            concepts.fail(concept, "");
        }
    }
}
