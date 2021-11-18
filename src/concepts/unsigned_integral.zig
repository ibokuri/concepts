const concepts = @import("../lib.zig");

const concept = "UnsignedIntegral";

pub fn unsignedIntegral(value: anytype) void {
    const T = @TypeOf(value);

    comptime {
        if (!concepts.traits.isIntegral(T) or concepts.traits.isSignedIntegral(T)) {
            concepts.fail(concept, "");
        }
    }
}
