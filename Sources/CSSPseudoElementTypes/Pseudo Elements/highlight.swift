import Foundation

/// Represents the CSS ::highlight() pseudo-element.
///
/// The `Highlight` pseudo-element applies styles to custom highlight ranges created
/// with the CSS Custom Highlight API. It allows styling of arbitrary text ranges
/// without affecting the DOM structure.
///
/// Example:
/// ```css
/// ::highlight(search-results) {
///     background-color: yellow;
///     color: black;
/// }
/// ```
///
/// The ::highlight() pseudo-element:
/// - Accepts a custom identifier parameter
/// - Is used with the CSS Custom Highlight API
/// - Allows styling of arbitrary text ranges
/// - Does not affect the DOM structure
/// - Supports standard text styling properties
///
/// - SeeAlso: [MDN Web Docs on ::highlight()](https://developer.mozilla.org/en-US/docs/Web/CSS/::highlight)
public struct Highlight: CSSPseudoElement {
    @inlinable public static var name: String { "highlight" }

    /// The custom identifier for this highlight
    public let identifier: String?

    public init(_ identifier: String? = nil) {
        self.identifier = identifier
    }
}

/// Provides string conversion for CSS output
extension Highlight: CustomStringConvertible {
    /// Converts the ::highlight() pseudo-element to its CSS string representation
    public var description: String {
        if let identifier = identifier {
            return Self.prefix + "highlight(\(identifier))"
        } else {
            return Self.prefix + Self.name
        }
    }
}
