import Foundation

/// Represents the CSS ::first-line pseudo-element.
///
/// The `FirstLine` pseudo-element applies styles to the first line of a block container.
/// The effects are limited by the length and content of the first line, which depends on
/// factors like element width, document width, and font size.
///
/// Example:
/// ```css
/// p::first-line {
///     font-size: 1.2rem;
///     font-weight: bold;
///     text-decoration: underline;
/// }
/// ```
///
/// The ::first-line pseudo-element:
/// - Applies styles to the first line of block containers
/// - Has no effect when the first child is an inline block-level element
/// - Behaves like an inline-level element for background purposes
/// - Only supports a limited subset of CSS properties
/// - Background may not extend to the right margin in left-justified text
///
/// Supported properties include:
/// - All font-related properties
/// - All background-related properties
/// - `color`
/// - Text spacing: `word-spacing`, `letter-spacing`
/// - Text styling: `text-decoration`, `text-transform`, `text-shadow`
/// - Layout: `line-height`, `vertical-align`
///
/// Unsupported properties include:
/// - Margin and padding properties
/// - Border properties
/// - `text-indent`
/// - Most layout and positioning properties
///
/// Special characteristics:
/// - First line length is dynamically determined by layout
/// - Only affects block-level containers
/// - Cannot be used on inline elements
/// - Works with SVG `<text>` elements (limited support)
///
/// - Note: Both `::first-line` (preferred) and `:first-line` syntax are supported
///
/// - SeeAlso: [MDN Web Docs on ::first-line](https://developer.mozilla.org/en-US/docs/Web/CSS/::first-line)
public struct FirstLine: CSSPseudoElement {
    @inlinable public static var name: String { "first-line" }

    public init() {}
}
//
