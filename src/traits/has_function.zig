const std = @import("std");

const concepts = @import("../lib.zig");

pub fn hasFunction(comptime T: type, comptime name: []const u8) bool {
    comptime if (!concepts.traits.isContainer(T)) return false;

    return std.meta.trait.hasFn(name)(T);
}

test {
    const T = struct {
        pub fn f() void {}
    };

    try std.testing.expect(hasFunction(T, "f"));
    try std.testing.expect(!hasFunction(T, "non-existent"));
    try std.testing.expect(!hasFunction(u8, "f"));
}
