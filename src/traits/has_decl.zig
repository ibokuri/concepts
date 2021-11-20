const std = @import("std");

const concepts = @import("../lib.zig");

pub fn hasDecl(comptime T: type, comptime name: []const u8) bool {
    comptime concepts.container(T);

    return @hasDecl(T, name);
}

test {
    const A = struct {};
    const B = struct {
        pub var a: u32 = undefined;

        pub var b: u32 = undefined;

        c: bool,

        pub fn useless() void {}
    };

    try std.testing.expect(!hasDecl(A, "a"));
    try std.testing.expect(hasDecl(B, "a"));
    try std.testing.expect(hasDecl(B, "b"));
    try std.testing.expect(hasDecl(B, "useless"));
    try std.testing.expect(!hasDecl(B, "c"));
}
