const std = @import("std");
const concepts = @import("../lib.zig");

const concept = "ArrayList";

pub fn arrayList(T: anytype) void {
    comptime {
        // Invariants
        concepts.is(.{ @TypeOf(T), type });

        // Constraints
        if (!std.mem.startsWith(u8, @typeName(T), "std.array_list")) {
            concepts.fail(concept, "type `" ++ @typeName(T) ++ "` is not `std.ArrayList`");
        }
    }
}
