pub const traits = struct {
    pub usingnamespace @import("traits/has_decl.zig");
    pub usingnamespace @import("traits/has_field.zig");
    pub usingnamespace @import("traits/has_function.zig");
    pub usingnamespace @import("traits/has_functions.zig");
    pub usingnamespace @import("traits/is_container.zig");
    pub usingnamespace @import("traits/is_extern.zig");
    pub usingnamespace @import("traits/is_float.zig");
    pub usingnamespace @import("traits/is_function.zig");
    pub usingnamespace @import("traits/is_integral.zig");
    pub usingnamespace @import("traits/is_packed.zig");
    pub usingnamespace @import("traits/is_same.zig");
    pub usingnamespace @import("traits/is_signed_integral.zig");
    pub usingnamespace @import("traits/is_slice.zig");
    pub usingnamespace @import("traits/is_string.zig");
    pub usingnamespace @import("traits/is_tuple.zig");
};

const concepts = struct {
    pub usingnamespace @import("concepts/container.zig");
    pub usingnamespace @import("concepts/decl.zig");
    pub usingnamespace @import("concepts/extern.zig");
    pub usingnamespace @import("concepts/field.zig");
    pub usingnamespace @import("concepts/float.zig");
    pub usingnamespace @import("concepts/integral.zig");
    pub usingnamespace @import("concepts/method.zig");
    pub usingnamespace @import("concepts/packed.zig");
    pub usingnamespace @import("concepts/same.zig");
    pub usingnamespace @import("concepts/signed_integral.zig");
    pub usingnamespace @import("concepts/slice.zig");
    pub usingnamespace @import("concepts/string.zig");
    pub usingnamespace @import("concepts/tuple.zig");
    pub usingnamespace @import("concepts/unsigned_integral.zig");
};

pub usingnamespace concepts;

pub fn err(comptime concept: []const u8, comptime msg: []const u8) void {
    const base = "concept `" ++ concept ++ "` could not be satisfied";
    const extra = " (" ++ msg ++ ")";

    comptime {
        switch (msg.len) {
            0 => @compileError(base),
            else => @compileError(base ++ extra),
        }
    }
}

pub fn fail(comptime concept: []const u8, comptime msg: []const u8) void {
    const base = "concept `" ++ concept ++ "` was not satisfied";
    const extra = " (" ++ msg ++ ")";

    comptime {
        switch (msg.len) {
            0 => @compileError(base),
            else => @compileError(base ++ extra),
        }
    }
}

comptime {
    @import("std").testing.refAllDecls(@This());
}
