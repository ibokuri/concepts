const traits = @import("traits");

const concept = "Integral";

pub fn integral(value: anytype) void {
    const T = @TypeOf(value);

    switch (traits.isIntegral(T)) {
        true => {},
        false => @compileError("concept " ++ concept ++ " was not satisfied"),
    }
}
