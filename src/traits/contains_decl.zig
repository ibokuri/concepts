const std = @import("std");

pub fn containsDecl(comptime name: []const u8, comptime T: type) bool {
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

    try std.testing.expect(!containsDecl("a", A));
    try std.testing.expect(containsDecl("a", B));
    try std.testing.expect(containsDecl("b", B));
    try std.testing.expect(containsDecl("useless", B));
    try std.testing.expect(!containsDecl("c", B));
}
