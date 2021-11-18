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
        if (!concepts.traits.isContainer(T)) {
            concepts.fail("ArrayList", "type `" ++ name ++ "` is not a container");
        }

        if (!concepts.traits.containsDecl("Slice", T)) {
            concepts.fail("ArrayList", "missing `Slice` declaration");
        }

        if (!concepts.traits.isSlice(T.Slice)) {
            concepts.fail("ArrayList", "`Slice` declaration is not a slice");
        }

        if (!concepts.traits.is(T, std.ArrayList(std.meta.Child(T.Slice)))) {
            concepts.fail("ArrayList", "`" ++ name ++ "` is not `std.ArrayList`");
        }
    }
}
