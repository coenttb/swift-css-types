import Foundation

/// Represents a CSS identifier string.
///
/// The `Ident` type represents an arbitrary string used as an identifier in CSS.
/// Identifiers can include letters, numbers, hyphens, underscores, and escaped characters,
/// with certain restrictions on the first character.
///
/// Example:
/// ```swift
/// .animation(.ident("fadeIn"))     // Reference to animation name
/// .counter(.ident("section"))      // Reference to a counter name
/// ```
///
/// - Note: CSS identifiers are case-sensitive. They cannot start with an unescaped digit,
///         and cannot start with an unescaped hyphen followed by a digit.
///
/// - SeeAlso: [MDN Web Docs on ident](https://developer.mozilla.org/en-US/docs/Web/CSS/ident)
public struct Ident: Sendable, Hashable {
    /// The identifier string value
    public let value: String

    /// Creates an identifier from a string value.
    ///
    /// - Parameter value: The identifier string
    /// - Note: The initializer does not validate that the string is a valid CSS identifier
    public init(_ value: String) {
        self.value = value
    }

    /// Checks if the identifier is valid according to CSS syntax rules.
    ///
    /// A valid CSS identifier:
    /// - Can contain letters, numbers, hyphens, underscores, and escaped characters
    /// - Cannot start with a digit
    /// - Cannot start with a hyphen followed by a digit
    ///
    /// - Returns: True if the identifier is valid
    public var isValid: Bool {
        // Basic pattern for valid CSS identifiers
        let pattern = "^-?[_a-zA-Z\\u00A0-\\uFFFF][_a-zA-Z0-9\\-\\u00A0-\\uFFFF]*$"

        // Check if the identifier starts with a hyphen followed by a digit
        let startsWithHyphenDigit =
            value.hasPrefix("-") && value.count > 1
            && value[value.index(after: value.startIndex)].isNumber

        if startsWithHyphenDigit {
            return false
        }

        // Check against the pattern
        let regex = try? NSRegularExpression(pattern: pattern)
        let range = NSRange(location: 0, length: value.utf16.count)
        return regex?.firstMatch(in: value, range: range) != nil
    }

    /// Escapes the identifier for use in CSS.
    ///
    /// This method adds necessary escaping for characters that need to be escaped in CSS.
    ///
    /// - Returns: The escaped identifier string
    public func escaped() -> String {
        var result = ""

        for (i, char) in value.enumerated() {
            if i == 0 && char.isNumber {
                // Escape first character if it's a digit
                result += "\\3" + String(char) + " "
            } else if !char.isLetter && !char.isNumber && char != "-" && char != "_" {
                // Escape special characters
                let unicode = String(format: "%04X", char.unicodeScalars.first?.value ?? 0)
                result += "\\" + unicode + " "
            } else {
                result += String(char)
            }
        }

        return result
    }
}

extension Ident: ExpressibleByStringLiteral {
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }
}

/// Provides string conversion for CSS output
extension Ident: CustomStringConvertible {
    /// Converts the identifier to its CSS string representation
    ///
    /// This method returns the raw identifier without any escaping. For identifiers that
    /// need escaping, use the `escaped()` method.
    public var description: String {
        return value
    }
}
