import Foundation

/// Represents the CSS ::column pseudo-element.
///
/// The `Column` pseudo-element represents the individual columns generated when a container
/// is set to display its content in multiple columns via CSS multi-column layout. It enables
/// applying styles that do not affect the layout to these generated fragments.
///
/// Example:
/// ```css
/// ul::column {
///     scroll-snap-align: center;
/// }
/// ```
///
/// The ::column pseudo-element:
/// - Represents individual columns in multi-column layouts
/// - Generated when using CSS multi-column layout properties
/// - Only accepts scroll snap properties that apply inside scroll containers
/// - Can have ::scroll-marker pseudo-elements
/// - Does not generate ::before or ::after pseudo-elements
/// - Useful for CSS carousels and scroll snap functionality
///
/// Accepted properties include:
/// - `scroll-margin`
/// - `scroll-snap-align`
/// - `scroll-snap-stop`
/// - Other scroll snap properties
///
/// Common use cases:
/// - Creating scrollable column layouts
/// - Implementing CSS carousels
/// - Setting scroll snap targets for columns
///
/// - Warning: This is experimental technology with limited browser support
///
/// - Note: Future property support will be limited to non-layout-affecting properties
///
/// - SeeAlso: [MDN Web Docs on ::column](https://developer.mozilla.org/en-US/docs/Web/CSS/::column)
public struct Column: CSSPseudoElement {
    @inlinable public static var name: String { "column" }

    public init() {}
}
