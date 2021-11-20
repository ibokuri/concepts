# Concepts

The Concepts library provides compile-time validation of type constraints via
**traits** and **concepts**.

## Contents

* [Overview](#overview)
* [Installation](#installation)
* [Motivation](#motivation)
* [API Reference](#api-reference)
* [Contributing](#contributing)
* [License](#license)

## Overview

A trait is a property of a type (e.g., `IsIntegral`). A concept is a named set
of traits (e.g., `Integral`);

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

## Motivation

In general, there are two ways to enforce type constraints in Zig: compile-time
duck typing and type reflection.

### Duck Typing

The problem with duck typing is that the error messages it generates are pretty
awful:

```
error: no field named 'items' in '[3]u8'
    for (list.items) |v| {

note: called from here
    print([_]u8{ 1, 2, 3 });

note: called from here
    pub fn main() anyerror!void {

```

Can you guess what type `print` expects its input to be? The answer is nobody
knows! From the compiler error we got, `print` could accept a `std.ArrayList`,
`struct { items: [5]bool }`, or any other type with an iterable `items` field!

### Type Reflection

Another way to enforce type constraints is by using type reflection.
Essentially, you query a type for information and then raise a compiler error
(with whatever message you want) if the information does not match your set of
constraints.

Unfortunately, I've found that type reflection is only nice to use when you
have a handful of simple type constraints. When you need consistent and
thorough enforcement of many (potentially complex) type constraints, using
reflection quickly becomes tedious. You end up with a bunch of copy-and-pasted
`if` or `switch` statements that differ only in the string literal passed to
`@compileError`.

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
- `is` - Specifies that a type is the same as another type.
- `packed` - Specifies that a type has a `packed` in-memory layout.
- `signedIntegral` - Specifies that a type is an integral type that is signed.
- `slice` - Specifies that a type is a slice type.
- `string` - Specifies that a type is a string type.
- `tuple` - Specifies that a type is a tuple type.
- `unsignedIntegral` - Specifies that a type is an integral type that is unsigned.

### `concepts.traits`

#### [Traits](src/traits)

- `hasDecl` - Checks if a type contains a given declaration.
- `hasField` - Checks if a type contains a given field.
- `is` - Checks if two types are equal.
- `isContainer` - Checks if a type is a container type.
- `isExtern` - Checks if a type has an `extern` in-memory layout.
- `isFloat` - Checks if a type is a floating-point type.
- `isIntegral` - Checks if a type is an integral type.
- `isPacked` - Checks if a type has a `packed` in-memory layout.
- `isSignedIntegral` - Checks if a type is an integral type that is signed.
- `isSlice` - Checks if a type is a slice type.
- `isString` - Checks if a type is a string type.
- `isTuple` - Checks if a type is a tuple type.
- `isUnsignedIntegral` - Checks if a type is an integral type that is unsigned.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more detail.

## License

See [LICENSE](LICENSE) for more detail.
