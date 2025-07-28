import Foundation

/// Represents the CSS ::marker pseudo-element.
///
/// The `Marker` pseudo-element selects the marker box of a list item, which typically
/// contains a bullet or number. It allows you to style the marker separately from the
/// list item content.
///
/// Example:
/// ```css
/// li::marker {
///     color: red;
///     font-size: 1.5em;
/// }
/// ```
///
/// The ::marker pseudo-element:
/// - Selects the marker box of list items
/// - Only applies to elements with `display: list-item`
/// - Supports only certain CSS properties (font, color, text-* properties)
/// - Is automatically generated for list items
/// - Can be styled independently of the list item content
///
/// Supported properties include:
/// - All font properties
/// - Color and text properties
/// - The `content` property
/// - Animation and transition properties
///
/// - SeeAlso: [MDN Web Docs on ::marker](https://developer.mozilla.org/en-US/docs/Web/CSS/::marker)
public struct Marker: CSSPseudoElement {
    @inlinable public static var name: String { "marker" }

    public init() {}
}
