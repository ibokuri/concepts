const std = @import("std");
const concepts = @import("../lib.zig");

const concept = "ArrayList";

pub fn arrayList(value: anytype) void {
    const name = @typeName(@TypeOf(value));

    comptime {
        if (!concepts.traits.startsWith(name, "std.array_list.ArrayList")) {
            concepts.fail("ArrayList", "`" ++ name ++ "` is not `std.ArrayList`");
        }
    }
}
