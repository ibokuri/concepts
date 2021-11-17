const std = @import("std");

pub fn isPacked(comptime T: type) bool {
    return std.meta.trait.isPacked(T);
}

test "Packed" {
    const A = packed struct {};
    const B = struct {};

    try std.testing.expect(isPacked(A));
    try std.testing.expect(!isPacked(B));
}
