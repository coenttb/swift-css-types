//
//  LengthConvertible.swift
//  swift-css
//
//  Created on 03/23/2025.
//

import Foundation

/// Protocol for types that can be created from CSS Length values
///
/// LengthConvertible provides a common interface for types that accept CSS length values.
/// This enables consistent handling of length values across different CSS properties,
/// allowing for ergonomic API design and code reuse.
///
/// Types that conform to this protocol can be initialized with any CSS Length value
/// and gain access to a standard set of factory methods for creating instances with
/// common CSS units.
///
/// Example:
/// ```swift
/// // GridTrack conforms to LengthConvertible
/// GridTrack.px(100)      // 100px
/// GridTrack.fr(1)        // 1fr
/// GridTrack.percentage(50)  // 50%
///
/// // Direct conversion from Length values
/// let length: Length = .px(200)
/// let track = GridTrack(length)
/// ```
///
/// This protocol is particularly useful for CSS properties that accept length values
/// but require specific types for additional functionality or validation.
public protocol LengthConvertible {
    /// Creates an instance from a CSS Length value
    ///
    /// This is the core method of the protocol that all conforming types must implement.
    /// It defines how to convert a generic CSS Length into the specific type.
    ///
    /// - Parameter length: A CSS Length value
    /// - Returns: An instance of the conforming type
    ///
    /// Example implementation:
    /// ```swift
    /// static func length(_ length: CSS.Length) -> Self {
    ///     return Self(cssValue: length.description)
    /// }
    /// ```
    static func length(_ length: Length) -> Self
}

/// Default initializer for LengthConvertible types
extension LengthConvertible {
    /// Creates an instance from a CSS Length value
    ///
    /// This initializer provides a convenient way to create a length-convertible instance
    /// directly from a Length value.
    ///
    /// - Parameter length: A CSS Length value
    ///
    /// Example:
    /// ```swift
    /// let length: Length = .px(100)
    /// let gridTrack = GridTrack(length)
    /// ```
    public init(_ length: Length) {
        self = .length(length)
    }
}

/// Factory methods for creating LengthConvertible instances
extension LengthConvertible {
    /// Creates an instance with a fractional unit value
    ///
    /// The fr unit represents a fraction of the available space in a grid container.
    ///
    /// - Parameter value: The number of fractional units
    /// - Returns: A new instance representing the specified fr value
    ///
    /// Example:
    /// ```swift
    /// GridTrack.fr(1)  // 1fr
    /// GridTrack.fr(2)  // 2fr
    /// ```
    public static func fr(_ value: Double) -> Self { .length(.fr(value)) }

    /// Creates an instance with a pixel value
    ///
    /// Pixels (px) are absolute units that represent device pixels.
    ///
    /// - Parameter value: The number of pixels
    /// - Returns: A new instance representing the specified pixel value
    ///
    /// Example:
    /// ```swift
    /// GridTrack.px(100)  // 100px
    /// ```
    public static func px(_ value: Double) -> Self { .length(.px(value)) }

    /// Creates an instance with an em value
    ///
    /// Ems are relative to the font-size of the current element.
    ///
    /// - Parameter value: The number of ems
    /// - Returns: A new instance representing the specified em value
    ///
    /// Example:
    /// ```swift
    /// GridTrack.em(1.5)  // 1.5em
    /// ```
    public static func em(_ value: Double) -> Self { .length(.em(value)) }

    /// Creates an instance with a rem value
    ///
    /// Rems are relative to the font-size of the root element.
    ///
    /// - Parameter value: The number of rems
    /// - Returns: A new instance representing the specified rem value
    ///
    /// Example:
    /// ```swift
    /// GridTrack.rem(1.2)  // 1.2rem
    /// ```
    public static func rem(_ value: Double) -> Self { .length(.rem(value)) }

    /// Creates an instance with a viewport width percentage
    ///
    /// vw units are relative to 1% of the viewport's width.
    ///
    /// - Parameter value: The percentage of viewport width
    /// - Returns: A new instance representing the specified vw value
    ///
    /// Example:
    /// ```swift
    /// GridTrack.vw(50)  // 50vw
    /// ```
    public static func vw(_ value: Double) -> Self { .length(.vw(value)) }

    /// Creates an instance with a viewport height percentage
    ///
    /// vh units are relative to 1% of the viewport's height.
    ///
    /// - Parameter value: The percentage of viewport height
    /// - Returns: A new instance representing the specified vh value
    ///
    /// Example:
    /// ```swift
    /// GridTrack.vh(100)  // 100vh
    /// ```
    public static func vh(_ value: Double) -> Self { .length(.vh(value)) }

    /// Creates an instance with a viewport minimum unit
    ///
    /// vmin units are relative to 1% of the viewport's smaller dimension.
    ///
    /// - Parameter value: The percentage of viewport's smaller dimension
    /// - Returns: A new instance representing the specified vmin value
    ///
    /// Example:
    /// ```swift
    /// GridTrack.vmin(10)  // 10vmin
    /// ```
    public static func vmin(_ value: Double) -> Self { .length(.length(value, .vmin)) }

    /// Creates an instance with a viewport maximum unit
    ///
    /// vmax units are relative to 1% of the viewport's larger dimension.
    ///
    /// - Parameter value: The percentage of viewport's larger dimension
    /// - Returns: A new instance representing the specified vmax value
    ///
    /// Example:
    /// ```swift
    /// GridTrack.vmax(10)  // 10vmax
    /// ```
    public static func vmax(_ value: Double) -> Self { .length(.length(value, .vmax)) }

    //    /// Creates an instance with a CSS calc() expression
    //    ///
    //    /// The calc() function lets you perform calculations to determine CSS property values.
    //    ///
    //    /// - Parameter expression: The calc expression as a string
    //    /// - Returns: A new instance representing the specified calc expression
    //    ///
    //    /// Example:
    //    /// ```swift
    //    /// GridTrack.calc("100% - 20px")  // calc(100% - 20px)
    //    /// ```
    //    public static func calc(_ expression: CSSString) -> Self { .length(.calc(expression)) }
}

// extension LengthConvertible {
//    public static var zero: Self { Self.length(Length.zero) }
// }
