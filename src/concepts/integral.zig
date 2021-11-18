const concepts = @import("../lib.zig");

const concept = "Integral";

pub fn integral(value: anytype) void {
    comptime {
        if (!concepts.traits.isIntegral(@TypeOf(value))) {
            concepts.fail(concept, "");
        }
    }
}
