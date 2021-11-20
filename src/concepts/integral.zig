const concepts = @import("../lib.zig");

const concept = "Integral";

pub fn integral(comptime T: type) void {
    comptime {
        if (!concepts.traits.isIntegral(T)) {
            concepts.fail(concept, "");
        }
    }
}
