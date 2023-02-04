const std = @import("std");

const concepts = @import("../lib.zig");

pub fn hasFunctions(comptime T: type, comptime names: anytype) bool {
    comptime {
        // Invariants
        concepts.tuple(@TypeOf(names));

        for (std.meta.fields(@TypeOf(names))) |field| {
            concepts.string(field.type);
        }

        // Constraints
        if (names.len == 0) {
            return false;
        }

        for (names) |name| {
            if (!concepts.traits.hasFunction(T, name)) {
                return false;
            }
        }

        return true;
    }
}

test {
    const T = struct {
        pub fn a() void {}
        pub fn b() void {}
    };

    try std.testing.expect(hasFunctions(T, .{ "a", "b" }));

    try std.testing.expect(!hasFunctions(T, .{}));
    try std.testing.expect(!hasFunctions(T, .{ "a", "non-existent" }));
    try std.testing.expect(!hasFunctions(u8, .{"a"}));
}
