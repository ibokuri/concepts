const std = @import("std");
const concepts = @import("../lib.zig");

const concept = "ArrayList";

pub fn arrayList(T: anytype) void {
    const name = @typeName(T);

    comptime {
        if (!concepts.traits.is(@TypeOf(T), type)) {
            concepts.err(concept, "expected type `type`, found `" ++ name ++ "`");
        }
    }

    comptime {
        if (!std.mem.startsWith(u8, @typeName(T), "std.array_list")) {
            concepts.fail("ArrayList", "`" ++ name ++ "` is not `std.ArrayList`");
        }
    }
}
