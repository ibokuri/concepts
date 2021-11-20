const concepts = @import("../lib.zig");

const concept = "SignedIntegral";

pub fn signedIntegral(comptime T: type) void {
    comptime {
        if (!concepts.traits.isSignedIntegral(T)) {
            concepts.fail(concept, "");
        }
    }
}
