import Foundation

/// Represents the CSS ::selection pseudo-element.
///
/// The `Selection` pseudo-element applies styles to the part of a document that has
/// been highlighted by the user (such as clicking and dragging the mouse across text).
///
/// Example:
/// ```css
/// ::selection {
///     background: #ffb7b7;
///     color: #000;
/// }
/// ```
///
/// The ::selection pseudo-element:
/// - Applies to text that has been selected/highlighted by the user
/// - Only supports a limited set of CSS properties
/// - Can be applied globally or to specific elements
/// - Is triggered by user interaction (text selection)
/// - Overrides the browser's default selection styling
///
/// Supported properties include:
/// - `color`
/// - `background-color`
/// - `text-decoration` and related properties
/// - `text-shadow`
/// - `stroke`, `fill`, and `stroke-width` (for SVG)
///
/// - SeeAlso: [MDN Web Docs on ::selection](https://developer.mozilla.org/en-US/docs/Web/CSS/::selection)
public struct Selection: CSSPseudoElement {
    @inlinable public static var name: String { "selection" }

    public init() {}
}
