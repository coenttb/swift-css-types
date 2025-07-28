import Foundation

/// Represents a CSS dashed identifier for user-defined custom properties and values.
///
/// The `DashedIdent` data type denotes arbitrary user-defined strings that start with two dashes
/// (`--`). These are used for CSS custom properties, color profiles, font palette values, and
/// other user-defined entities in CSS.
///
/// Example:
/// ```swift
/// .var(.custom("--primary-color"))       // Access a custom property
/// .fontPalette(.custom("--brand-palette")) // Use a custom font palette
/// ```
///
/// - Note: Unlike standard CSS keywords and property names, dashed identifiers
///         will never be defined by CSS itself, so they're guaranteed to be
///         user-defined and won't cause naming conflicts.
///
/// - SeeAlso: [MDN Web Docs on dashed-ident values](https://developer.mozilla.org/en-US/docs/Web/CSS/dashed-ident)
public struct DashedIdent: Sendable, Hashable {
    /// The string value of the dashed identifier
    private let value: String

    /// Creates a new dashed identifier with the given value
    ///
    /// - Parameter value: A valid CSS dashed identifier string
    /// - Note: This initializer ensures the value begins with two dashes.
    ///         If the value doesn't start with `--`, they will be added.
    public init(_ value: String) {
        if value.hasPrefix("--") {
            self.value = value
        } else {
            self.value = "--\(value)"
        }
    }

    /// Creates a dashed identifier from a string literal
    ///
    /// - Parameter value: A string literal to use as the identifier
    /// - Note: This initializer ensures the value begins with two dashes.
    public init(stringLiteral value: String) {
        self.init(value)
    }

    /// Creates a custom dashed identifier with a valid value
    ///
    /// - Parameter value: A string to convert to a valid CSS dashed identifier
    /// - Returns: A DashedIdent instance with a valid CSS dashed identifier
    /// - Note: This method will add the `--` prefix if not present and
    ///         handle basic validation of the identifier.
    public static func custom(_ value: String) -> DashedIdent {
        return DashedIdent(value)
    }

    /// Creates a CSS custom property variable reference
    ///
    /// - Parameter name: The name of the custom property (with or without `--` prefix)
    /// - Returns: A string representing the CSS `var()` function call
    public static func `var`(_ name: DashedIdent) -> String {
        return "var(\(name))"
    }

    /// Creates a CSS custom property variable reference with a fallback value
    ///
    /// - Parameters:
    ///   - name: The name of the custom property (with or without `--` prefix)
    ///   - fallback: The fallback value to use if the custom property is not defined
    /// - Returns: A string representing the CSS `var()` function call with fallback
    public static func `var`(_ name: DashedIdent, fallback: String) -> String {
        return "var(\(name), \(fallback))"
    }
}

/// Makes DashedIdent expressible as a string literal
extension DashedIdent: ExpressibleByStringLiteral {}

/// Provides string conversion for CSS output
extension DashedIdent: CustomStringConvertible {
    /// Converts the dashed identifier to its CSS string representation
    ///
    /// This method returns the identifier value as a string.
    public var description: String {
        return value
    }
}
