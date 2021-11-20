const std = @import("std");

pub fn isExtern(comptime T: type) bool {
    return std.meta.trait.isExtern(T);
}

test {
    const A = extern struct {};
    const B = struct {};

    try std.testing.expect(isExtern(A));
    try std.testing.expect(!isExtern(B));
}
