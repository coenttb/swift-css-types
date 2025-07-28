import Foundation

/// Represents mathematical constants that can be used in CSS calculations.
///
/// The `CalcKeyword` data type provides well-defined mathematical constants
/// that can be used within CSS math functions like `calc()`, `min()`, and `max()`.
///
/// Example:
/// ```swift
/// .rotate(.calc("1rad * pi"))       // Rotate by π radians
/// .width(.calc("min(100%, e * 10px)"))  // Width based on e constant
/// ```
///
/// - Note: These constants are only valid within CSS math functions.
///         They must be used inside `calc()` or other math functions,
///         not directly as property values.
///
/// - SeeAlso: [MDN Web Docs on calc-keyword values](https://developer.mozilla.org/en-US/docs/Web/CSS/calc-keyword)
public enum CalcKeyword: String, Sendable, Hashable {
    /// The base of the natural logarithm (approximately 2.718)
    ///
    /// Useful in exponential calculations.
    /// ```css
    /// width: calc(e * 10px); /* Approximately 27.18px */
    /// ```
    case e = "e"

    /// The ratio of a circle's circumference to its diameter (approximately 3.142)
    ///
    /// Useful in trigonometric calculations.
    /// ```css
    /// transform: rotate(calc(pi * 1rad)); /* Rotate 180 degrees */
    /// ```
    case pi = "pi"

    /// Represents positive infinity
    ///
    /// Used to indicate the largest possible value.
    /// ```css
    /// width: calc(min(infinity * 1px, 100%)); /* Effectively 100% */
    /// ```
    case infinity = "infinity"

    /// Represents negative infinity
    ///
    /// Used to indicate the smallest possible value.
    /// ```css
    /// width: calc(max(-infinity * 1px, 100px)); /* Effectively 100px */
    /// ```
    case negativeInfinity = "-infinity"

    /// Represents "Not a Number"
    ///
    /// Results from invalid mathematical operations.
    /// ```css
    /// /* This would be treated as auto or 0 depending on the property */
    /// width: calc(NaN * 1px);
    /// ```
    case NaN = "NaN"
}

/// Provides string conversion for CSS output
extension CalcKeyword: CustomStringConvertible {
    /// Converts the calculation keyword to its CSS string representation
    ///
    /// This method returns the raw string value for use in CSS properties.
    public var description: String {
        return rawValue
    }
}
