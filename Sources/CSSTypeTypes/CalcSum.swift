import Foundation

/// Represents a CSS calculation expression that performs mathematical operations.
///
/// The `CalcSum` data type is used within CSS `calc()` and other math functions to
/// perform arithmetic operations (addition, subtraction, multiplication, division)
/// between CSS values.
///
/// Example:
/// ```swift
/// .width(.calc("100% - 20px"))             // Width is 100% minus 20px
/// .margin(.calc("2em + 20px"))             // Margin is 2em plus 20px
/// .fontSize(.calc("clamp(1rem, 2vw, 2rem)")) // Font size uses clamp function
/// ```
///
/// - Note: In CSS calculations, different units can be combined in meaningful ways.
///         For example, you can add lengths with different units, or mix percentages
///         with absolute lengths.
///
/// - SeeAlso: [MDN Web Docs on calc function](https://developer.mozilla.org/en-US/docs/Web/CSS/calc)
public struct CalcSum: Sendable, Hashable {
    /// The calculation expression as a string
    private let expression: String

    /// Creates a new calculation with the given expression
    ///
    /// - Parameter expression: A valid CSS calculation expression
    public init(_ expression: String) {
        self.expression = expression
    }

    /// Creates a CSS calc() function with the given expression
    ///
    /// - Parameter expression: A valid CSS calculation expression
    /// - Returns: A CalcSum instance representing the calculation
    public static func calc(_ expression: String) -> CalcSum {
        return CalcSum(expression)
    }

    /// Creates a CSS min() function with the given expressions
    ///
    /// - Parameter expressions: A comma-separated list of values
    /// - Returns: A CalcSum instance representing the min function
    public static func min(_ expressions: String) -> CalcSum {
        return CalcSum("min(\(expressions))")
    }

    /// Creates a CSS max() function with the given expressions
    ///
    /// - Parameter expressions: A comma-separated list of values
    /// - Returns: A CalcSum instance representing the max function
    public static func max(_ expressions: String) -> CalcSum {
        return CalcSum("max(\(expressions))")
    }

    /// Creates a CSS clamp() function with the given expressions
    ///
    /// - Parameters:
    ///   - min: The minimum value
    ///   - preferred: The preferred value
    ///   - max: The maximum value
    /// - Returns: A CalcSum instance representing the clamp function
    public static func clamp(min: String, preferred: String, max: String) -> CalcSum {
        return CalcSum("clamp(\(min), \(preferred), \(max))")
    }
}

/// Provides string conversion for CSS output
extension CalcSum: CustomStringConvertible {
    /// Converts the calculation expression to its CSS string representation
    ///
    /// This method returns the expression wrapped in a calc() function if not already
    /// a CSS math function. It also handles expressions containing nested math functions.
    public var description: String {
        // If the expression already IS a complete math function, return it as is
        if (expression.hasPrefix("min(") && expression.hasSuffix(")"))
            || (expression.hasPrefix("max(") && expression.hasSuffix(")"))
            || (expression.hasPrefix("clamp(") && expression.hasSuffix(")"))
            || (expression.hasPrefix("calc(") && expression.hasSuffix(")"))
        {
            return expression
        }

        // Otherwise, wrap it in calc(), regardless of whether it contains math functions
        return "calc(\(expression))"
    }
}
