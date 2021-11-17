const std = @import("std");

pub fn isContainer(comptime T: type) bool {
    return std.meta.trait.isContainer(T);
}

test "Container" {
    const Struct = struct {};
    const Union = union { a: void };
    const Enum = enum { A, B };
    const Opaque = opaque {};

    try std.testing.expect(isContainer(Struct));
    try std.testing.expect(isContainer(Union));
    try std.testing.expect(isContainer(Enum));
    try std.testing.expect(isContainer(Opaque));
    try std.testing.expect(!isContainer(u8));
}
