const concepts = @import("../lib.zig");

const concept = "Tuple";

///
///
/// The `Is` concept cannot be used as an invariant since it depends on the
/// `Tuple` concept.
pub fn tuple(T: anytype) void {
    comptime {
        // Invariants
        if (@TypeOf(T) != type) {
            concepts.err(concept, "type `" ++ @typeName(@TypeOf(T)) ++ "` is not `type`");
        }

        // Constraints
        if (!concepts.traits.isTuple(T)) {
            concepts.fail(concept, "type `" ++ @typeName(T) ++ "` is not a tuple type");
        }
    }
}
