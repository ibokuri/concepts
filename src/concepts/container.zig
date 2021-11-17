const concepts = @import("../lib.zig");

const name = "Container";

pub fn container(value: anytype) void {
    if (comptime !concepts.traits.isContainer(@TypeOf(value))) {
        concepts.fail(name, "");
    }
}
