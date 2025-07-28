import Foundation

/// Represents a CSS @charset at-rule.
///
/// The @charset CSS at-rule specifies the character encoding used in the style sheet.
/// It must be placed at the very beginning of the style sheet, with no other characters
/// (except possibly a UTF byte-order mark) before it.
///
/// Examples:
/// ```swift
/// // Specify UTF-8 encoding
/// CharSet.utf8
///
/// // Specify a custom encoding
/// CharSet("iso-8859-15")
/// ```
public struct CharSet: AtRule {
    public static let identifier: String = "charset"

    public var rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }

    /// Creates a charset declaration with the specified encoding.
    ///
    /// - Parameter encoding: The character encoding name. Must be a valid encoding name.
    public init(_ encoding: String) {
        self.rawValue = "@charset \"\(encoding)\";"
    }

    // Common character encodings as static properties

    /// UTF-8 character encoding.
    public static let utf8 = CharSet("UTF-8")

    /// UTF-16 character encoding.
    public static let utf16 = CharSet("UTF-16")

    /// ISO-8859-1 character encoding (Latin-1).
    public static let latin1 = CharSet("ISO-8859-1")

    /// ISO-8859-15 character encoding (Latin-9).
    public static let latin9 = CharSet("ISO-8859-15")

    /// Windows-1252 character encoding.
    public static let windows1252 = CharSet("windows-1252")
}
