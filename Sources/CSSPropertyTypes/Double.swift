//
//  Double.swift
//  swift-css
//
//  Created by Coen ten Thije Boonkkamp on 25/03/2025.
//

import Foundation

/// Provides utility extensions for Double values used in CSS properties.
///
/// These extensions provide convenient methods for handling floating-point values in CSS,
/// such as truncating decimal places when they're not needed.
extension Double {
    /// Formats a Double value as a string, removing the decimal point and trailing zeros if the value is a whole number.
    ///
    /// This is useful for CSS property values that should be output as integers when possible,
    /// but as floating-point numbers when necessary.
    ///
    /// Examples:
    /// ```swift
    /// Double.truncatingRemainder(2.0)  // Returns "2"
    /// Double.truncatingRemainder(2.5)  // Returns "2.5"
    /// ```
    ///
    /// - Parameter value: The Double value to format
    /// - Returns: A string representation of the value, with decimal places removed if not needed
    public static func truncatingRemainder(_ value: Double) -> String {
        return
            "\(value.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(value)) : String(value))"
    }

    /// Instance method version of truncatingRemainder that operates on the Double value itself.
    ///
    /// Examples:
    /// ```swift
    /// let scale = 2.0
    /// scale.truncatingRemainder()  // Returns "2"
    ///
    /// let opacity = 0.5
    /// opacity.truncatingRemainder()  // Returns "0.5"
    /// ```
    ///
    /// - Returns: A string representation of the value, with decimal places removed if not needed
    public func truncatingRemainder() -> String {
        Self.truncatingRemainder(self)
    }
}
