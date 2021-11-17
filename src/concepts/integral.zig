const concepts = @import("../lib.zig");

const name = "Integral";

pub fn integral(value: anytype) void {
    if (comptime !concepts.traits.isIntegral(@TypeOf(value))) {
        concepts.fail(name, "");
    }
}
