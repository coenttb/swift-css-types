//
//  PercentageConvertible.swift
//  swift-css
//
//  Created on 03/23/2025.
//

import Foundation

public protocol PercentageConvertible {
    static func percentage(_ percentage: Percentage) -> Self
}

/// Default initializer for PercentageConvertible types
extension PercentageConvertible {
    /// Creates an instance from a CSS Percentage value
    ///
    /// This initializer provides a convenient way to create a percentage-convertible instance
    /// directly from a Percentage value.
    ///
    /// - Parameter percentage: A CSS Percentage value
    ///
    /// Example:
    /// ```swift
    /// let percentage: Percentage = .px(100)
    /// let gridTrack = GridTrack(percentage)
    /// ```
    public init(_ percentage: Percentage) {
        self = .percentage(percentage)
    }
}

extension PercentageConvertible {
    /// Creates a CSS percentage value of 0%
    public static var zero: Self { .init(.zero) }

    /// Creates a CSS percentage value of 50%
    public static var half: Self { .init(.half) }

    /// Creates a CSS percentage value of 100%
    public static var full: Self { .init(.full) }

    /// Convenience to create a CSS percentage if you prefer calling it `percent` instead of `percentage`.
    public static func percent(_ percent: Percentage) -> Self {
        .percentage(percent)
    }
}
