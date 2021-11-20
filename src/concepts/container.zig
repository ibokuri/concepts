const concepts = @import("../lib.zig");

const concept = "Container";

pub fn container(comptime T: type) void {
    comptime {
        if (!concepts.traits.isContainer(T)) {
            concepts.fail(concept, "");
        }
    }
}
