const concepts = @import("../lib.zig");

const concept = "UnsignedIntegral";

pub fn unsignedIntegral(comptime T: type) void {
    comptime {
        if (!concepts.traits.isIntegral(T) or concepts.traits.isSignedIntegral(T)) {
            concepts.fail(concept, "");
        }
    }
}
