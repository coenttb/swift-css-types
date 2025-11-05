import Foundation

/// Represents the CSS ::part() pseudo-element.
///
/// The `Part` pseudo-element represents any element within a shadow tree that has a
/// matching part attribute. It allows styling of specific parts of a shadow DOM
/// from outside the shadow tree.
///
/// Example:
/// ```css
/// custom-element::part(tab) {
///     color: #0c0dcc;
///     border-bottom: transparent solid 2px;
/// }
/// ```
///
/// The ::part() pseudo-element:
/// - Accepts a part name parameter
/// - Used to style shadow DOM elements from outside the shadow tree
/// - Requires the target element to have a `part` attribute
/// - Provides a way to create styling contracts for Web Components
/// - Is part of the CSS Shadow Parts specification
///
/// - SeeAlso: [MDN Web Docs on ::part()](https://developer.mozilla.org/en-US/docs/Web/CSS/::part)
public struct Part: CSSPseudoElement {
    @inlinable public static var name: String { "part" }

    /// The part name to select
    public let partName: String?

    public init(_ partName: String? = nil) {
        self.partName = partName
    }
}

/// Provides string conversion for CSS output
extension Part: CustomStringConvertible {
    /// Converts the ::part() pseudo-element to its CSS string representation
    public var description: String {
        if let partName = partName {
            return Self.prefix + "part(\(partName))"
        } else {
            return Self.prefix + Self.name
        }
    }
}
