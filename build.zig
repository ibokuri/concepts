const std = @import("std");

const package_name = "concepts";
const package_path = "src/lib.zig";

const tests = [_][]const u8{
    "src/traits.zig",
};

pub fn build(b: *std.build.Builder) void {
    // Options
    const mode = b.standardReleaseOptions();
    const target = b.standardTargetOptions(.{});

    // Tests
    const step = b.step("test", "Run framework tests");

    for (tests) |path| {
        const t = b.addTest(path);

        t.setBuildMode(mode);
        t.setTarget(target);
        t.addPackagePath(package_name, package_path);

        step.dependOn(&t.step);
    }

    // Library
    const lib = b.addStaticLibrary(package_name, package_path);

    lib.setBuildMode(mode);
    lib.setTarget(target);
    lib.install();
}
