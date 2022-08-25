const std = @import("std");

const concepts = @import("../lib.zig");

pub fn hasFields(comptime T: type, comptime names: anytype) bool {
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
            if (!concepts.traits.hasField(T, name)) {
                return false;
            }
        }

        return true;
    }
}

test {
    //const T = struct {
    //a: u32,
    //b: u32,
    //};

    //try std.testing.expect(hasFields(T, .{ "a", "b" }));

    //try std.testing.expect(!hasFields(T, .{}));
    //try std.testing.expect(!hasFields(T, .{ "a", "c" }));
    //try std.testing.expect(!hasFields(*T, .{ "a", "b" }));
    //try std.testing.expect(!hasFields(**T, .{ "a", "b" }));
    //try std.testing.expect(!hasFields(u8, .{ "a", "b" }));
}
