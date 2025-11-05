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

    /// Formats a Double value as a string with a specified number of decimal places,
    /// removing the decimal point and trailing zeros if the value is a whole number.
    ///
    /// This is useful for CSS property values that require precise control over decimal places,
    /// such as percentages or opacity values.
    ///
    /// Examples:
    /// ```swift
    /// Double.truncatingRemainder(2.0, digits: 2)    // Returns "2"
    /// Double.truncatingRemainder(2.5, digits: 2)    // Returns "2.5"
    /// Double.truncatingRemainder(2.123456, digits: 3)  // Returns "2.123"
    /// ```
    ///
    /// - Parameters:
    ///   - value: The Double value to format
    ///   - digits: The number of decimal places to include
    /// - Returns: A string representation of the value with controlled decimal precision
    public static func truncatingRemainder(_ value: Double, digits: Int) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return .init(Int(value))
        } else {
            let factor = pow(10, Double(digits))
            let rounded = (value * factor).rounded() / factor

            // Format the string with the specified number of decimal places
            let formatter = NumberFormatter()
            formatter.maximumFractionDigits = digits
            formatter.minimumFractionDigits = 1  // Always show at least .0 if not an integer

            if let formattedString = formatter.string(from: NSNumber(value: rounded)) {
                return formattedString
            } else {
                return .init(rounded)  // Fallback if formatting fails
            }
        }
    }

    /// Instance method version of truncatingRemainder with specified decimal places.
    ///
    /// Examples:
    /// ```swift
    /// let percentage = 33.333333
    /// percentage.truncatingRemainder(digits: 2)  // Returns "33.33"
    /// ```
    ///
    /// - Parameter digits: The number of decimal places to include
    /// - Returns: A string representation of the value with controlled decimal precision
    public func truncatingRemainder(digits: Int) -> String {
        Self.truncatingRemainder(self, digits: digits)
    }
}
