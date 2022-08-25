const std = @import("std");

const concepts = @import("../lib.zig");

pub fn hasDecls(comptime T: type, comptime names: anytype) bool {
    comptime {
        // Invariants
        concepts.tuple(@TypeOf(names));

        for (std.meta.fields(@TypeOf(names))) |field| {
            concepts.string(field.field_type);
        }

        // Constraints
        if (names.len == 0) {
            return false;
        }

        for (names) |name| {
            if (!concepts.traits.hasDecl(T, name)) {
                return false;
            }
        }

        return true;
    }
}

test {
    const A = struct {};
    const B = struct {
        pub var a: u32 = undefined;

        pub var b: u32 = undefined;

        c: bool,

        pub fn useless() void {}
    };

    try std.testing.expect(hasDecls(B, .{ "a", "b", "useless" }));

    try std.testing.expect(!hasDecls(A, .{}));
    //try std.testing.expect(!hasDecls(A, .{"a"}));
    try std.testing.expect(!hasDecls(B, .{ "a", "b", "c" }));

    //try std.testing.expect(!hasDecls(u8, .{"a"}));
}
