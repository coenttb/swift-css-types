//
//  AngleConvertible.swift
//  swift-css
//
//  Created on 03/23/2025.
//

import Foundation

/// Protocol for types that can be created from CSS Angle values
///
/// AngleConvertible provides a common interface for types that accept CSS angle values.
/// This enables consistent handling of angle values across different CSS properties,
/// allowing for ergonomic API design and code reuse.
///
/// Types that conform to this protocol can be initialized with any CSS Angle value
/// and gain access to a standard set of factory methods for creating instances with
/// common CSS units.
///
/// Example:
/// ```swift
/// // GridTrack conforms to AngleConvertible
/// GridTrack.px(100)      // 100px
/// GridTrack.fr(1)        // 1fr
/// GridTrack.percentage(50)  // 50%
///
/// // Direct conversion from Angle values
/// let angle: Angle = .px(200)
/// let track = GridTrack(angle)
/// ```
///
/// This protocol is particularly useful for CSS properties that accept angle values
/// but require specific types for additional functionality or validation.
public protocol AngleConvertible {
    /// Creates an instance from a CSS Angle value
    ///
    /// This is the core method of the protocol that all conforming types must implement.
    /// It defines how to convert a generic CSS Angle into the specific type.
    ///
    /// - Parameter angle: A CSS Angle value
    /// - Returns: An instance of the conforming type
    ///
    /// Example implementation:
    /// ```swift
    /// static func angle(_ length: CSS.Angle) -> Self {
    ///     return Self(cssValue: length.description)
    /// }
    /// ```
    static func angle(_ angle: Angle) -> Self
}

/// Default initializer for AngleConvertible types
extension AngleConvertible {
    /// Creates an instance from a CSS Angle value
    ///
    /// This initializer provides a convenient way to create a angle-convertible instance
    /// directly from a Angle value.
    ///
    /// - Parameter angle: A CSS Angle value
    ///
    /// Example:
    /// ```swift
    /// let angle: Angle = .px(100)
    /// let gridTrack = GridTrack(angle)
    /// ```
    public init(_ angle: Angle) {
        self = .angle(angle)
    }
}

extension AngleConvertible {

    /// Creates some AngleConvertible with a degree value
    ///
    /// - Parameter value: The degree value
    /// - Returns: An OffsetRotate with the specified angle
    public static func deg(_ value: Double) -> Self {
        .angle(.deg(value))
    }

    /// Creates some AngleConvertible with a radian value
    ///
    /// - Parameter value: The radian value
    /// - Returns: An OffsetRotate with the specified angle
    public static func rad(_ value: Double) -> Self {
        .angle(.rad(value))
    }

    /// Creates some AngleConvertible with a gradian value
    ///
    /// - Parameter value: The gradian value
    /// - Returns: An OffsetRotate with the specified angle
    public static func grad(_ value: Double) -> Self {
        .angle(.grad(value))
    }

    /// Creates some AngleConvertible with a turn value
    ///
    /// - Parameter value: The turn value (1.0 = full 360° turn)
    /// - Returns: Some AngleConvertible with the specified angle
    public static func turn(_ value: Double) -> Self {
        .angle(.turn(value))
    }

    /// Creates some AngleConvertible value from degrees
    ///
    /// - Parameter value: The angle in degrees
    /// - Returns: A Hue value with degrees
    public static func degrees(_ value: Double) -> Self {
        return .angle(.degrees(value))
    }

    /// Creates some AngleConvertible value from gradians
    ///
    /// - Parameter value: The angle in gradians
    /// - Returns: An AngleConvertible value with gradians
    public static func gradians(_ value: Double) -> Self {
        return .angle(.gradians(value))
    }

    /// Creates some AngleConvertible value from radians
    ///
    /// - Parameter value: The angle in radians
    /// - Returns: A Hue value with radians
    public static func radians(_ value: Double) -> Self {
        return .angle(.radians(value))
    }
}
