import Foundation

/// Represents a CSS string value.
///
/// The `CSSString` type represents a sequence of characters used in CSS properties
/// such as `content`, `font-family`, and `quotes`. It handles proper escaping of
/// special characters and formatting according to CSS string syntax requirements.
///
/// Example:
/// ```swift
/// .content(.string("Hello, world!"))  // content: "Hello, world!"
/// .quotes(.string("""), .string("""))  // quotes: """ """
/// ```
///
/// - Note: CSS strings can be delimited by either double quotes or single quotes.
///         This implementation uses double quotes by default.
///
/// - SeeAlso: [MDN Web Docs on string](https://developer.mozilla.org/en-US/docs/Web/CSS/string)
public struct CSSString: Sendable, Hashable {
    /// The raw string value
    public let value: String

    public enum Quotes: Sendable, Hashable {
        case single
        case double
    }

    /// Whether to use single quotes (true) or double quotes (false)
    public let quotes: Quotes

    /// Creates a new CSS string value with the given raw string
    ///
    /// - Parameters:
    ///   - value: The string value
    ///   - quotes: Whether to use single quotes (true) or double quotes (false)
    public init(_ value: String, quotes: Quotes = .single) {
        self.value = value
        self.quotes = quotes
    }

    /// Creates an empty CSS string value
    public static let empty = CSSString("")
}

/// Provides string conversion for CSS output
extension CSSString: CustomStringConvertible {
    /// Converts the CSS string to its properly escaped CSS string representation
    public var description: String {
        let escaped = escapeString(value, quotes: quotes)
        return quotes == .single ? "'\(escaped)'" : "\"\(escaped)\""
    }

    /// Escapes a string according to CSS string rules
    ///
    /// - Parameters:
    ///   - string: The raw string to escape
    ///   - quotes: Whether single quotes (true) or double quotes (false) are used for delimiting
    /// - Returns: An escaped string ready for CSS output
    private func escapeString(_ string: String, quotes: Quotes) -> String {
        var result = ""

        for char in string {
            switch char {
            case "\"" where quotes == .double:
                // Escape double quotes in double-quoted strings
                result += "\\\""
            case "'" where quotes == .single:
                // Escape single quotes in single-quoted strings
                result += "\\'"
            case "\\":
                // Escape backslashes
                result += "\\\\"
            case "\n":
                // Convert newlines to CSS escape sequence
                result += "\\A "
            default:
                result.append(char)
            }
        }

        return result
    }
}

/// String literal conversion
extension CSSString: ExpressibleByStringLiteral {
    /// Creates a CSS string from a string literal
    public init(stringLiteral value: StringLiteralType) {
        self.init(value)
    }
}

/// String literal conversion
extension CSSString: ExpressibleByStringInterpolation {

}
