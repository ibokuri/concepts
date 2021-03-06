# Concepts

The Concepts library provides compile-time validation of type constraints.

## Contents

* [Overview](#overview)
* [Installation](#installation)
* [API Reference](#api-reference)
* [License](#license)

## Overview

A trait is a property of a type (e.g., `isIntegral`). A concept is a named set
of traits (e.g., `integral`).

```zig
const std = @import("std");

const concepts = @import("concepts");

pub fn main() anyerror!void {
    comptime {
        concepts.integral(i32);
        concepts.same(i32, i32);

        arrayList(std.ArrayList(u8));
        arrayList(std.ArrayListUnmanaged(u8)); // error: concept `ArrayList` was not satisfied
    }
}

/// arrayList is a concept that requires `T` to be a `std.ArrayList`.
fn arrayList(comptime T: type) void {
    comptime concepts.Concept("ArrayList", "")(.{
        concepts.traits.hasDecl(T, "Slice"),
        concepts.traits.isSlice(T.Slice),
        concepts.traits.isSame(T, std.ArrayList(std.meta.Child(T.Slice))),
    });
}
```


## Installation

### Manual

1. Install the library.

    ```
    git clone https://github.com/ibokuri/concepts lib/concepts
    ```

2. Add the library as a package in `build.zig`.

    ```diff
    const std = @import("std");

    pub fn build(b: *std.build.Builder) void {

        ...

        obj.setTarget(target);
        obj.setBuildMode(mode);
    +   obj.addPackagePath("concepts", "lib/concepts/src/lib.zig");
        obj.install();
    }
    ```

### Gyro

1. Install the library.

    ```
    gyro add -s github ibokuri/concepts
    gyro fetch
    gyro update
    ```

2. Add the library as a package in `build.zig`.

    ```diff
    const std = @import("std");
    +const pkgs = @import("deps.zig").pkgs;

    pub fn build(b: *std.build.Builder) void {

        ...

        obj.setTarget(target);
        obj.setBuildMode(mode);
    +   pkgs.addAllTo(obj);
        obj.install();
    }
    ```

## API Reference

### `concepts`

#### [General](src/lib.zig)

- `err` - Generates a compile error due to an invariant violation during concept validation.
- `fail` - Generates a compile error due to a concept being unsatisfied.

#### [Concepts](src/concepts)

- `container` - Specifies that a type is a container type.
- `decl` - Specifies that a type contains a given declaration.
- `extern` - Specifies that a type has an `extern` in-memory layout.
- `field` - Specifies that a type contains a given field.
- `float` - Specifies that a type is a floating-point type.
- `integral` - Specifies that a type is an integral type.
- `method` - Specifies that a type contains a given function.
- `packed` - Specifies that a type has a `packed` in-memory layout.
- `same` - Specifies that a type is the same as another type.
- `signedIntegral` - Specifies that a type is an integral type that is signed.
- `slice` - Specifies that a type is a slice type.
- `string` - Specifies that a type is a string type.
- `tuple` - Specifies that a type is a tuple type.
- `unsignedIntegral` - Specifies that a type is an integral type that is unsigned.

### `concepts.traits`

#### [Traits](src/traits)

- `hasDecl` - Checks if a type contains a given declaration.
- `hasDecls` - Checks if a type contains a given set of declarations.
- `hasField` - Checks if a type contains a given field.
- `hasFields` - Checks if a type contains a given set of fields.
- `hasFunction` - Checks if a type contains a given function.
- `hasFunctions` - Checks if a type contains a given set of functions.
- `isContainer` - Checks if a type is a container type.
- `isExtern` - Checks if a type has an `extern` in-memory layout.
- `isFloat` - Checks if a type is a floating-point type.
- `isIntegral` - Checks if a type is an integral type.
- `isPacked` - Checks if a type has a `packed` in-memory layout.
- `isSame` - Checks if two types are equal.
- `isSignedIntegral` - Checks if a type is an integral type that is signed.
- `isSlice` - Checks if a type is a slice type.
- `isString` - Checks if a type is a string type.
- `isTuple` - Checks if a type is a tuple type.

## License

See [LICENSE](LICENSE) for more detail.
