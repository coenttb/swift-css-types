import Foundation

/// Represents the CSS ::slotted() pseudo-element.
///
/// The `Slotted` pseudo-element represents any element that has been placed into
/// a slot inside an HTML template. It allows styling of slotted content from
/// within a shadow DOM.
///
/// Example:
/// ```css
/// ::slotted(span) {
///     font-weight: bold;
///     color: red;
/// }
/// ```
///
/// The ::slotted() pseudo-element:
/// - Accepts a compound selector parameter
/// - Can only be used inside CSS defined within a shadow DOM
/// - Represents elements assigned to a particular slot
/// - Only matches the top-level elements placed into a slot
/// - Is part of the Web Components specification
///
/// - SeeAlso: [MDN Web Docs on ::slotted()](https://developer.mozilla.org/en-US/docs/Web/CSS/::slotted)
public struct Slotted: CSSPseudoElement {
    @inlinable public static var name: String { "slotted" }

    /// The compound selector for slotted content
    public let selector: String?

    public init(_ selector: String? = nil) {
        self.selector = selector
    }
}

/// Provides string conversion for CSS output
extension Slotted: CustomStringConvertible {
    /// Converts the ::slotted() pseudo-element to its CSS string representation
    public var description: String {
        if let selector = selector {
            return Self.prefix + "slotted(\(selector))"
        } else {
            return Self.prefix + Self.name
        }
    }
}
