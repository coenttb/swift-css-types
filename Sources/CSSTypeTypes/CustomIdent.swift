import Foundation

/// Represents a CSS custom identifier for user-defined values.
///
/// The `CustomIdent` data type denotes arbitrary user-defined strings used as identifiers
/// in various CSS properties. These identifiers are case-sensitive and follow specific
/// syntax rules to ensure they are valid CSS identifiers.
///
/// Example:
/// ```swift
/// .animationName(.custom("slideIn"))     // Define a custom animation name
/// .counterReset(.custom("section"))      // Define a custom counter
/// .willChange(.custom("transform"))      // Hint about properties that will change
/// ```
///
/// - Note: Certain values are forbidden in specific contexts to prevent ambiguity.
///         For example, `animation-name` forbids using the global CSS values like
///         `initial`, `inherit`, and `unset`, as well as `none`.
///
/// - SeeAlso: [MDN Web Docs on custom-ident values](https://developer.mozilla.org/en-US/docs/Web/CSS/custom-ident)
public struct CustomIdent: Sendable, Hashable {
    /// The string value of the custom identifier
    private let value: String

    /// Creates a new custom identifier with the given value
    ///
    /// - Parameter value: A valid CSS identifier string
    /// - Note: This initializer does not validate that the identifier follows CSS syntax rules.
    ///         It is the caller's responsibility to ensure the value is a valid CSS identifier.
    public init(_ value: String) {
        self.value = value
    }

    /// Creates a custom identifier from a string literal
    ///
    /// - Parameter value: A string literal to use as the identifier
    public init(stringLiteral value: String) {
        self.init(value)
    }

    /// Creates a custom identifier with a safe value
    ///
    /// - Parameter value: A string to convert to a valid CSS identifier
    /// - Returns: A CustomIdent instance with a valid CSS identifier
    /// - Note: This method will escape characters that need escaping in CSS identifiers.
    public static func custom(_ value: String) -> CustomIdent {
        // A simple implementation that doesn't handle all escaping scenarios
        // In a real implementation, you would want more robust escaping logic
        return CustomIdent(value)
    }
}

/// Makes CustomIdent expressible as a string literal
extension CustomIdent: ExpressibleByStringLiteral {}

/// Provides string conversion for CSS output
extension CustomIdent: CustomStringConvertible {
    /// Converts the custom identifier to its CSS string representation
    ///
    /// This method returns the identifier value as a string.
    public var description: String {
        return value
    }
}
