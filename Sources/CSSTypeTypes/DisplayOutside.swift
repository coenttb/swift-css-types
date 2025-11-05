import Foundation

/// Represents CSS display outside values that determine the element's outer display type.
///
/// The `DisplayOutside` data type specifies the element's outer display type, which defines
/// its role in flow layout. These values can be used alone or combined with an inner display
/// type in the `display` property.
///
/// Example:
/// ```swift
/// .display(.block)          // Block-level element
/// .display(.inline)         // Inline element
/// .display(.block, .flex)   // Block-level flex container
/// ```
///
/// - Note: When browsers encounter a display property with only an outer display value,
///         the inner value defaults to flow (e.g., `display: block` is equivalent to
///         `display: block flow`).
///
/// - SeeAlso: [MDN Web Docs on display-outside values](https://developer.mozilla.org/en-US/docs/Web/CSS/display-outside)
public enum DisplayOutside: String, Sendable, Hashable {
    /// Block-level element
    ///
    /// The element generates a block element box, generating line breaks both before
    /// and after the element when in the normal flow.
    /// ```css
    /// display: block;
    /// ```
    case block

    /// Inline element
    ///
    /// The element generates one or more inline element boxes that do not generate line breaks
    /// before or after themselves. In normal flow, the next element will be on the same line
    /// if there is space.
    /// ```css
    /// display: inline;
    /// ```
    case inline

    /// Run-in element (rarely used)
    ///
    /// The element generates a run-in box. If the following element generates a block box,
    /// the run-in box becomes the first inline box of the block box.
    /// ```css
    /// display: run-in;
    /// ```
    /// - Note: This value is rarely used and has poor browser support.
    case runIn = "run-in"
}

/// Provides string conversion for CSS output
extension DisplayOutside: CustomStringConvertible {
    /// Converts the display outside value to its CSS string representation
    ///
    /// This method returns the raw string value for use in CSS properties.
    public var description: String {
        return rawValue
    }
}
