# swift-css-types

[![CI](https://github.com/coenttb/swift-css-types/workflows/CI/badge.svg)](https://github.com/coenttb/swift-css-types/actions/workflows/ci.yml)
![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

A Swift package providing strongly-typed CSS properties, types, and values with compile-time validation.

## Overview

swift-css-types provides a type-safe representation of CSS that mirrors the CSS specification. The package is designed as a foundation for building Swift-based CSS DSLs and tools, offering compile-time guarantees for CSS property values.

## Features

- **Complete CSS type coverage**: Types for colors, lengths, angles, times, and all CSS data types
- **Type-safe CSS properties**: Over 500 CSS properties represented as Swift types
- **CSS at-rules**: Support for `@media`, `@layer`, `@container`, and other at-rules
- **Modular architecture**: Separate modules for types, properties, selectors, and combinators
- **Foundation for CSS DSLs**: Designed to be integrated into higher-level Swift CSS libraries

## Installation

### Swift Package Manager

Add the dependency in your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-css-types", from: "0.0.1")
]
```

### Xcode

1. Select File > Add Packages...
2. Enter package URL: `https://github.com/coenttb/swift-css-types`
3. Select version 0.0.1 or "Up to Next Major Version"

## Quick Start

```swift
import CSSTypeTypes
import CSSPropertyTypes

// Create type-safe CSS color values
let red: Color = .rgb(255, 0, 0)                    // rgb(255, 0, 0)
let blueTransparent: Color = .rgba(100, 149, 237, 0.5)  // rgba(100, 149, 237, 0.5)
let green: Color = .hex("#00ff00")                  // #00ff00

// Create length values
let fontSize: Length = .px(24)                       // 24px
let margin: Length = .rem(2)                         // 2rem
let width: LengthPercentage = .percentage(50)        // 50%

// Access CSS property types
let bgColor: BackgroundColor = .init(.named(.blue))
let fontSizeProp: FontSize = .init(.px(16))
```

## Usage

### Working with CSS Types

The package provides types for all CSS data types:

```swift
// Colors
let namedColor: Color = .named(.red)
let hexColor: Color = .hex("#ff0000")
let rgbColor: Color = .rgb(255, 0, 0)
let hslColor: Color = .hsl(.degrees(0), 100, 50)

// Lengths and dimensions
let pixels: Length = .px(16)
let rems: Length = .rem(1.5)
let viewportWidth: Length = .vw(50)
let calc: Length = .calc("100% - 20px")

// Angles
let degrees: Angle = .deg(45)
let radians: Angle = .rad(1.57)

// Times
let seconds: Time = .s(2)
let milliseconds: Time = .ms(500)
```

### Working with CSS Properties

Each CSS property is represented as a strongly-typed struct:

```swift
import CSSPropertyTypes

// Background properties
let bgColor = BackgroundColor(.hex("#f0f0f0"))
let bgImage = BackgroundImage(.url("image.png"))

// Text properties
let textColor = Color.color(.rgb(50, 50, 50))
let fontSize = FontSize(.rem(1.2))
let lineHeight: LineHeight = 1.5

// Layout properties
let display = Display.flex
let width = Width(.percentage(100))
let padding = Padding(.px(16))
```

### Working with Media Queries

```swift
import CSSAtRuleTypes

// Basic media queries
let screenQuery = Media.screen
let printQuery = Media.print

// Feature queries
let darkMode = Media.prefersColorScheme(.dark)
let wideScreen = Media.minWidth(.px(1024))

// Combined queries
let responsiveDark = Media.screen
    .and(Media.minWidth(.px(768)))
    .and(Media.prefersColorScheme(.dark))

// Using operators
let mobileOrTablet = Media.maxWidth(.px(768)) || Media.maxWidth(.px(1024))
```

## Module Structure

The package is organized into focused modules:

- **CSSTypeTypes**: Core CSS data types (Color, Length, Angle, etc.)
- **CSSPropertyTypes**: CSS properties (BackgroundColor, FontSize, etc.)
- **CSSAtRuleTypes**: CSS at-rules (@media, @layer, @container, etc.)
- **CSSSelectorTypes**: CSS selectors (class, id, type, etc.)
- **CSSPseudoClassTypes**: Pseudo-classes (:hover, :active, etc.)
- **CSSPseudoElementTypes**: Pseudo-elements (::before, ::after, etc.)
- **CSSCombinatorTypes**: CSS combinators (descendant, child, sibling, etc.)
- **CSSFunctionTypes**: CSS functions (calc, var, etc.)
- **CSSTypes**: Umbrella module combining all above modules

## Requirements

- Swift 5.9+
- macOS 14.0+ / iOS 17.0+ / Linux

## Related Packages

- [swift-html-types](https://www.github.com/coenttb/swift-html-types): A complete Swift domain model of HTML elements and attributes
- [swift-html](https://www.github.com/coenttb/swift-html): A Swift DSL for type-safe HTML & CSS, integrating swift-css and pointfree-html
- [swift-web](https://www.github.com/coenttb/swift-web): A collection of types and functions for dealing with common web server concerns
- [coenttb-com-server](https://www.github.com/coenttb/coenttb-com-server): The coenttb.com website, built with swift-html

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the Apache 2.0 License. See [LICENSE](LICENSE) for details.
