# swift-css-types

A Swift package that provides a strongly-typed domain model of CSS properties and values. The CSS types in this package closely mirror the CSS specification, enabling compile-time validation of CSS property values.

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

This package is currently in active development and is subject to changes. Features and APIs may change without prior notice until a stable release is available.

## Features

- **Type-safe CSS properties and types**: All CSS properties and types represented as Swift types
- **Goal of complete CSS coverage**: At-rules, combinators, functions, pseudo-classes, pseudo-selectors, and selectors are a work in progress
- **Bring Your Own integration**: Designed as a foundation for Swift packages that provide a Swift CSS Domain Specific Language (DSL)

## Examples

```swift
import CSS

// Create type-safe CSS values
let color: CSS.Color = .rgba(red: 100, green: 149, blue: 237, alpha: 1) // rgb(100, 149, 237)
let fontSize: Length = 24.px // 24px

// Create type-safe CSS properties
let backgroundColor = BackgroundColor(color)
let fontSizeProperty = FontSize(fontSize)
```

## Installation

### Swift Package Manager

Add the dependency in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/coenttb/swift-css-types", from: "0.0.1")
]
```

### Xcode

1. Select File > Add Packages...
2. Enter package URL: `https://github.com/coenttb/swift-css-types`
3. Select version 0.0.1 or "Up to Next Major Version"

## Related Projects

* [swift-html-types](https://www.github.com/coenttb/swift-html-types): A Swift package that provides a strongly-typed domain model of HTML elements and attributes.
* [swift-html](https://www.github.com/coenttb/swift-html): A Swift DSL for domain-accurate and type-safe HTML & CSS.
* [swift-web](https://www.github.com/coenttb/swift-web): Foundational tools for web development in Swift.
* [coenttb-com-server](https://www.github.com/coenttb/coenttb-com-server): 100% Swift server & website, built in `swift-html-types`.

## Contribution

Contributions are welcome! Please feel free to submit a Pull Request.

## Feedback

If you have suggestions or find issues, please open a GitHub issue. Your feedback helps make this project better for everyone.

> [Subscribe to my newsletter](http://coenttb.com/en/newsletter/subscribe)
>
> [Follow me on X](http://x.com/coenttb)
> 
> [Connect on LinkedIn](https://www.linkedin.com/in/tenthijeboonkkamp)

## License

This project is licensed under the Apache 2.0 License. See [LICENSE](LICENSE) for details.
