const std = @import("std");

pub fn containsDecl(comptime T: type, comptime name: []const u8) bool {
    return @hasDecl(T, name);
}

test "Decl" {
    const A = struct {};
    const B = struct {
        pub var a: u32 = undefined;

        pub var b: u32 = undefined;

        c: bool,

        pub fn useless() void {}
    };

    try std.testing.expect(!containsDecl(A, "a"));
    try std.testing.expect(containsDecl(B, "a"));
    try std.testing.expect(containsDecl(B, "b"));
    try std.testing.expect(containsDecl(B, "useless"));
    try std.testing.expect(!containsDecl(B, "c"));
}
